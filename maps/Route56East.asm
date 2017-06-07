const_value set 2
	const ROUTE_56_ROCK1
	const ROUTE_56_ROCK2
	const ROUTE_56_ROCK3
	const ROUTE_56_SIGHTSEER_MICHIO
	const ROUTE_56_SWIMMERF_YAEKO
	const ROUTE_56_HIKER_TEPPEI
	const ROUTE_56_ITEMBALL3

Route56East_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

TrainerSightSeerMichio:
	trainer EVENT_BEAT_SIGHTSEERM_MICHIO, SIGHTSEERM, MICHIO, SightSeerMichioSeenText, SightSeerMichioBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightSeerMichioAfterText
	waitbutton
	closetext
	end
	
SightSeerMichioSeenText:
	text "I am totally lost!"
	line "Do you know how to"
	cont "get to KINNOW"
	cont "ISLAND?"
	done

SightSeerMichioBeatenText:
	text "I remember now!"
	done

SightSeerMichioAfterText:
	text "That's right!"
	line "It's north of"
	cont "here!"
	done

TrainerSwimmerYaeko:
	trainer EVENT_BEAT_SWIMMERF_YAEKO, SWIMMERF, YAEKO, SwimmerYaekoSeenText, SwimmerYaekoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerYaekoAfterText
	waitbutton
	closetext
	end
	
SwimmerYaekoSeenText:
	text "Are you ready for"
	line "the shock of your"
	cont "life?"
	done

SwimmerYaekoBeatenText:
	text "Shocking!"
	done

SwimmerYaekoAfterText:
	text "STUNFISK lives in"
	line "water, but it is"
	cont "GROUND-type and"
	cont "ELECTRIC-type."
	done

TrainerHikerTeppei:
	trainer EVENT_BEAT_HIKER_TEPPEI, HIKER, TEPPEI, HikerTeppeiSeenText, HikerTeppeiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext HikerTeppeiAfterText
	waitbutton
	closetext
	end
	
HikerTeppeiSeenText:
	text "Hiking at sea?"
	
	para "No problem! Look"
	line "what I found ski-"
	cont "ttering around!"
	done

HikerTeppeiBeatenText:
	text "How cool is that?"
	done

HikerTeppeiAfterText:
	text "I wonder what"
	line "else lives in"
	cont "this cave."
	done
	
Route56TM:
	itemball TM_ATTRACT

Route56Rock:
	jumpstd smashrock
	
Route56East_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 21, 12, 3, CRYSTAL_CAVE_1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_ROCK, 23, 10, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_ROCK, 24, 13, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_ROCK, 22, 12, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56Rock, -1
	person_event SPRITE_COOLTRAINER_M, 10, 44, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightSeerMichio, -1
	person_event SPRITE_SWIMMER_GIRL, 20, 34, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerYaeko, -1
	person_event SPRITE_POKEFAN_M, 24, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_TRAINER, 0, TrainerHikerTeppei, -1
	person_event SPRITE_POKE_BALL, 13, 44, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56TM, EVENT_ROUTE_56_TM

