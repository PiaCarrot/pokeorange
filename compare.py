#!/usr/bin/env python

"""Compare two ROMs and print their differences."""

from __future__ import print_function

import sys

def compare(rom1, rom2):
	with open(rom1, 'rb') as f:
		content1 = f.read()
	with open(rom2, 'rb') as g:
		content2 = g.read()
	for i, (b1, b2) in enumerate(zip(content1, content2)):
		b1, b2 = ord(b1), ord(b2)
		if b1 != b2:
			print('%06x: %02x %02x' % (i, b1, b2))

def main():
	if len(sys.argv) < 2:
		print('Usage: %s a.gbc b.gbc', file=sys.stderr)
		print('       Compare two similar ROMs', file=sys.stderr)
		sys.exit(1)
	compare(sys.argv[1], sys.argv[2])

if __name__ == '__main__':
	main()
