const_value = 1
	const FUKUHARA_BF3_BUTCH
	const FUKUHARA_BF3_CASSIDY
	const FUKUHARA_BF3_AERODACTYL

FukuharaNo4BF3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FukuharaBF3Script:
	opentext
	writetext FukuharaBF3ScriptText1
	waitbutton
	spriteface FUKUHARA_BF3_BUTCH, DOWN
	spriteface FUKUHARA_BF3_CASSIDY, DOWN
	writetext FukuharaBF3ScriptText2
	waitbutton
	closetext
	winlosstext FukuharaButchCassidyWinLoss, 0
	loadtrainer CASSIDY_BUTCH, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext FukuharaBF3ScriptText3
	waitbutton
	closetext
	disappear FUKUHARA_BF3_BUTCH
	disappear FUKUHARA_BF3_CASSIDY
	setevent EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	special Special_FadeInQuickly
	end
	
FukuharaBF3ScriptText1:
	text "CASSIDY: BUTCH!"
	line "Look! It's the"
	cont "super rare #MON"
	cont "AERODACTYL!"
	
	para "BUTCH: But CASS-"
	
	para "CASSIDY: Don't"
	line "worry! We just"
	cont "gotta catch it"
	cont "before<...>"
	done
	
FukuharaBF3ScriptText2:
	text "BUTCH: The kid"
	line "gets here?"
	
	para "CASSIDY: <...>the"
	line "kid gets here."
	
	para "Well, we might as"
	line "well try to win!"
	done
	
FukuharaButchCassidyWinLoss:
	text "You've gotta be"
	line "kidding!"
	done
	
FukuharaBF3ScriptText3:
	text "CASSIDY: Is it"
	line "hopeless, BUTCH?"
	
	para "BUTCH: <...>"
	line "CASS, I think it's"
	cont "time to call it"
	cont "quits."
	
	para "CASSIDY: <...>"
	
	para "BUTCH: Look, kid."
	line "We just had a"
	cont "dream. We did what"
	cont "we had to."
	
	para "I guess this means"
	line "TEAM ROCKET is"
	cont "really dead."
	
	para "CASSIDY: Well, you"
	line "still have those"
	cont "idiots, JESSIE and"
	cont "JAMES."
	
	para "BUTCH: They won't"
	line "last a day without"
	cont "us."
	
	para "Anyway, kid. We're"
	line "done. No way we"
	cont "can beat you."
	done

FukuharaAerodactylScript:	
	faceplayer
	opentext
	writetext AerodactylText
	cry AERODACTYL
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon AERODACTYL, 40
	startbattle
	disappear FUKUHARA_BF3_AERODACTYL
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	end
	
AerodactylText:
	text "Wreeeooh!"
	done
	
FukuharaNo4BF3_MapEventHeader::

.Warps: db 1
	warp_def 17, 9, 2, FUKUHARA_NO_4_BF2

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_ROCKET, 4, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FukuharaBF3Script, EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	person_event SPRITE_ROCKET_GIRL, 4, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FukuharaBF3Script, EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED
	person_event SPRITE_AERODACTYL, 2, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, 0, 0, FukuharaAerodactylScript, EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT

