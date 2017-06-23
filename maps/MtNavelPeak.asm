MtNavelPeak_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

DannyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_DANNY
	iftrue .FightDone
	writetext WelcomeToPeakText
	waitbutton
	closetext
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
	checkcode VAR_BADGES
.FightDone:
;	checkevent EVENT_GOT_TM_ ;undecided
	iftrue .SpeechAfterTM
	writetext ThatBadgeWillText
	buttonsound
;	verbosegiveitem TM_BUBBLEBEAM
;	iffalse .NoRoomForBubblebeam
;	setevent EVENT_GOT_TM32_BUBBLEBEAM
;	writetext UnknownText_0x68648
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext UnknownText_0x68735
	waitbutton
;.NoRoomForBubblebeam:
;	closetext
;	end


MtNavelPeak_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_DANNY, 8, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DannyScript, -1

