const_value = 1
	const FIRE_ISLAND_MOLTRES
	const FIRE_ISLAND_FIRE_STONE
	const FIRE_ISLAND_KINGS_ROCK

FireIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FireIslandFirestone:
	itemball FIRE_STONE
	
FireIslandTradestone:
	itemball TRADE_STONE
	
FireIslandShrine:
	checkevent EVENT_OBTAINED_FIRE_ORB
	iftrue .LawrenceCheck
	giveitem FIRE_ORB
	opentext
	writetext ObtainedFireOrbText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	setevent EVENT_OBTAINED_FIRE_ORB
	end
	
.LawrenceCheck:
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .MoltresCheck
	opentext
	writetext FireIslandShrineText
	waitbutton
	closetext
	end
	
.MoltresCheck:
	checkevent EVENT_MOLTRES_FOUGHT
	iftrue .MoltresAlreadyBattled
	special Special_FadeOutMusic
	pause 15
	cry MOLTRES
	showemote EMOTE_SHOCK, PLAYER, 15
	clearevent EVENT_MOLTRES_APPEARS
	appear FIRE_ISLAND_MOLTRES
	applymovement FIRE_ISLAND_MOLTRES, MoltresFireIslandMovement
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon MOLTRES, 65
	startbattle
	disappear FIRE_ISLAND_MOLTRES
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_MOLTRES_FOUGHT
	setevent EVENT_MOLTRES_APPEARS
	end
	
.MoltresAlreadyBattled:
	opentext
	writetext FireIslandShrineText
	waitbutton
	closetext
	end
	
MoltresFireIslandMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

ObtainedFireOrbText:
	text "<PLAYER> obtained"
	line "the FIRE ORB!"
	done

FireIslandShrineText:
	text "The shrine is very"
	line "hot to the touch."
	cont "The stone looks"
	cont "like it may melt."
	done

FireIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 1
	signpost 34, 10, SIGNPOST_READ, FireIslandShrine

.ObjectEvents: db 3
	person_event SPRITE_MOLTRES, 30, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, 0, EVENT_MOLTRES_APPEARS
	person_event SPRITE_POKE_BALL, 18, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FireIslandFirestone, EVENT_FIRE_ISLAND_FIRE_STONE
	person_event SPRITE_POKE_BALL, 26,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FireIslandTradestone, EVENT_FIRE_ISLAND_TRADE_STONE
