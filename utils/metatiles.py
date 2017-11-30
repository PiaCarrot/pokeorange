#!/usr/bin/env python

"""
Generate a PNG of a 32x32 metatileset from its corresponding 8x8 tileset,
palette_map.asm file, and metatiles.bin file.
"""

from __future__ import print_function

import sys
import os
import os.path
import re
import array

from itertools import izip_longest

import png

def chunk(L, n, fillvalue=None):
	return izip_longest(*[iter(L)] * n, fillvalue=fillvalue)

def rgb_bytes(rgbs):
	for px in rgbs:
		yield px[0]
		yield px[1]
		yield px[2]

num_shades = 4
default_rgb = (0xAB, 0xCD, 0xEF)

class Tileset(object):
	p_per_t = 8

	def __init__(self, filename, palette_map):
		reader = png.Reader(filename=filename)
		self.w, self.h, data, metadata = reader.read_flat()
		self.wt, self.ht = self.w // Tileset.p_per_t, self.h // Tileset.p_per_t
		self.nt = self.wt * self.ht
		self.data = []

		if 'palette' in metadata:
			palette = metadata['palette']
			stride = 1
		else:
			palette = None
			stride = metadata['planes']
			if metadata['alpha']:
				stride += 1
		bitdepth = metadata['bitdepth']
		planes = metadata['planes']

		for i in range(self.w * self.h):
			px = data[i*stride:(i+1)*stride][0]
			if palette:
				px = palette[px][0]
			shade = px * num_shades // (2 ** bitdepth)

			color4 = palette_map.color4(self.tile_id_of_px(i))
			self.data.append(color4[shade])

	def tile(self, i):
		tile = []
		ty, tx = divmod(i, self.wt)
		for r in range(Tileset.p_per_t):
			start = ty*Tileset.p_per_t**2*self.wt + tx*Tileset.p_per_t + Tileset.p_per_t*self.wt*r
			row = self.data[start:start+Tileset.p_per_t]
			tile.extend(row)
		if not tile:
			tile = [default_rgb] * Tileset.p_per_t**2
		return tile

	def tile_id_of_px(self, i):
		wt = self.wt
		tw = Tileset.p_per_t
		return (i // wt // (tw * tw) * wt) + (i // tw % wt)

	def export_colored(self, filename):
		with open(filename, 'wb') as file:
			writer = png.Writer(self.w, self.h)
			writer.write(file, chunk(rgb_bytes(self.data), self.w * 3))

class PaletteMap(object):
	colors = {
		'GRAY':   [( 7*8, 7*8, 7*8), (13*8,13*8,13*8), (21*8,21*8,21*8), (27*8,31*8,27*8)],
		'RED':    [( 7*8, 7*8, 7*8), (30*8,10*8, 6*8), (31*8,19*8,24*8), (27*8,31*8,27*8)],
		'GREEN':  [( 7*8, 7*8, 7*8), ( 5*8,14*8, 0*8), (12*8,25*8, 1*8), (22*8,31*8,10*8)],
		'WATER':  [( 2*8,12*8,16*8), ( 4*8,19*8,24*8), (16*8,26*8,30*8), (23*8,29*8,31*8)],
		'YELLOW': [( 7*8, 7*8, 7*8), (31*8,16*8, 1*8), (31*8,31*8, 7*8), (27*8,31*8,27*8)],
		'BROWN':  [( 7*8, 7*8, 7*8), (20*8,15*8, 3*8), (24*8,18*8, 7*8), (27*8,31*8,27*8)],
		'ROOF':   [( 7*8, 7*8, 7*8), ( 5*8,17*8,31*8), (15*8,31*8,31*8), (27*8,31*8,27*8)],
		'TEXT':   [( 0*8, 0*8, 0*8), (16*8, 0*8,16*8), (31*8, 0*8,31*8), (31*8, 0*8,31*8)],
	}
	for key in colors.keys():
		colors['PRIORITY_' + key] = colors[key]

	default_color = [default_rgb] * 4

	def __init__(self, filename):
		self.data = []
		with open(filename, 'r') as file:
			for line in file:
				line = line.strip()
				if line.startswith('tilepal'):
					eight = line[7:].split(',')[-8:]
					assert len(eight) == 8
					self.data.extend([PaletteMap.colors[c.strip()] for c in eight])

	def color4(self, i):
		return self.data[i] if 0 <= i < len(self.data) else PaletteMap.default_color

class Metatiles(object):
	t_per_m = 4

	def __init__(self, filename, tileset):
		self.tileset = tileset
		self.data = []
		with open(filename, 'rb') as file:
			i = 0
			while True:
				tile_indexes = [ord(c) for c in file.read(Metatiles.t_per_m**2)]
				if not len(tile_indexes):
					break
				metatile = [tileset.tile(ti) for ti in tile_indexes]
				self.data.append(metatile)
				i += 1

	def size(self):
		return len(self.data)

	def export_colored(self, filename):
		wm = 4
		hm = self.size() // wm
		if wm * hm < self.size():
			hm += 1
		overall_w = wm * Metatiles.t_per_m * Tileset.p_per_t
		overall_h = hm * Metatiles.t_per_m * Tileset.p_per_t
		data = [default_rgb] * (overall_w * overall_h)

		for d_i in range(overall_w * overall_h):
			d_y, d_x = divmod(d_i, wm * Metatiles.t_per_m * Tileset.p_per_t)
			m_x, r_x = divmod(d_x, Metatiles.t_per_m * Tileset.p_per_t)
			t_x, p_x = divmod(r_x, Tileset.p_per_t)
			m_y, r_y = divmod(d_y, Metatiles.t_per_m * Tileset.p_per_t)
			t_y, p_y = divmod(r_y, Tileset.p_per_t)
			m_i = m_y * wm + m_x
			t_i = t_y * Metatiles.t_per_m + t_x
			p_i = p_y * Tileset.p_per_t + p_x
			if m_i >= self.size():
				continue
			metatile = self.data[m_i]
			tile = metatile[t_i]
			pixel = tile[p_i]
			data[d_i] = pixel

		with open(filename, 'wb') as file:
			writer = png.Writer(overall_w, overall_h)
			writer.write(file, chunk(rgb_bytes(data), overall_w * 3))

def process(tileset_name, palette_map_name, metatiles_name):
	palette_map = PaletteMap(palette_map_name)
	tileset = Tileset(tileset_name, palette_map)
	metatiles = Metatiles(metatiles_name, tileset)

	tileset_colored_name = tileset_name[:-4] + '.colored.png'
	tileset.export_colored(tileset_colored_name)
	print('Exported', tileset_colored_name)

	metatiles_colored_name = metatiles_name[:-4] + '.png'
	metatiles.export_colored(metatiles_colored_name)
	print('Exported', metatiles_colored_name)

def main():
	valid = False
	if len(sys.argv) >= 2:
		tileset = sys.argv[1]
		if re.match(r'\d\d$', tileset):
			tileset = 'gfx/tilesets/%s.2bpp.lz' % tileset
		name_rx = r'gfx/tilesets/(\d\d)\.(?:2bpp\.lz|2bpp|png)$'
		name_match = re.match(name_rx, tileset)
		if name_match:
			number = name_match.group(1)
			palette_map = 'tilesets/%s_palette_map.asm' % number
			metatiles = 'tilesets/%s_metatiles.bin' % number
			valid = True
		elif len(sys.argv) == 4:
			palette_map = sys.argv[2]
			metatiles = sys.argv[3]
			valid = True

	if not valid:
		usage = '''Usage: %s tileset [palette_map.asm metatiles.bin]
       Generate a PNG of a metatileset for viewing

       If tileset is gfx/tilesets/##.{2bpp.lz,2bpp,png},
       the other parameters will be inferred as
       tilesets/##_palette_map.asm and tilesets/##_metatiles.bin.

       If tileset is ##, it will first be inferred as
       gfx/tilesets/##.2bpp.lz.'''
		print(usage % sys.argv[0], file=sys.stderr)
		sys.exit(1)

	if not tileset.endswith('.png'):
		os.system('python gfx.py png %s' % tileset)
	if tileset.endswith('.2bpp'):
		tileset = tileset[:-5] + '.png'
	elif tileset.endswith('.2bpp.lz'):
		tileset = tileset[:-8] + '.png'

	process(tileset, palette_map, metatiles)

if __name__ == '__main__':
	main()
