PYTHON := python
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean orange bankfree
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py


orange_obj := \
wram.o \
main.o \
home.o \
audio.o \
maps.o \
engine/events.o \
engine/credits.o \
data/egg_moves.o \
data/evos_attacks.o \
data/pokedex/entries.o \
text/common_text.o \
gfx/pics.o


roms := pokeorange.gbc pokeorange-0xff.gbc

all: orange
orange: pokeorange.gbc
bankfree: pokeorange-0xff.gbc

clean:
	rm -f $(roms) $(orange_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokeorange.gbc
	@$(MD5) roms.md5

%.asm: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ $<

pokeorange.gbc: $(orange_obj)
	rgblink -n pokeorange.sym -m pokeorange.map -p 0 -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PKMNORANGE $@

pokeorange-0xff.gbc: $(orange_obj)
	rgblink -n pokeorange.sym -m pokeorange.map -p 0xff -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0xff -r 3 -t PKMNORANGE $@

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz: % ; $(gfx) lz $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
