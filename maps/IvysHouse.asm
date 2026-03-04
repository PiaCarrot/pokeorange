const_value = 1
	const IVYSHOUSE_TRIPLET_1
	const IVYSHOUSE_TRIPLET_2
	const IVYSHOUSE_TRIPLET_3

IvysHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Faith:
	faceplayer
	opentext
	writetext FaithText
	yesorno
	iftrue .ChangeTime
	closetext
	end
.ChangeTime:
	special ClockResetter
	reloadmap
	closetext
	end

Charity:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue .BattlePrompt
	writetext CharityHiText
	waitbutton
	closetext
	end

.BattlePrompt:
	;checkevent EVENT_BEAT_CHARITY
	;iftrue .AlreadyBeat
	writetext CharityText
	yesorno
	iftrue .Battle
	closetext
	end


.Battle: ; Logic here relies in normal game progression and being unable to skip badges.
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
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 7
	startbattle
	;; Fallthrough

.Battle2:
	reloadmapafterbattle
	opentext
	checkevent EVENT_BEAT_DANNY
	iffalse .comeWithTwoBadges
	checkevent EVENT_CHARITY_LUCKY_EGG
	iftrue .CharityComeBack
    writetext CharityGiveLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .CharityComeBack
	setevent EVENT_CHARITY_LUCKY_EGG
	jump .CharityComeBack

.comeWithTwoBadges:
	writetext CharityComeWithTwoBadgesText
	waitbutton
	closetext
	end

.CharityComeBack:
	writetext CharityComeBackText
	waitbutton
	closetext
	end

.AlreadyBeat:
	writetext CharityHiText
	waitbutton
	closetext
	end

.NoBadge:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 1
	startbattle
	jump .Battle2

.OneBadge:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 2
	jump .Battle2

.TwoBadge:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 3
	startbattle
	jump .Battle2

.ThreeBadge:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 4
	startbattle
	jump .Battle2

.FourBadge:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 5
	startbattle
	jump .Battle2

.DrakeBeat:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 6
	startbattle
	jump .Battle2

IvysHouseBookshelf:
	jumpstd difficultbookshelf

FaithText:
	text "FAITH: Best of"
	line "luck on your adv-"
	cont "enture, <PLAYER>!"

	para "If you'd like, I"
	line "can change the"
	cont "date and time"
	cont "for you."
	done

CharityHiText:
	text "CHARITY: Hi,"
	line "<PLAYER>!"
	done

CharityText:
	text "CHARITY: Hey,"
	line "<PLAYER>! Want"
	cont "to have a battle?"
	cont "For practice!"
	done

CharityWinLoss:
	text "Good battle!"
	done

CharityComeWithTwoBadgesText:
	text "CHARITY: You"
	line "are good!"

	para "Come back when you"
	line "get two Badges, if"
	cont "you beat me I'll"
	cont "give you a reward!"
	done

CharityGiveLuckyEggText:
	text "CHARITY: Good"
	line "job!"

	para "Here's your price!"
	done

CharityComeBackText:
	text "CHARITY: You"
	line "are good!"

	para "Come back whenever"
	line "you want to train!"
	done

Grace:
	faceplayer
	opentext
	writetext GraceText
	waitbutton
	checkflag ENGINE_HARDMODE
	iftrue .disableHard
	writetext GraceEnableHardText
	yesorno
	iffalse .dontChange
	setflag ENGINE_HARDMODE
	writetext GraceDoneText
	jump .finish
.disableHard
	writetext GraceDisableHardText
	yesorno
	iffalse .dontChange
	clearflag ENGINE_HARDMODE
	writetext GraceDoneText
	jump .finish
.dontChange
	writetext GraceComeBackText
.finish
	waitbutton
	closetext
	end

GraceText:
	text "GRACE: Hello"
	line "<PLAYER>!"
	done

GraceEnableHardText:
	text "Having an easy"
	line "time?"

	para "If you'd like, I"
	line "can enable HARD"
	cont "MODE for you."
	done

GraceDisableHardText:
	text "Having a hard"
	line "time?"

	para "If you'd like, I"
	line "can disable HARD"
	cont "MODE for you."
	done

GraceDoneText:
	text "Done, have fun!"
	done

GraceComeBackText:
	text "Ok, we'll keep it"
	line "that way."

	para "Come back any"
	line "time!"
	done

IvysHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, VALENCIA_ISLAND
	warp_def 7, 3, 4, VALENCIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 2, SIGNPOST_READ, IvysHouseBookshelf
	signpost 1, 3, SIGNPOST_READ, IvysHouseBookshelf

.ObjectEvents: db 3
	person_event SPRITE_SCIENTIST_F, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Charity, -1
	person_event SPRITE_SCIENTIST_F, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Faith, -1
	person_event SPRITE_SCIENTIST_F,  5,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Grace, -1
