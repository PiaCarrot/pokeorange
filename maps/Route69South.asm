const_value = 1
	const ROUTE_69_POKEBALL_1
	const ROUTE_69_POKEBALL_2
	const ROUTE_69_POKEBALL_3
	const ROUTE_69_COOLTRAINER_MAKO
	const ROUTE_69_POKEBALL_4
	const ROUTE_69_NURSE

Route69South_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadSign:
	jumptext VictoryRoadSignText
	
VictoryRoadSignText:
	text "ROUTE 69"
	line "VICTORY ROAD"
	done

Route69SouthUltraBall:
	itemball ULTRA_BALL

Route69SouthFullRestore:
	itemball FULL_RESTORE

Route69SouthMaxEther:
	itemball MAX_ETHER
	
;=================================
;=================================	
TrainerCooltrainerMMako:
	trainer EVENT_BEAT_COOLTRAINERM_MAKO, COOLTRAINERM, MAKO, CooltrainerMMakoSeenText, CooltrainerMMakoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMMakoAfterText
	waitbutton
	closetext
	end

CooltrainerMMakoSeenText:
	text "This battle is so"
	line "going on #TUBE!"
	done

CooltrainerMMakoBeatenText:
	text "This better get"
	line "a hundred likes!"
	done

CooltrainerMMakoAfterText:
	text "#TUBE stardom,"
	line "here I come!"
	done
	
Route69DragonPulse:
	itemball TM_DRAGON_PULSE

Route69NurseScript:
	faceplayer
	opentext
	writetext Route69NurseText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route69NurseHealedText
	waitbutton
	closetext
	end

Route69NurseText:
	text "Hello trainer!"

	para "Victory Road is"
	line "just ahead, so be"
	cont "sure you are fully"
	cont "prepared!"
	
	para "Let me heal your"
	line "party."
	done

Route69NurseHealedText:
	text "Good luck."

	para "You'll need it."
	done

Route69South_MapEventHeader::

.Warps: db 15
	warp_def 41, 23, 1, VICTORY_ROAD_F1
	warp_def 39, 21, 2, VICTORY_ROAD_F1
	warp_def 39, 17, 3, VICTORY_ROAD_F1
	warp_def 35, 21, 1, VICTORY_ROAD_F2
	warp_def 35, 16, 2, VICTORY_ROAD_F2
	warp_def 33, 23, 3, VICTORY_ROAD_F2
	warp_def 25, 31, 1, VICTORY_ROAD_EAST
	warp_def 31, 18, 1, VICTORY_ROAD_F3
	warp_def 13, 22, 2, VICTORY_ROAD_F3
	warp_def 23, 18, 3, VICTORY_ROAD_F3
	warp_def 27, 11, 4, VICTORY_ROAD_F3
	warp_def 11,  5, 1, VICTORY_ROAD_EXIT_ROOM
	warp_def  7, 12, 2, VICTORY_ROAD_EXIT_ROOM
	warp_def 31,  6, 5, VICTORY_ROAD_F3
	warp_def  5, 17, 3, ROUTE_69_GATE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 44, 22, SIGNPOST_READ, VictoryRoadSign

.ObjectEvents: db 6
	person_event SPRITE_POKE_BALL, 60,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthUltraBall, EVENT_ROUTE_69_SOUTH_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 19,  9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthFullRestore, EVENT_ROUTE_69_SOUTH_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 29, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthMaxEther, EVENT_ROUTE_69_SOUTH_MAX_ETHER
	person_event SPRITE_COOLTRAINER_M, 23,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerMMako, -1
	person_event SPRITE_POKE_BALL, 15, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69DragonPulse, EVENT_ROUTE_69_DRAGON_PULSE
	person_event SPRITE_NURSE, 44, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route69NurseScript, -1


