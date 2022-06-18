const_value = 1
	const ROUTE_56_FISHER_ISAO
	const ROUTE_56_RUNNER_KAITO
	const ROUTE_56_SWIMMERF_SAKAKO
	const ROUTE_56_SWIMMERM_NAOYA
	const ROUTE_56_TRACEY
	const ROUTE_56_ITEMBALL1
	const ROUTE_56_ITEMBALL2

Route56West_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route56Sign:
	jumptext Route56SignText

Route56SignText:
	text "ROUTE 56"
	line "EAST to KINNOW"
	cont "ISLAND."
	done

TrainerFisherIsao:
	trainer EVENT_BEAT_FISHER_ISAO, FISHER, ISAO, FisherIsaoSeenText, FisherIsaoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherIsaoAfterText
	waitbutton
	closetext
	end

FisherIsaoSeenText:
	text "Heh. You'd be"
	line "amazed if you"
	cont "could fish with a"
	cont "GOOD ROD."
	done

FisherIsaoBeatenText:
	text "I've been hooked!"
	done

FisherIsaoAfterText:
	text "I heard you can"
	line "get a GOOD ROD"
	cont "from MORO ISLAND."
	done

TrainerAthleteKaito:
	trainer EVENT_BEAT_ATHLETE_KAITO, ATHLETE, KAITO, AthleteKaitoSeenText, AthleteKaitoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteKaitoAfterText
	waitbutton
	closetext
	end

AthleteKaitoSeenText:
	text "My #MON are"
	line "all about speed!"
	done

AthleteKaitoBeatenText:
	text "That was fast!"
	done

AthleteKaitoAfterText:
	text "That was over in a"
	line "flash!"
	done

TrainerSwimmerSakako:
	trainer EVENT_BEAT_SWIMMERF_SAKAKO, SWIMMERF, SAKAKO, SwimmerSakakoSeenText, SwimmerSakakoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerSakakoAfterText
	waitbutton
	closetext
	end

SwimmerSakakoSeenText:
	text "Kyaa! Get away!"
	done

SwimmerSakakoBeatenText:
	text "I thought you"
	line "were a SHARPEDO!"
	done

SwimmerSakakoAfterText:
	text "Some #MON are"
	line "very dangerous."

	para "You can get hurt"
	line "if you aren't"
	cont "careful!"
	done

TrainerSwimmerNaoya:
	trainer EVENT_BEAT_SWIMMERM_NAOYA, SWIMMERM, NAOYA, SwimmerNaoyaSeenText, SwimmerNaoyaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerNaoyaAfterText
	waitbutton
	closetext
	end

SwimmerNaoyaSeenText:
	text "I just used a"
	line "STONE to evolve my"
	cont "SHELLDER!"
	done

SwimmerNaoyaBeatenText:
	text "SCIZORs don't fear"
	line "the REAPER<...>"
	done

SwimmerNaoyaAfterText:
	text "By the way, my"
	line "favorite band is"
	cont "the BLUE CLOYSTER"
	cont "CULT."
	done

TraceyScript1:
	playmusic MUSIC_TRACEY_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE_56_TRACEY, 15
	opentext
	writetext TraceyYoText
	waitbutton
	spriteface PLAYER, RIGHT
	applymovement ROUTE_56_TRACEY, MovementYo1
	writetext TraceyLetsBattleText
	waitbutton
	closetext
	winlosstext TraceyRoute56WinLoss, 0
	loadtrainer TRACEY, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingNowText
	waitbutton
	verbosegiveitem EXP_ALL
	closetext
	applymovement ROUTE_56_TRACEY, Tracey56_Movement
	disappear ROUTE_56_TRACEY
;	special Special_FadeInQuickly
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger ROUTE_56_WEST, $1
	end

TraceyScript2:
	playmusic MUSIC_TRACEY_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE_56_TRACEY, 15
	opentext
	writetext TraceyYoText
	waitbutton
	spriteface PLAYER, RIGHT
	applymovement ROUTE_56_TRACEY, MovementYo2
	writetext TraceyLetsBattleText
	waitbutton
	closetext
	winlosstext TraceyRoute56WinLoss, 0
	loadtrainer TRACEY, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingNowText
	waitbutton
	verbosegiveitem EXP_ALL
    writetext TraceyReallyLeavingNowText
	waitbutton
	closetext
	applymovement ROUTE_56_TRACEY, Tracey56_Movement
	disappear ROUTE_56_TRACEY
;	special Special_FadeInQuickly
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger ROUTE_56_WEST, $1
	end

TraceyYoText:
	text "<PLAYER>!"
	done

TraceyLetsBattleText:
	text "Long time no see!"

	para "You look like you"
	line "got much stronger!"

	para "I've observed many"
	line "different #MON."

	para "Let's see who got"
	line "the strongest!"
	done

TraceyRoute56WinLoss:
	text "You're so strong,"
	line "<PLAYER>!"
	done

TraceyLeavingNowText:
	text "I really need to"
	line "focus on training"
	cont "if I ever want to"
	cont "be PROF.OAK's"
	cont "assistant!"

	para "Oh, yeah."
	
	para "This should help"
	line "you out!"
	cont "It will make your"
	cont "training easier!"
	done

TraceyReallyLeavingNowText:
	text "<PLAYER>, if you"
	line "go to KINNOW ISLA-"
	cont "ND, make sure you"
	cont "visit the SKATE"
	cont "SHOP!"

	para "Seeya around!"
	done

MovementYo1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementYo2:
	step LEFT
	step LEFT
	step LEFT
	step_end

Tracey56_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Route56WestHPUp:
	itemball HP_UP

Route56WestUltraBall:
	itemball ULTRA_BALL

Route56WestHiddenUltraBall:
	dwb EVENT_ROUTE_56_WEST_HIDDEN_ULTRA_BALL, ULTRA_BALL

Route56West_MapEventHeader::

.Warps: db 1
	warp_def 7, 35, 1, ROUTE_56_POKE_CENTER

.CoordEvents: db 2
	xy_trigger 0, 20, 50, TraceyScript1
	xy_trigger 0, 20, 51, TraceyScript2

.BGEvents: db 2
	signpost 9, 37, SIGNPOST_READ, Route56Sign
	signpost 25, 43, SIGNPOST_ITEM, Route56WestHiddenUltraBall

.ObjectEvents: db 7
	person_event SPRITE_FISHER, 22, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherIsao, -1
	person_event SPRITE_COOLTRAINER_M, 8, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerAthleteKaito, -1
	person_event SPRITE_SWIMMER_GIRL, 18, 25, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerSakako, -1
	person_event SPRITE_SWIMMER_GUY, 24,  5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerNaoya, -1
	person_event SPRITE_TRACEY, 20, 55, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_56_TRACEY
	person_event SPRITE_POKE_BALL,  9, 53, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56WestHPUp, EVENT_ROUTE_56_WEST_HP_UP
	person_event SPRITE_POKE_BALL, 27, 52, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route56WestUltraBall, EVENT_ROUTE_56_WEST_ULTRA_BALL

