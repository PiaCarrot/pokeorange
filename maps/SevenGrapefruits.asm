const_value set 2
	const SEVENGRAPEFRUITS_BIG_SNORLAX

SevenGrapefruits_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

GrapefruitsSnorlax:
	opentext
	checkitem POKE_FLUTE
	iftrue SnorlaxBattleScript
	writetext SnorlaxIsSleepingText
	waitbutton
	closetext
	end

SnorlaxBattleScript:
	writetext PlayPokeFlute
	waitbutton
	playmusic MUSIC_POKE_FLUTE_CHANNEL
	writetext WakingUpSnorlax
	waitbutton
	pause 15
	special Special_FadeOutMusic
	cry SNORLAX
	closetext
	loadwildmon SNORLAX, 30
	startbattle
	disappear SEVENGRAPEFRUITS_BIG_SNORLAX
	reloadmapafterbattle
	playmapmusic
	end

GrapefruitsCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	iftrue .SnorlaxGone
	writetext GrapefruitWorkerText
	waitbutton
	closetext
	end

.SnorlaxGone:
	writetext GrapefruitWorkerHappyText
	waitbutton
	closetext
	end

GrapefruitWorkerText:
	text "Oh no!"

	para "This SNORLAX is"
	line "eating all of our"
	cont "GRAPEFRUITs!"

	para "Oh, whatever will"
	line "we do?"
	done

GrapefruitWorkerHappyText:
	text "Thank you for get-"
	line "ting rid of that"
	cont "SNORLAX!"
	done

SnorlaxIsSleepingText:
	text "SNORLAX is snoring"
	line "peacefully<...>"
	done

PlayPokeFlute:
	text "<PLAYER> used the"
	line "#FLUTE!"
	done

WakingUpSnorlax:
	text "<...>"

	para "SNORLAX woke up!"
	done

SevenGrapefruits_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_BIG_SNORLAX, 38, 22, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsSnorlax, EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	person_event SPRITE_COOLTRAINER_F, 38, 20, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsCooltrainer, -1
