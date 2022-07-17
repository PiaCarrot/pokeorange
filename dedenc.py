# ported from my own shining.py
rate = 10485.76
vol = 3.2

import argparse, math, wave, random

# tree building
class HuffTree:
    def __init__(self,a,b,c):
        self.val = a
        self.left = b
        self.right = c

class HuffLeaf:
    def __init__(self,a,b):
        self.val = a
        self.id = b

def readsamp(src,pos,size,chs): # returns a value between -0.5 and 0.5
    t = 0
    for i in range(chs):
        tt = 0
        for j in range(size):
            tt = tt + (src[pos+i*size+j] << (j * 8))
        if size == 1: # 8-bit samples are usually unsigned
            tt = tt - 128 # negative
        elif tt > 256**size/2-1: tt = tt - 256**size # negative
        t = t + tt
    return t / chs / 256.0**size

# cubic spline interpolation
def cuinterpo(s,n):
    nn = int(n)
    p0 = s[nn]
    p1 = s[nn+1]
    m0 = (s[nn+1]-s[nn-1])/2
    m1 = (s[nn+2]-s[nn])/2
    t1 = math.modf(n)[0]
    t2 = math.pow(t1,2)
    t3 = math.pow(t1,3)
    return (2*t3-3*t2+1)*p0+(t3-2*t2+t1)*m0+(-2*t3+3*t2)*p1+(t3-t2)*m1
    
def writetree(tree,jrcnt,bits,dict):
    le = tree.left
    ri = tree.right
    if isinstance(le,HuffTree) and isinstance(ri,HuffTree):
        jrcnt = jrcnt+9
        res,jrcnt2 = writetree(le,jrcnt,bits+"0",dict)
        res2,jrcnt3 = writetree(ri,0,bits+"1",dict)
        if(jrcnt2-jrcnt > 127):
            outs = chr(0xe0+((jrcnt2-jrcnt)>>8))+chr((jrcnt2-jrcnt)%0x100)+res+res2
            jrcnt = jrcnt+1
        else: outs = chr(jrcnt2-jrcnt)+res+res2
        jrcnt = jrcnt2+jrcnt3
    elif isinstance(le,HuffTree) and isinstance(ri,HuffLeaf):
        jrcnt = jrcnt+10
        dict[ri.id] = bits+"1"
        res,jrcnt = writetree(le,jrcnt,bits+"0",dict)
        outs = chr(0x80+ri.id)+res
    else:
        jrcnt = jrcnt+13
        dict[le.id] = bits+"0"
        dict[ri.id] = bits+"1"
        outs = chr(0xc0+ri.id)+chr(le.id)
    return (outs,jrcnt)

def wavtoded(fd,ra,ch,wi):
    fdd = []
    fdl = []

    for i in range(0,len(fd),wi*ch): # amplify
        t = readsamp(fd, i, wi, ch)
        fdd.append(t * vol)
    fdd = fdd + [0.0]*2

    if abs(ra-rate)/rate > 0.05:
        for i in range(0,int((len(fdd)-2)*rate/ra)): # stretch
            fdl.append(cuinterpo(fdd,i*ra/rate))
    else: fdl = fdd

    for i in range(0,len(fdl)): # convert
        fdl[i] = min(max(fdl[i]+(8.0/15.0),0),1.0)

    # TPDF dither
    last = 8
    tp = []
    freq = {}
    random.seed(3490487757541254948)
    for i in fdl:
        ev = int(i*15)
        er = i*15.0 - ev
        eo = 0.0
        if er < 0.5: eo = 2.0*er*er
        else: eo = 1.0-(2.0*(1.0-er)*(1.0-er))
        if eo > random.random(): ev = ev+1
        ew = (ev-last)%16
        tp.append(ew)
        if ew not in freq: freq[ew] = 0
        freq[ew] = freq[ew] + 1
        last = ev
    while len(tp) % 32 != 0: tp.append(0)

    qu = []
    for i in freq.keys(): qu.append(HuffLeaf(freq[i],i))
    while len(qu) > 1:
        qu = sorted(qu, key=lambda x: x.val)
        le = qu.pop(0)
        ri = qu.pop(0)
        if isinstance(le,HuffLeaf) and isinstance(ri,HuffTree):
            tmp = ri
            ri = le
            le = tmp
        qu.append(HuffTree(le.val+ri.val,le,ri))

    # tree writing
    code = {}
    ls = writetree(qu[0],0,"",code)[0] + chr(0xff)

    # compression
    ou = ""
    for i in range(len(tp)): ou = ou + code[tp[i]]
    while len(ou) % 8 != 0: ou = ou + "1"

    ls = ls + chr((len(tp)//32)%256) + chr((len(tp)//32)>>8)
    for i in range(0,len(ou),8): ls = ls + chr(int(ou[i:i+8],2))
    return ls

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('fi', metavar='in', type=argparse.FileType('rb'), help='Input file name')
    parser.add_argument('fo', metavar='out', type=argparse.FileType('wb'), help='Output file name')
    nsp = parser.parse_args()

    fl = wave.open(nsp.fi,"rb")
    nf = fl.getnframes()
    ous = wavtoded(fl.readframes(nf), fl.getframerate(), fl.getnchannels(), fl.getsampwidth())
    fl.close()
    nsp.fo.write(ous.encode('latin1'))
    nsp.fo.close()