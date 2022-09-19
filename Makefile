ROM_NAME = pokeorange
TITLE = PKMNORANGE
MCODE = PKOR
ROMVERSION = 0x32
FILLER = 0xff


ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

RGBASM_FLAGS =
RGBLINK_FLAGS = -n $(ROM_NAME).sym -m $(ROM_NAME).map -l $(ROM_NAME).link -p $(FILLER)
RGBFIX_FLAGS = -Cjv -t $(TITLE) -i $(MCODE) -n $(ROMVERSION) -p $(FILLER) -k 01 -l 0x33 -m 0x10 -r 3

CFLAGS = -O3

ifeq ($(filter pss,$(MAKECMDGOALS)),pss)
RGBASM_FLAGS += -DPSS
endif
ifeq ($(filter debug,$(MAKECMDGOALS)),debug)
RGBASM_FLAGS += -DDEBUG
endif


.SUFFIXES:
.PHONY: all clean orange pss debug bankfree freespace compare
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp %.wav %.ded


roms_md5      = roms.md5
bank_ends_txt = bank_ends.txt

PYTHON   = python
CC       = gcc
RM       = rm -f
GFX      = $(PYTHON) gfx.py
LZ       = tools/lzcomp
INCLUDES = tools/scan_includes
MD5      = md5sum

bank_ends := $(PYTHON) utils/bank-ends.py $(ROM_NAME)


orange_obj := \
wram.o \
main.o \
home.o \
audio.o \
maps.o \
data/egg_moves.o \
data/evos_attacks.o \
data/pokedex/entries.o \
text/common_text.o \
gfx/pics.o


roms := $(ROM_NAME).gbc $(ROM_NAME)-0x00.gbc

all: orange

orange: $(ROM_NAME).gbc ; sort $(ROM_NAME).sym -o $(ROM_NAME).sym

pss: orange
debug: orange

bankfree: FILLER = 0x00
bankfree: ROM_NAME := $(ROM_NAME)-$(FILLER)
bankfree: $(ROM_NAME)-0x00.gbc

freespace: $(bank_ends_txt) $(roms_md5)


# Build tools when building the rom
ifeq ($(filter clean tools,$(MAKECMDGOALS)),)
Makefile: tools ;
endif

tools: $(LZ) $(INCLUDES)

$(LZ): CFLAGS = -O3 -flto -std=c11
$(LZ): $(wildcard tools/lz/*.c) $(wildcard tools/lz/*.h)
	$(CC) $(CFLAGS) -o $@ $(wildcard tools/lz/*.c)

$(INCLUDES): $(INCLUDES).c
	$(CC) $(CFLAGS) -o $@ $<


clean:
	$(RM) $(roms) $(orange_obj) $(roms:.gbc=.map) $(ROM_NAME)-0x00.sym

compare: orange
	$(MD5) -c $(roms_md5)


$(bank_ends_txt): orange bankfree ; $(bank_ends) > $@

$(roms_md5): orange
	$(MD5) $(ROM_NAME).gbc > $@


%.o: dep = $(shell $(INCLUDES) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm $(RGBASM_FLAGS) -o $@ $<

%.gbc: $(orange_obj)
	$(RGBDS_DIR)rgblink $(RGBLINK_FLAGS) -o $@ $^
	$(RGBDS_DIR)rgbfix $(RGBFIX_FLAGS) $@

%.2bpp: %.png ; $(GFX) 2bpp $<
%.1bpp: %.png ; $(GFX) 1bpp $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;

%.lz: % ; $(LZ) $< $@
%.wav: ;
%.ded: %.wav dedenc.py ; $(PYTHON) dedenc.py $< $@

%.png: ; $(error ERROR: No rule to make '$@')
%.asm: ; $(error ERROR: No rule to make '$@')
%.bin: ; $(error ERROR: No rule to make '$@')
%.blk: ; $(error ERROR: No rule to make '$@')
%.tilemap: ; $(error ERROR: No rule to make '$@')

