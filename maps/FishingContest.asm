const_value = 1
	const FISHING_CONTEST_GRAMPS
	const FISHING_CONTEST_SCIENTIST

FishingContest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FishingContestSign:
	jumptext FishingContestSignText
	
FishingContestSignText:
	text "NOTICE!"
	
	para "Please capture"
	line "here with some"
	cont "restraint!"
	
	para "Some #MON"
	line "only live in this"
	cont "area!"
	done
	
FishingContestNatPagleScript:
	jumptextfaceplayer FishingContestNatPagleText
	
FishingContestNatPagleText:
	text "If you ask me, the"
	line "best part about"
	cont "fishing is its"
	cont "slow pace. Gives"
	
	para "one time to think,"
	line "to reflect on past"
	cont "events and to plan"
	cont "for future ones."
	
	para "Oh, and it's also"
	line "a great excuse to"
	cont "drink. Heavily."
	done
	
UnnamedIslandTMScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_UNNAMED_ISLAND_2_TM
	closetext
	end

FishingContest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 15, 11, SIGNPOST_READ, FishingContestSign

.ObjectEvents: db 2
	person_event SPRITE_GRAMPS, 14, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FishingContestNatPagleScript, -1
	person_event SPRITE_SUPER_NERD, 12,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, UnnamedIslandTMScript, -1

