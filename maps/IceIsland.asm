const_value = 1
	const ICE_ISLAND_CAPTURE_RING_1
	const ICE_ISLAND_CAPTURE_RING_2
	const ICE_ISLAND_CUTSCENE_ZAPDOS
	const ICE_ISLAND_CUTSCENE_ARTICUNO
	const ICE_ISLAND_ARTICUNO
	const ICE_ISLAND_LAWRENCE
	const ICE_ISLAND_NEVERMELTICE


IceIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

IceIslandCutscene:
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, IceIslandPlayerMovement
	spriteface PLAYER, UP
	playmusic MUSIC_CASTLE_ROUTE
	opentext
	writetext IceIslandLawrenceText1
	waitbutton
	closetext
	winlosstext IceIslandLawrenceWinLoss, 0
	loadtrainer LAWRENCE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_CASTLE_ROUTE
	applymovement PLAYER, IceIslandPlayerMovement2
	opentext
	writetext IceIslandLawrenceText2
	waitbutton
	closetext
	pause 15
	cry ZAPDOS
	pause 15
	cry ARTICUNO
	clearevent EVENT_ICE_ISLAND_CAPTURE_RINGS
	appear ICE_ISLAND_CAPTURE_RING_1
	appear ICE_ISLAND_CAPTURE_RING_2
	applymovement ICE_ISLAND_CAPTURE_RING_1, IceIslandCaptureRing1Movement
	applymovement ICE_ISLAND_CAPTURE_RING_2, IceIslandCaptureRing2Movement
	opentext
	writetext IceIslandLawrenceText3
	waitbutton
	closetext
	disappear ICE_ISLAND_CUTSCENE_ZAPDOS
	disappear ICE_ISLAND_CUTSCENE_ARTICUNO
	disappear ICE_ISLAND_LAWRENCE
	disappear ICE_ISLAND_CAPTURE_RING_1
	disappear ICE_ISLAND_CAPTURE_RING_2
	special Special_FadeInQuickly
	pause 20
	playmapmusic
	pause 10
	domaptrigger ICE_ISLAND, $1
	setevent EVENT_BEAT_LAWRENCE_ICE_ISLAND
	setevent ICE_ISLAND_CAPTURE_RING_1
	clearevent EVENT_AIRSHIP_BIRDS
	end
	
IceIslandLawrenceText1:
	text "LAWRENCE: Peasant."
	
	para "Can't you see I'm"
	line "a bit occupied at"
	cont "the moment?"
	
	para "Behold, legendary"
	line "#MON ZAPDOS and"
	cont "ARTICUNO!"
	
	para "I gather it's your"
	line "first time seeing"
	cont "one? Hmph."
	
	para "Well, seeing as"
	line "you intend to get"
	cont "in my way<...>"
	
	para "Here's your reward!"
	done
	
IceIslandLawrenceWinLoss:
	text "No matter."
	
	para "In just a moment,"
	line "I will become"
	cont "unstoppable!"
	done
	
IceIslandLawrenceText2:
	text "LAWRENCE: Execute"
	line "capture protocol,"
	cont "terminal. Targets"
	cont "are ZAPDOS and"
	cont "ARTICUNO."
	
	para "And send transport"
	line "for myself."
	
	para "<...>"
	
	para "Capture Protocol"
	line "Initiated."
	done
	
IceIslandLawrenceText3:
	text "LAWRENCE: Now to"
	line "simply wait from"
	cont "the comfort of my"
	cont "FLYING PALACE."
	
	para "Best of luck to"
	line "follow me up"
	cont "there."
	
	para "Fare thee well,"
	line "trainer."
	done
	
IceIslandPlayerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
IceIslandPlayerMovement2:
	fix_facing
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	remove_fixed_facing
	step_end
	
IceIslandCaptureRing1Movement:
	fix_facing
	step DOWN
	step DOWN
	step DOWN
	remove_fixed_facing
	step_end
	
IceIslandCaptureRing2Movement:
	fix_facing
	step DOWN
	step DOWN
	step DOWN
	remove_fixed_facing
	step_end

IceIslandNevermeltice:
	itemball NEVERMELTICE
	
IceIslandShrine:
	checkevent EVENT_OBTAINED_ICE_ORB
	iftrue .LawrenceCheck
	giveitem ICE_ORB
	opentext
	writetext ObtainedIceOrbText
	playsound SFX_GET_BADGE
	waitsfx
	waitbutton
	closetext
	setevent EVENT_OBTAINED_ICE_ORB
	end
	
.LawrenceCheck:
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .ArticunoCheck
	opentext
	writetext IceIslandShrineText
	waitbutton
	closetext
	end
	
.ArticunoCheck:
	checkevent EVENT_ARTICUNO_FOUGHT
	iftrue .ArticunoAlreadyBattled
	special Special_FadeOutMusic
	pause 15
	cry ARTICUNO
	showemote EMOTE_SHOCK, PLAYER, 15
	clearevent EVENT_ARTICUNO_APPEARS
	appear ICE_ISLAND_ARTICUNO
	applymovement ICE_ISLAND_ARTICUNO, ArticunoIceIslandMovement
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ARTICUNO, 65
	startbattle
	disappear ICE_ISLAND_ARTICUNO
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_ARTICUNO_FOUGHT
	setevent EVENT_ARTICUNO_APPEARS
	end
	
.ArticunoAlreadyBattled:
	opentext
	writetext IceIslandShrineText
	waitbutton
	closetext
	end
	
ArticunoIceIslandMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

ObtainedIceOrbText:
	text "<PLAYER> obtained"
	line "the ICE ORB!"
	done

IceIslandShrineText:
	text "The shrine is"
	line "cracking from the"
	cont "sub-zero temp-"
	cont "erature."
	done

IceIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 1
	xy_trigger 0,  5, 15, IceIslandCutscene

.BGEvents: db 1
	signpost  4, 18, SIGNPOST_READ, IceIslandShrine

.ObjectEvents: db 7
	person_event SPRITE_CAPTURE_RING,  4, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, EVENT_ICE_ISLAND_CAPTURE_RINGS
	person_event SPRITE_CAPTURE_RING,  4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, EVENT_ICE_ISLAND_CAPTURE_RINGS
	person_event SPRITE_ZAPDOS,  7, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, 0, EVENT_BEAT_LAWRENCE_ICE_ISLAND
	person_event SPRITE_ARTICUNO,  7, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, EVENT_BEAT_LAWRENCE_ICE_ISLAND
	person_event SPRITE_ARTICUNO,  0, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, EVENT_ARTICUNO_APPEARS
	person_event SPRITE_LAWRENCE,  5, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, 0, EVENT_BEAT_LAWRENCE_ICE_ISLAND
	person_event SPRITE_POKE_BALL, 19,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IceIslandNevermeltice, EVENT_ICE_ISLAND_NEVERMELTICE
