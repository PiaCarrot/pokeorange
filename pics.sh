#!/usr/bin/env bash

mkdir -p backs
mkdir -p fronts

chmod +x gfx.py

echo Create all front.png ...
find gfx/pics ! -path gfx/pics ! -path gfx/pics/unown ! -path gfx/pics/egg ! -path gfx/pics/questionmark -type d -exec ./gfx.py png {}/front.2bpp.lz \;

echo Create all back.png ...
find gfx/pics ! -path gfx/pics ! -path gfx/pics/unown ! -path gfx/pics/egg ! -path gfx/pics/questionmark -type d -exec ./gfx.py png {}/back.2bpp.lz \;

echo Move all front.png ...
for f in gfx/pics/*/front.png; do g=${f:9}; h=${g%/front.png}; mv gfx/pics/$h/front.png fronts/$h.png; done

echo Move all back.png ...
for f in gfx/pics/*/back.png; do g=${f:9}; h=${g%/back.png}; mv gfx/pics/$h/back.png backs/$h.png; done

echo Remove all front.2bpp and back.2bpp ...
rm -f gfx/pics/*/front.2bpp gfx/pics/*/back.2bpp