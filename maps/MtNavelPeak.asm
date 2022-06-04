const_value = 1
	const NAVELPEAK_DANNY
	const NAVELPEAK_ITEMBALL

MtNavelPeak_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

DannyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_DANNY
	iftrue .FightDone
	writetext WelcomeToPeakText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	blackoutmod NAVEL_ISLAND
	opentext
	writetext LetsBattleDanny
	winlosstext DannyWinLossText, 0
	loadtrainer DANNY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DANNY
	opentext
	writetext YouEarnedSeaRubyText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SEA_RUBY_BADGE
	clearevent EVENT_UNNAMED_POKE_CENTER_MISTY
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_HAIL
	iftrue .SpeechAfterTM
	writetext ThatBadgeWillText
	buttonsound
	verbosegiveitem TM_HAIL
	iffalse .NoRoomForHail
	setevent EVENT_GOT_TM_HAIL
	closetext
	end

.SpeechAfterTM:
	writetext DannyBeatenText
	waitbutton
.NoRoomForHail:
	closetext
	end

WelcomeToPeakText:
	text "Welcome, trainer."

	para "I'm the world fam-"
	line "ous rock climber,"
	cont "DANNY."

	para "Not many can climb"
	line "to this peak and"
	cont "have the strength"
	cont "to stand."

	para "You made it to the"
	line "peak, which earns"
	cont "you the right to"
	cont "battle me."

	para "First, let me heal"
	line "your #MON."
	done

LetsBattleDanny:
	text "Well, then."
	line "Shall we get"
	cont "started?"
	done

DannyWinLossText:
	text "Oh. Seems we have"
	line "a rising star."
	done

YouEarnedSeaRubyText:
	text "<PLAYER> received"
	line "SEA-RUBY BADGE."
	done

ThatBadgeWillText:
	text "You're one tough"
	line "nut. You climbed"
	cont "the brutal moun-"
	cont "tain, and beat me."

	para "That SEA-RUBY"
	line "badge will make"
	cont "#MON up to lev-"
	cont "el 50 obey you."

	para "Also, a gift from"
	line "from me."
	done

DannyBeatenText:
	text "There is still a"
	line "long road ahead."

	para "Your next battle"
	line "is on TROVITA"
	cont "ISLAND."
	done

NavelPeakEscapeRope:
	itemball ESCAPE_ROPE

MtNavelPeak_MapEventHeader::

.Warps: db 1
	warp_def 13, 11, 5, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_DANNY, 8, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DannyScript, -1
	person_event SPRITE_POKE_BALL, 12, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, NavelPeakEscapeRope, EVENT_NAVEL_PEAK_ESCAPE_ROPE
