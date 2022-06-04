const_value = 1
	const VICTORY_ROAD_TRACEY

VictoryRoadExitRoom_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadTraceyScript:
	faceplayer
	showemote EMOTE_SHOCK, VICTORY_ROAD_TRACEY, 15
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyVictoryRoadText
	waitbutton
	closetext
	winlosstext TraceyVictoryRoadWinLoss, 0
	loadtrainer TRACEY_2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyVictoryRoadLeavingNowText
	waitbutton
	closetext
	applymovement VICTORY_ROAD_TRACEY, TraceyVR_Movement
	disappear VICTORY_ROAD_TRACEY
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_VICTORY_ROAD
	pause 10
	setevent EVENT_VICTORY_ROAD_TRACEY
	end
	
TraceyVictoryRoadText:
	text "TRACEY: So, you"
	line "made it out here,"
	cont "<PLAYER>!"
	
	para "Truth be told, I"
	line "was waiting for"
	cont "you to show up."
	
	para "That guy, CROSS."
	
	para "I tried to beat"
	line "him, to get him"
	cont "back for what he"
	cont "did on ASCORBIA."
	
	para "But, he's much"
	line "too strong."
	
	para "Anyway, I decided"
	line "to quit being a"
	cont "TRAINER to be a"
	cont "fulltime WATCHER!"
	
	para "So, <PLAYER>,"
	line "how about one last"
	cont "battle before I"
	cont "retire?!"
	done
	
TraceyVictoryRoadWinLoss:
	text "Absolutely bril-"
	line "liant."
	
	para "<PLAYER>."
	line "You are really"
	cont "something, y'know?"
	done
	
TraceyVictoryRoadLeavingNowText:
	text "<...>"
	
	para "Battling with you,"
	line "<PLAYER>."
	
	para "That's what reminds"
	line "me of what this is"
	cont "all about."
	
	para "But I have bigger"
	line "plans. I'm going to"
	cont "see PROF. OAK in"
	cont "KANTO!"
	
	para "I'll become his"
	line "AIDE and become a"
	cont "researcher!"
	
	para "Meet me in PALLET"
	line "TOWN, <PLAYER>."
	cont "Not as a TRAINER,"
	cont "but as a CHAMPION!"
	done
	
TraceyVR_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step RIGHT
	step RIGHT
	step_end
	
VictoryRoadExitRareCandy:
	itemball RARE_CANDY

VictoryRoadExitPPMax:
	itemball PP_MAX
	
VictoryRoadExitHiddenNugget:
	dwb EVENT_VICTORY_ROAD_EXIT_HIDDEN_NUGGET, NUGGET
	
VictoryRoadExitHiddenRevive:
	dwb EVENT_VICTORY_ROAD_EXIT_HIDDEN_REVIVE, REVIVE

VictoryRoadExitRoom_MapEventHeader::

.Warps: db 2
	warp_def 33,  5, 12, ROUTE_69_SOUTH
	warp_def 11, 25, 13, ROUTE_69_SOUTH

.CoordEvents: db 0

.BGEvents: db 2
	signpost 30,  2, SIGNPOST_ITEM, VictoryRoadExitHiddenNugget
	signpost 26, 10, SIGNPOST_ITEM, VictoryRoadExitHiddenRevive

.ObjectEvents: db 3
	person_event SPRITE_TRACEY,  3, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VictoryRoadTraceyScript, EVENT_VICTORY_ROAD_TRACEY
	person_event SPRITE_POKE_BALL, 18,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadExitRareCandy, EVENT_VICTORY_ROAD_EXIT_RARE_CANDY
	person_event SPRITE_POKE_BALL,  8,  8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadExitPPMax, EVENT_VICTORY_ROAD_EXIT_PP_MAX
