const_value = 1
	const MIRACLE_SEED_LADY
	const MIRACLE_SEED_GLOOM

KumquatHouse1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MiracleSeedLady:
	faceplayer
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED
	iftrue .AlreadyGotMiracleSeed
    writetext GiveMiracleSeedText
	waitbutton
	verbosegiveitem MIRACLE_SEED
	iffalse MiracleSeedLadyDoneScript
	setevent EVENT_GOT_MIRACLE_SEED
	closetext
	end

.AlreadyGotMiracleSeed:
    writetext GotMiracleSeedText
	waitbutton
	closetext
	end

MiracleSeedLadyDoneScript:
	closetext
	end
	
GiveMiracleSeedText:
	text "GRASS-type #MON"
	line "need a lot of care"
	cont "and love to grow."
	
	para "Here's something"
	line "that might help!"
	done

GotMiracleSeedText:
	text "MIRACLE SEED will"
	line "increase damage"
	cont "from GRASS-type"
	cont "attacks."
	done
	
MiracleSeedGloomScript:
	faceplayer
	opentext
	writetext GloomText
	cry GLOOM
	waitbutton
	closetext
	end
	
GloomText:
	text "Glooom<...>"
	done

KumquatHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 2, KUMQUAT_ISLAND_EAST
	warp_def 7, 3, 2, KUMQUAT_ISLAND_EAST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_TEACHER,  4,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MiracleSeedLady, -1
	person_event SPRITE_GLOOM, 6, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MiracleSeedGloomScript, -1

