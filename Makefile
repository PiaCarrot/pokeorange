ROM_NAME = pokeorange
TITLE = PKMNORANGE
MCODE = PKOR
ROMVERSION = 0x32
FILLER = 0x00


ifneq ($(wildcard rgbds-0.2.5/.*),)
RGBDS_DIR = rgbds-0.2.5/
else
RGBDS_DIR =
endif

RGBASM_FLAGS =
RGBLINK_FLAGS = -n $(ROM_NAME).sym -m $(ROM_NAME).map -p $(FILLER)
RGBFIX_FLAGS = -Cjv -t $(TITLE) -i $(MCODE) -n $(ROMVERSION) -p $(FILLER) -k 01 -l 0x33 -m 0x10 -r 3

CFLAGS = -O3


.SUFFIXES:
.PHONY: all clean orange debug bankfree freespace compare
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp


roms_md5      = roms.md5
bank_ends_txt = bank_ends.txt

PYTHON = python
CC     = gcc
RM     = rm -f
GFX    = $(PYTHON) gfx.py
LZ     = utils/lzcomp
MD5    = md5sum

includes  := $(PYTHON) scan_includes.py
bank_ends := $(PYTHON) utils/bank-ends.py $(ROM_NAME)


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


roms := $(ROM_NAME).gbc $(ROM_NAME)-0xff.gbc

all: orange

orange: $(ROM_NAME).gbc

debug: RGBASM_FLAGS += -DDEBUG
debug: $(ROM_NAME).gbc

bankfree: FILLER = 0xff
bankfree: ROM_NAME := $(ROM_NAME)-$(FILLER)
bankfree: $(ROM_NAME)-0xff.gbc

freespace: $(bank_ends_txt) $(roms_md5)

clean:
	$(RM) $(roms) $(orange_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: orange
	$(MD5) -c $(roms_md5)


$(LZ): $(LZ).c
	$(CC) $(CFLAGS) -o $@ $<

$(bank_ends_txt): orange bankfree ; $(bank_ends) > $@

$(roms_md5): orange
	$(MD5) $(ROM_NAME).gbc > $@


%.asm: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm $(RGBASM_FLAGS) -o $@ $<

%.gbc: $(orange_obj)
	$(RGBDS_DIR)rgblink $(RGBLINK_FLAGS) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_FLAGS) $@

%.png: ;
%.2bpp: %.png ; $(GFX) 2bpp $<
%.1bpp: %.png ; $(GFX) 1bpp $<
%.lz: % ; $(LZ) $< > $@

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;
