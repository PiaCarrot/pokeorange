const_value set 1
	const KINNOW_JACE
	const KINNOW_KURT
	const KINNOW_JASON
	const KINNOW_ALICE

KinnowShowboatInside_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowShowboatJace:
	faceplayer
	opentext
	writetext KinnowShowboatJaceText1
	waitbutton
	closetext
	winlosstext JaceWinLossText, 0
	loadtrainer JACE, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatJaceText2
	waitbutton
	closetext
	disappear KINNOW_JACE
	special Special_FadeInQuickly
	end
	
KinnowShowboatJaceText1:
	text "Ah, I see you"
	line "have the CORAL-"
	cont "EYE BADGE."
	
	para "Per my master's"
	line "order, we battle!"
	done
	
JaceWinLossText:
	text "Splendid, I can"
	line "go home now."
	done
	
KinnowShowboatJaceText2:
	text "You'll need the"
	line "SEA RUBY BADGE to"
	cont "go further!"
	done
	
KinnowShowboatKurt:
	faceplayer
	opentext
	checkflag ENGINE_SEA_RUBY_BADGE
	iffalse .NoSeaRuby
	writetext KinnowShowboatKurtText1
	waitbutton
	closetext
	winlosstext KurtWinLossText, 0
	loadtrainer KURT, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatKurtText2
	waitbutton
	closetext
	disappear KINNOW_KURT
	special Special_FadeInQuickly
	end
	
.NoSeaRuby:
	writetext KinnowShowboatKurtText3
	waitbutton
	closetext

KinnowShowboatKurtText1:
	text "Ah, I see you have"
	line "the SEA RUBY"
	cont "BADGE."
	
	para "We were instructed"
	line "to fight you!"
	done
	
KurtWinLossText:
	text "I was hoping to"
	line "stay a little"
	cont "longer<...>"
	done
	
KinnowShowboatKurtText2:
	text "Got a concert to"
	line "get to, but come"
	cont "back with the"
	cont "SPIKE SHELL BADGE!"
	done
	
KinnowShowboatKurtText3:
	text "Ah, you don't have"
	line "a SEA RUBY BADGE."
	cont "Come back when you"
	cont "do!"
	done

KinnowShowboatJason:
	faceplayer
	opentext
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .NoSpikeShell
	writetext KinnowShowboatJasonText1
	waitbutton
	closetext
	winlosstext JasonWinLossText, 0
	loadtrainer JASON, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatJasonText2
	waitbutton
	closetext
	disappear KINNOW_JASON
	special Special_FadeInQuickly
	end

.NoSpikeShell:	
	writetext KinnowShowboatJasonText3
	waitbutton
	closetext
	
KinnowShowboatJasonText1:
	text "Hey, a SPIKE SHELL"
	line "BADGE, just like"
	cont "my helmet!"
	
	para "Let's battle!"
	done
	
JasonWinLossText:
	text "Who's cuter?"
	line "OMASTAR or me?"
	done
	
KinnowShowboatJasonText2:
	text "Tragic. Come back"
	line "with the JADE STAR"
	cont "BADGE to battle"
	cont "the commander!"
	done
	
KinnowShowboatJasonText3:
	text "Aw, you don't have"
	line "a SPIKE SHELL"
	cont "BADGE. Battle?"
	cont "No can do!"
	done
	
KinnowShowboatAlice:
	faceplayer
	opentext
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .NoJadeStar
	writetext KinnowShowboatAliceText1
	waitbutton
	closetext
	winlosstext AliceWinLossText, 0
	loadtrainer ALICE, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatAliceText2
	waitbutton
	closetext
	disappear KINNOW_ALICE
	special Special_FadeInQuickly
	end
	
.NoJadeStar:
	writetext KinnowShowboatAliceText3
	waitbutton
	closetext
	
KinnowShowboatAliceText1:
	text "We aren't actually"
	line "employees here<...>"
	cont "We're under orders"
	cont "to make you"
	
	para "stronger!"
	done
	
AliceWinLossText:
	text "Mission<...>"
	line "Accomplished!"
	done
	
KinnowShowboatAliceText2:
	text "Whelp, see you"
	line "around! Maybe?"
	done
	
KinnowShowboatAliceText3:
	text "Oh no, sweetie."
	line "No JADE STAR?"
	cont "Come back when"
	cont "you get it!"
	done

KinnowShowboatInside_MapEventHeader::

.Warps: db 7
	warp_def  3,  2, 3, KINNOW_SHOWBOAT
	warp_def  4,  6, 3, KINNOW_SHOWBOAT_INSIDE
	warp_def 18,  6, 2, KINNOW_SHOWBOAT_INSIDE
	warp_def 18,  0, 5, KINNOW_SHOWBOAT_INSIDE
	warp_def  4, 22, 4, KINNOW_SHOWBOAT_INSIDE
	warp_def  4, 34, 7, KINNOW_SHOWBOAT_INSIDE
	warp_def 18, 34, 6, KINNOW_SHOWBOAT_INSIDE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_YOUNGSTER,  5,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatJace, EVENT_KINNOW_SHOWBOAT_JACE
	person_event SPRITE_ROCKER, 19,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KinnowShowboatKurt, EVENT_KINNOW_SHOWBOAT_KURT
	person_event SPRITE_SUPER_NERD,  5, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowShowboatJason, EVENT_KINNOW_SHOWBOAT_JASON
	person_event SPRITE_LASS, 23, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowShowboatAlice, EVENT_KINNOW_SHOWBOAT_ALICE
