const_value = 1
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Oak:
	faceplayer
	opentext
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see<...>"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OaksAssistant1Text:
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here<...>"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "<...>"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAYER> is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done

OaksLab_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 16
	signpost 1, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 1, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 0, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 1, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 2, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 3, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 6, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 7, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 8, SIGNPOST_READ, OaksLabBookshelf
	signpost 7, 9, SIGNPOST_READ, OaksLabBookshelf
	signpost 0, 4, SIGNPOST_READ, OaksLabPoster1
	signpost 0, 5, SIGNPOST_READ, OaksLabPoster2
	signpost 3, 9, SIGNPOST_READ, OaksLabTrashcan
	signpost 1, 0, SIGNPOST_READ, OaksLabPC

.PersonEvents: db 4
	person_event SPRITE_OAK, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Oak, -1
	person_event SPRITE_SCIENTIST, 8, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	person_event SPRITE_SCIENTIST, 9, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	person_event SPRITE_SCIENTIST, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OaksAssistant3Script, -1
