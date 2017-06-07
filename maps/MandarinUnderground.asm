const_value set 2
	const MANDARINUNDERGROUND_ROCKET1
	const MANDARINUNDERGROUND_ROCKET2
	const MANDARINUNDERGROUND_OFFICER
	const MANDARINUNDERGROUND_POKE_BALL

MandarinUnderground_MapScriptHeader::

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	end

.Trigger1:
	end

ExplodingTrap1:
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2:
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_3
	end

ExplodingTrap4:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5:
	checkevent EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6:
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7:
	checkevent EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8:
	checkevent EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9:
	checkevent EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_9
	end

VoltorbExplodingTrap:
	special FadeOutPalettes
	cry GRIMER
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GRIMER, 15
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 15
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 15
	startbattle
	end

NoExplodingTrap:
	end

MandarinUndergroundOfficerScript:
	jumptextfaceplayer MandarinUndergroundOfficerText

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
	disappear MANDARINUNDERGROUND_ROCKET1
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
	disappear MANDARINUNDERGROUND_ROCKET2
	setevent EVENT_MANDARIN_UNDERGROUND_CASSIDY
	special Special_FadeInQuickly
	end

MandarinUndergroundTMFrustration:
	itemball TM_FRUSTRATION

MandarinUndergroundPC:
	jumptext MandarinUndergroundPCText

MandarinUndergroundStatue:
	jumptext MandarinUndergroundStatueText

.Text:

MandarinUndergroundOfficerText:
	text "I tracked some odd"
	line "characters all the"
	cont "way over to this"
	cont "warehouse."

	para "However, my GROWL-"
	line "ITHE was no match"
	cont "for them."

	para "Without a doubt,"
	line "TEAM ROCKET is"
	cont "back in action."

	para "I'll leave soon"
	line "to get help!"
	done

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

	para "Wait, where is"
	line "BUTCH?"

	para "I bet you're the"
	line "one behind this!"

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

MandarinUndergroundPCText:
	text "Jessie and James"

	para "We have set up"
	line "operations on a"
	cont "quiet island."

	para "We expect to"
	line "round up all the"
	cont "#MON here soon."

	para "Butch and Cassidy"
	done

MandarinUndergroundStatueText:
	text "A commemorative"
	line "statue of TEAM"
	cont "ROCKET's revival."

	para "Oh no!"
	done

MandarinUnderground_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 6, 2, 5, MANDARIN_NORTH
	warp_def 6, 3, 5, MANDARIN_NORTH
	warp_def 2, 3, 4, MANDARIN_UNDERGROUND
	warp_def 2, 15, 3, MANDARIN_UNDERGROUND

.CoordEvents: db 9
	xy_trigger 0, 13, 13, 0, ExplodingTrap1, 0, 0
	xy_trigger 0, 13, 14, 0, ExplodingTrap2, 0, 0
	xy_trigger 0, 13, 15, 0, ExplodingTrap3, 0, 0
	xy_trigger 0, 17, 13, 0, ExplodingTrap4, 0, 0
	xy_trigger 0, 17, 14, 0, ExplodingTrap5, 0, 0
	xy_trigger 0, 17, 15, 0, ExplodingTrap6, 0, 0
	xy_trigger 0, 11, 25, 0, ExplodingTrap7, 0, 0
	xy_trigger 0, 11, 26, 0, ExplodingTrap8, 0, 0
	xy_trigger 0, 11, 27, 0, ExplodingTrap9, 0, 0

.BGEvents: db 2
	signpost 15, 18, SIGNPOST_READ, MandarinUndergroundPC
	signpost 15, 26, SIGNPOST_READ, MandarinUndergroundStatue

.ObjectEvents: db 4
	person_event SPRITE_ROCKET, 18, 17, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinUndergroundButchScript, EVENT_MANDARIN_UNDERGROUND_BUTCH
	person_event SPRITE_ROCKET_GIRL, 6, 25, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MandarinUndergroundCassidyScript, EVENT_MANDARIN_UNDERGROUND_CASSIDY
	person_event SPRITE_OFFICER, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinUndergroundOfficerScript, EVENT_MANDARIN_UNDERGROUND_CASSIDY
	person_event SPRITE_POKE_BALL, 6, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinUndergroundTMFrustration, EVENT_MANDARIN_UNDERGROUND_TM_FRUSTRATION
