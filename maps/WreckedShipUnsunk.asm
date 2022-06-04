const_value = 1
	const WRECKED_SHIP_SHADOW_BALL
	const WRECKED_SHIP_MIMIKYU

WreckedShipUnsunk_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP_UNDERWATER, 0, 0
	return
	
WreckedShipTMShadowBall:
	itemball TM_SHADOW_BALL

WreckedShipHiddenRareCandy:
	dwb EVENT_WRECKED_SHIP_HIDDEN_RARE_CANDY, RARE_CANDY
	
MimikyuScript:
	faceplayer
	opentext
	writetext MimikyuText
	cry MIMIKYU
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MIMIKYU, 40
	startbattle
	disappear WRECKED_SHIP_MIMIKYU
	reloadmapafterbattle
	setevent EVENT_MIMIKYU_FOUGHT
	end

MimikyuText:
	text "Khuuuuu!"
	done
	
WreckedShipUnsunk_MapEventHeader::

.Warps: db 3
	warp_def 15, 18, 3, WRECKED_SHIP_UNSUNK
	warp_def 9, 4, 1, WRECKED_SHIP_UNSUNK
	warp_def 9, 5, 1, WRECKED_SHIP_UNSUNK

.CoordEvents: db 0

.BGEvents: db 1
	signpost 20, 16, SIGNPOST_ITEM, WreckedShipHiddenRareCandy

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 21, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WreckedShipTMShadowBall, EVENT_WRECKED_SHIP_TM_SHADOW_BALL
	person_event SPRITE_PIKACHU, 7, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, 0, 0, MimikyuScript, EVENT_MIMIKYU_FOUGHT

