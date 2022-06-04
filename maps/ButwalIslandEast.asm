const_value = 1
	const BUTWAL_EAST_CROSS
	const BUTWAL_EAST_DIVER
	const BUTWAL_EAST_DIVE_HM

ButwalIslandEast_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap BUTWAL_ISLAND_UNDERWATER_EAST, 2, 4
	return

CrossBattle4Script:
	faceplayer
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossButwalIslandText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossButwalIslandWinLoss, 0
	setlasttalked BUTWAL_EAST_CROSS
	loadtrainer CROSS, 12
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotCharmander:
	winlosstext CrossButwalIslandWinLoss, 0
	setlasttalked BUTWAL_EAST_CROSS
	loadtrainer CROSS, 10
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossButwalIslandWinLoss, 0
	setlasttalked BUTWAL_EAST_CROSS
	loadtrainer CROSS, 11
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossButwalIslandLeavingNowText
	waitbutton
	closetext
	spriteface BUTWAL_EAST_CROSS, UP
	clearevent EVENT_BUTWAL_DIVE_HM
	appear BUTWAL_EAST_DIVE_HM
	playsound SFX_THROW_BALL
	applymovement BUTWAL_EAST_DIVE_HM, ButwalPokeballMovementData
	pause 20
	setevent EVENT_BUTWAL_DIVE_HM
	disappear BUTWAL_EAST_DIVE_HM
	pause 10
	spriteface BUTWAL_EAST_CROSS, DOWN
	playsound SFX_WARP_TO
	applymovement BUTWAL_EAST_CROSS, ButwalCrossMovementData
	disappear BUTWAL_EAST_CROSS
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	applymovement PLAYER, ButwalPlayerMovementData
	clearevent EVENT_BUTWAL_DIVER
	appear BUTWAL_EAST_DIVER
	showemote EMOTE_SHOCK, BUTWAL_EAST_DIVER, 15
	applymovement BUTWAL_EAST_DIVER, ButwalDiverMovementData1
	opentext
	writetext ButwalEastDiverText
	waitbutton
	verbosegiveitem HM_DIVE
	closetext
	applymovement BUTWAL_EAST_DIVER, ButwalDiverMovementData2
	disappear BUTWAL_EAST_DIVER
	setevent EVENT_BUTWAL_DIVER
	setevent EVENT_CROSS_DEFEATED_BUTWAL
	end
	
CrossButwalIslandText:
	text "CROSS: Heh. So you"
	line "came for it after"
	cont "all."
	
	para "I beat your wimpy"
	line "friend down to the"
	cont "ground!"
	
	para "If you want this"
	line "HM so badly, then"
	cont "take it by force!"
	done
	
CrossButwalIslandWinLoss:
	text "CROSS: Argh! You"
	line "think this is"
	cont "over, just because"
	cont "you won by fluke"
	cont "once or twice?"
	done

CrossButwalIslandLeavingNowText:
	text "CROSS: Hahaha!"
	line "I've already used"
	cont "this HM, I have"
	cont "no use for it."
	
	para "But you still do!"
	line "Serves you right!"
	done

ButwalEastDiverText:
	text "OUCH!"
	
	para "Hey, kid! Watch"
	line "where you throw"
	cont "things! Polluting"
	cont "ain't cool!"
	done

ButwalPokeballMovementData:
	fix_facing
	jump_step UP
	jump_step UP
	remove_fixed_facing
	step_end
	
ButwalDiverMovementData1:
	step DOWN
	step DOWN
	step_end
	
ButwalDiverMovementData2:
	step UP
	step UP
	step_end
	
ButwalCrossMovementData:
	teleport_from
	step_end
	
ButwalPlayerMovementData:
	step UP
	step_end
	
ButwalSign:
	jumptext ButwalSignText
	
ButwalSignText:
	text "BUTWAL ISLAND"
	done

ButwalEastHyperPotion:
	itemball ULTRA_BALL

ButwalEastZinc:
	itemball ULTRA_BALL

ButwalEastDiveBall:
	itemball DIVE_BALL
	
ButwalEastHiddenFullRestore:
	dwb EVENT_BUTWAL_EAST_HIDDEN_FULL_RESTORE, FULL_RESTORE

ButwalIslandEast_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 23, 9, SIGNPOST_READ, ButwalSign
	signpost 7, 5, SIGNPOST_ITEM, ButwalEastHiddenFullRestore

.ObjectEvents: db 6
	person_event SPRITE_ROCKER, 18, 6, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CrossBattle4Script, EVENT_CROSS_DEFEATED_BUTWAL
	person_event SPRITE_DIVER_MALE_SWIM, 15, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BUTWAL_DIVER
	person_event SPRITE_POKE_BALL, 17, 6, SPRITEMOVEDATA_ITEM_TREE, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BUTWAL_DIVE_HM
	person_event SPRITE_POKE_BALL, 39, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalEastHyperPotion, EVENT_BUTWAL_EAST_HYPER_POTION
	person_event SPRITE_POKE_BALL, 4, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalEastZinc, EVENT_BUTWAL_EAST_ZINC
	person_event SPRITE_POKE_BALL, 5, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalEastDiveBall, EVENT_BUTWAL_EAST_DIVE_BALL

