const_value = 1
	const KINNOW_JACE
	const KINNOW_KURT
	const KINNOW_KAT
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
	setevent EVENT_KINNOW_SHOWBOAT_JACE
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
	setevent EVENT_KINNOW_SHOWBOAT_KURT
	end
	
.NoSeaRuby:
	writetext KinnowShowboatKurtText3
	waitbutton
	closetext
	end

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

KinnowShowboatKat:
	faceplayer
	opentext
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .NoSpikeShell
	writetext KinnowShowboatKatText1
	waitbutton
	closetext
	winlosstext KatWinLossText, 0
	loadtrainer KAT, 1
	startbattle
	reloadmapafterbattle
	special RestartMapMusic
	opentext
	writetext KinnowShowboatKatText2
	waitbutton
	closetext
	disappear KINNOW_KAT
	special Special_FadeInQuickly
	setevent EVENT_KINNOW_SHOWBOAT_KAT
	end

.NoSpikeShell:	
	writetext KinnowShowboatKatText3
	waitbutton
	closetext
	end
	
KinnowShowboatKatText1:
	text "Meow! That's a"
	line "SPIKE SHELL BADGE!"
	cont "Let's battle!"
	done
	
KatWinLossText:
	text "This is so much"
	line "more fun than"
	cont "when I lived on"
	cont "GOLDEN ISLAND!"
	done
	
KinnowShowboatKatText2:
	text "Meow. Come back"
	line "with the JADE STAR"
	cont "BADGE to battle"
	cont "the commander!"
	done
	
KinnowShowboatKatText3:
	text "Mu<...> You don't"
	line "have a SPIKE SHELL"
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
	setevent EVENT_KINNOW_SHOWBOAT_ALICE
	end
	
.NoJadeStar:
	writetext KinnowShowboatAliceText3
	waitbutton
	closetext
	end
	
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
	
KinnowShowboatAnne:
	checkevent EVENT_KINNOW_SHOWBOAT_JACE
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatAnneText
	waitbutton
	closetext
	end
	
.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end

KinnowShowboatRoger:
	checkevent EVENT_KINNOW_SHOWBOAT_KAT
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatRogerText
	waitbutton
	closetext
	end

.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end

KinnowShowboatLen:
	checkevent EVENT_KINNOW_SHOWBOAT_KURT
	iffalse .FrozenNPC
	faceplayer
	opentext
	writetext KinnowShowboatLenText
	waitbutton
	closetext
	end

.FrozenNPC:
	opentext
	writetext FrozenNPCText
	waitbutton
	closetext
	end
	
FrozenNPCText:
	text "Looks like a STAFF"
	line "member from the"
	cont "SHOWBOAT. It's"
	cont "like they're"
	
	para "frozen in time!"
	done
	
KinnowShowboatAnneText:
	text "What happened? I"
	line "was getting ready"
	cont "for the show when"
	cont "suddenly I<...>"
	
	para "I guess I fainted?"
	done
	
KinnowShowboatRogerText:
	text "Strange<...>"
	line "My memory feels"
	cont "foggy<...>"
	
	para "Thanks for talking"
	line "to an old man!"
	cont "Got to get ready"
	cont "for the next show."
	done
	
KinnowShowboatLenText:
	text "Huh<...>What"
	line "happened? Is the"
	cont "show cancelled?"
	done
	
KinnowShowboatKay:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHINY_CHARM
	iftrue .GotShinyCharmAlready
	writetext ShowboatKayText
	waitbutton
	verbosegiveitem SHINY_CHARM
	setevent EVENT_GOT_SHINY_CHARM
	closetext
	end
	
.GotShinyCharmAlready:
	writetext ShowboatKayText2
	waitbutton
	closetext
	end
	
ShowboatKayText:
	text "Thank you for"
	line "making those"
	cont "weirdos leave!"
	
	para "Here, I hope this"
	line "helps you out!"
	done
	
ShowboatKayText2:
	text "Those guys came"
	line "out of nowhere"
	cont "after we docked."
	
	para "It was almost like"
	line "we were frozen in"
	cont "place!"
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

.ObjectEvents: db 8
	person_event SPRITE_YOUNGSTER,  5,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatJace, EVENT_KINNOW_SHOWBOAT_JACE
	person_event SPRITE_ROCKER, 19,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KinnowShowboatKurt, EVENT_KINNOW_SHOWBOAT_KURT
	person_event SPRITE_KAT,  5, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowShowboatKat, EVENT_KINNOW_SHOWBOAT_KAT
	person_event SPRITE_LASS, 23, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowShowboatAlice, EVENT_KINNOW_SHOWBOAT_ALICE
	person_event SPRITE_RECEPTIONIST,  5, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowShowboatAnne, -1
	person_event SPRITE_LASS, 23, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatKay, -1
	person_event SPRITE_GENTLEMAN,  8, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatRoger, -1
	person_event SPRITE_SUPER_NERD, 23,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowShowboatLen, -1
