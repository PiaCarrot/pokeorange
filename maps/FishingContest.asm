const_value set 1

FishingContest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FishingContestSign:
	jumptext FishingContestSignText
	
FishingContestSignText:
	text "FISHING CONTEST"
	line "RULES"
	
	para "1. 20 Minute Time"
	line "Limit"
	
	para "2. Only 20 Contest"
	line "Balls Allowed"
	
	para "3. Biggest Catch"
	line "Wins!"
	done
	
FishingContestFisher1Script:
	jumptextfaceplayer FishingContestFisher1Text
	
FishingContestFisher1Text:
	text "Patience<...>"
	
	para "I can feel it!"
	line "A rare #MON!"
	done

FishingContestFisher2Script:
	jumptextfaceplayer FishingContestFisher2Text
	
FishingContestFisher2Text:
	text "In my lifetime,"
	line "I have caught hun-"
	cont "dreds of #MON"
	cont "with this ROD!"
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

FishingContest_MapEventHeader::

.Warps: db 2
	warp_def 10, 0, 3, FISHING_CONTEST_LOBBY
	warp_def 11, 0, 4, FISHING_CONTEST_LOBBY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 15, 11, SIGNPOST_READ, FishingContestSign

.ObjectEvents: db 3
	person_event SPRITE_FISHER, 21, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FishingContestFisher1Script, -1
	person_event SPRITE_FISHER, 14, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FishingContestNatPagleScript, -1
	person_event SPRITE_FISHING_GURU, 6, 10, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FishingContestFisher2Script, -1

