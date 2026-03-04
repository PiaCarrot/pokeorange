const_value = 1
	const KINNOW_SNOWBOAT_COOLTRAINER

KinnowShowboatHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

AceTrainer:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	writetext AceText
	yesorno
	iftrue .Battle
	closetext
	end


.Battle ; Logic here relies in normal game progression and being unable to skip badges.
	checkevent EVENT_BEAT_CISSY
	iffalse .NoBadge
	checkevent EVENT_BEAT_DANNY
	iffalse .OneBadge
	checkevent EVENT_BEAT_RUDY
	iffalse .TwoBadge
	checkevent EVENT_BEAT_LUANA
	iffalse .ThreeBadge
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .FourBadge
	checkevent EVENT_BEAT_RED
	iffalse .DrakeBeat
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 20
	startbattle
	;; Fallthrough

.Battle2
	reloadmapafterbattle
	opentext
	writetext AceComeBackText
	waitbutton
	closetext
	end

.NoBadge
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 14
	startbattle
	jump .Battle2

.OneBadge
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 15
	jump .Battle2

.TwoBadge
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 16
	startbattle
	jump .Battle2

.ThreeBadge
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 17
	startbattle
	jump .Battle2

.FourBadge
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 18
	startbattle
	jump .Battle2

.DrakeBeat
	winlosstext AceWinLoss, 0
	loadtrainer COOLTRAINERM, 19
	startbattle
	jump .Battle2

AceText:
	text "Hey, how about"
	line "a quick battle?"

	para "I'll go easy on"
	line "you."
	done

AceWinLoss:
	text "Umph. Not bad."
	done

AceComeBackText:
	text "I'll battle you"
	line "anytime."
	done

KinnowShowboatHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 2, KINNOW_SHOWBOAT
	warp_def 7, 3, 2, KINNOW_SHOWBOAT

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  3,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, AceTrainer, -1
