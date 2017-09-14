const_value set 2
	const SEVENGRAPEFRUITS_BIG_SNORLAX
	const SEVENGRAPEFRUITS_WORKER
	const SEVENGRAPEFRUITS_GUARD1
	const SEVENGRAPEFRUITS_GUARD2
	const SEVENGRAPEFRUITS_ITEM_ULTRABALL
	const SEVENGRAPEFRUITS_ITEM_PROTEIN

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
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
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

GrapefruitGuardScript:
	jumptextfaceplayer SearchingForSnorlaxText

GrapefruitUltraBall:
	itemball ULTRA_BALL

GrapefruitProtein:
	itemball PROTEIN

GrapefruitHiddenRareCandy:
	dwb EVENT_GRAPEFRUIT_RARE_CANDY, RARE_CANDY

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
	line "# FLUTE!"
	done

WakingUpSnorlax:
	text "<...>"

	para "SNORLAX woke up!"
	done

SearchingForSnorlaxText:
	text "Ah, kid!"

	para "You can't be here."
	line "We're looking for"
	cont "a fruit thief."

	para "Though, it doesn't"
	line "seem like we're"
	cont "getting anywhere."

	para "We might have to"
	line "call it quits."
	done

SevenGrapefruits_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 22, 7, SIGNPOST_ITEM, GrapefruitHiddenRareCandy

.ObjectEvents: db 6
	person_event SPRITE_BIG_SNORLAX, 38, 20, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsSnorlax, EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	person_event SPRITE_COOLTRAINER_F, 38, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsCooltrainer, -1
	person_event SPRITE_OFFICER, 33, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -2, -2, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrapefruitGuardScript, EVENT_BEAT_DANNY
	person_event SPRITE_OFFICER, 33, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -2, -2, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrapefruitGuardScript, EVENT_BEAT_DANNY
	person_event SPRITE_POKE_BALL, 25, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GrapefruitUltraBall, EVENT_GRAPEFRUIT_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 15, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GrapefruitProtein, EVENT_GRAPEFRUIT_PROTEIN

