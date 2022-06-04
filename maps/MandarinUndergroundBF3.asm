const_value = 1
	const MANDARINUNDERGROUND_BUTCH
	const MANDARINUNDERGROUND_CASSIDY
	const MANDARINUNDERGROUND_CUT

MandarinUndergroundBF3_MapScriptHeader::

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	end

.Trigger1:
	end

ExplodingTrap4:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap2
	scall VoltorbExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5:
	checkevent EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap2
	scall GeodudeExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6:
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap2
	scall KoffingExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7:
	checkevent EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap2
	scall VoltorbExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8:
	checkevent EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap2
	scall KoffingExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9:
	checkevent EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap2
	scall KoffingExplodingTrap2
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_9
	end

VoltorbExplodingTrap2:
	special FadeOutPalettes
	cry GRIMER
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GRIMER, 15
	startbattle
	end

GeodudeExplodingTrap2:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 15
	startbattle
	end

KoffingExplodingTrap2:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 15
	startbattle
	end

NoExplodingTrap2:
	end

MandarinUndergroundButchScript:
	faceplayer
	opentext
    writetext MandarinButchText
	waitbutton
	closetext
	winlosstext ButchWinLoss, 0
	loadtrainer BUTCH, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext MandarinButchWonText
	waitbutton
	closetext
	disappear MANDARINUNDERGROUND_BUTCH
	setevent EVENT_MANDARIN_UNDERGROUND_BUTCH
	special Special_FadeInQuickly
	end

MandarinUndergroundCassidyScript:
	faceplayer
	opentext
    writetext MandarinCassidyText
	waitbutton
	closetext
	winlosstext CassidyWinLoss, 0
	loadtrainer CASSIDY, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext MandarinCassidyWonText
	waitbutton
	closetext
	disappear MANDARINUNDERGROUND_CASSIDY
	setevent EVENT_MANDARIN_UNDERGROUND_CASSIDY
	special Special_FadeInQuickly
	end

MandarinUndergroundTMThief:
	itemball HM_CUT

MandarinButchText:
	text "Well, well."

	para "I found a twerp."
	line "Sorry kid, but"
	cont "I'm gonna have to"
	cont "get rid of you."

	para "Can't have the new"
	line "and improved TEAM"
	cont "ROCKET meddled by"
	cont "another kid!"
	done

ButchWinLoss:
	text "No way! Not again!"
	line "But we're strong!"
	done

MandarinButchWonText:
	text "Abort mission!"
	line "I say that, but"
	cont "there is still"
	cont "one more of us."
	done

MandarinCassidyText:
	text "Who are you?"
	line "<...><...><...><...>"

	para "I just got started"
	line "building this dumb"
	cont "RADIO TOWER!"
	
	para "We were going to"
	line "hypnotize #MON"
	cont "using radio waves!"

	para "How dare you ruin"
	line "NEO ROCKET's new"
	cont "secret hideout!"
	cont "Prepare yourself!"
	done

CassidyWinLoss:
	text "No way! What is"
	line "wrong with kids"
	cont "these days!"
	done

MandarinCassidyWonText:
	text "You may have won"
	line "for now, kid."

	para "But, TEAM ROCKET"
	line "is back, and you"
	cont "haven't seen the"
	cont "last of us!"
	done

MandarinUndergroundBF3_MapEventHeader::

.Warps: db 2
	warp_def 2, 11, 2, MANDARIN_UNDERGROUND_BF2
	warp_def 22, 6, 4, MANDARIN_UNDERGROUND_ENTRANCE

.CoordEvents: db 6
	xy_trigger 0, 7, 6, ExplodingTrap4
	xy_trigger 0, 7, 7, ExplodingTrap5
	xy_trigger 0, 7, 8, ExplodingTrap6
	xy_trigger 0, 3, 1, ExplodingTrap7
	xy_trigger 0, 3, 2, ExplodingTrap8
	xy_trigger 0, 3, 3, ExplodingTrap9

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_ROCKET, 18, 7, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinUndergroundButchScript, EVENT_MANDARIN_UNDERGROUND_BUTCH
	person_event SPRITE_ROCKET_GIRL, 19, 7, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MandarinUndergroundCassidyScript, EVENT_MANDARIN_UNDERGROUND_CASSIDY
	person_event SPRITE_POKE_BALL, 22, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinUndergroundTMThief, EVENT_MANDARIN_UNDERGROUND_TM_THIEF

