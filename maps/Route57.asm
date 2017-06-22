const_value set 2
	const ROUTE_57_ITEMBALL
	const ROUTE_57_SWIMMER_GIRL
	const ROUTE_57_SIGHTSEERF
	const ROUTE_57_BUGCATCHERF

Route57_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

Route57SwimmerGirlScript:
	jumptextfaceplayer R57SwimmerGirlText
	
R57SwimmerGirlText:
	text "What? You thought"
	line "I was a trainer?"
	
	para "Some people just"
	line "like to swim!"
	end
	
TrainerSightSeerAsami:
	trainer EVENT_BEAT_SIGHTSEERF_ASAMI, SIGHTSEERM, ASAMI, SightSeerAsamiSeenText, SightSeerAsamiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightSeerAsamiAfterText
	waitbutton
	closetext
	end

SightSeerAsamiSeenText:
	text "The ORANGE ISLANDS"
	line "are wonderful!"
	
	para "Beautiful beaches,"
	line "cute boys, and of"
	cont "course, weak trai-"
	cont "ners!"
	done

SightSeerAsamiBeatenText:
	text "Kyaa!"
	done

SightSeerAsamiAfterText:
	text "I guess some of"
	line "you are strong"
	cont "after all."
	done
	
TrainerBugCatcherFAlia:
	trainer EVENT_BEAT_BUG_CATCHERF_ALIA, BUG_CATCHER_F, ALIA, BugCatcherFAliaSeenText, BugCatcherFAliaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BugCatcherFAliaAfterText
	waitbutton
	closetext
	end
	
BugCatcherFAliaSeenText:
	text "I don't see many"
	line "other girls who"
	cont "like BUG #MON."
	
	para "Is it really that"
	line "strange?"
	done
	
BugCatcherFAliaBeatenText:
	text "My cute BUGs!"
	done
	
BugCatcherFAliaAfterText:
	text "I hope I can meet"
	line "lots of BUG-type"
	cont "#MON collectors."
    done
	
Route57HardStone:
	itemball HARD_STONE

Route57_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 22, 4, 3, KINNOW_ISLAND_ROUTE_57_GATE
	warp_def 23, 4, 4, KINNOW_ISLAND_ROUTE_57_GATE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 27, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route57HardStone, EVENT_ROUTE_57_HARD_STONE
	person_event SPRITE_SWIMMER_GIRL, 17, 15, SPRITEMOVEDATA_SWIM_LEFT_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route57SwimmerGirlScript, -1
	person_event SPRITE_SIGHTSEER_F, 26, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerSightSeerAsami, -1
	person_event SPRITE_SIGHTSEER_F, 9, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerBugCatcherFAlia, -1

