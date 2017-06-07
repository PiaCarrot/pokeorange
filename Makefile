ROM_NAME = pokeorange

TITLE = PKMNORANGE
MCODE = PKOR
ROMVERSION = 0x32
FILLER = 0x00
ALTFILLER = 0xff

RGBDS_DIR = rgbds-0.2.5/
RGBASM_OPTIONS =
RGBFIX_OPTIONS = -Cjv -t $(TITLE) -i $(MCODE) -n $(ROMVERSION) -k 01 -l 0x33 -m 0x10 -r 3


.SUFFIXES:
.PHONY: all clean orange debug bankfree
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp


PYTHON := python
MD5 := md5sum -c --quiet
RM := rm -f

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


roms := pokeorange.gbc pokeorange-$(ALTFILLER).gbc

all: orange
orange: $(ROM_NAME).gbc
debug: RGBASM_OPTIONS += -DDEBUG
debug: $(ROM_NAME).gbc
bankfree: $(ROM_NAME)-$(ALTFILLER).gbc

clean:
	$(RM) $(roms) $(orange_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokeorange.gbc
	@$(MD5) roms.md5

%.asm: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm $(RGBASM_OPTIONS) -o $@ $<

$(ROM_NAME).gbc: $(orange_obj)
	$(RGBDS_DIR)rgblink -n $(ROM_NAME).sym -m $(ROM_NAME).map -p $(FILLER) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_OPTIONS) -p $(FILLER) $@

$(ROM_NAME)-$(ALTFILLER).gbc: $(orange_obj)
	$(RGBDS_DIR)rgblink -n $(ROM_NAME).sym -m $(ROM_NAME).map -p $(ALTFILLER) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_OPTIONS) -p $(ALTFILLER) $@

%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz: % ; $(gfx) lz $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
