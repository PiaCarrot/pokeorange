const_value = 1
	const MT_NAVEL_BOULDER
	const MT_NAVEL_CROSS

MtNavel1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MtNavel1FBoulder:
	jumpstd strengthboulder
	
CrossBattle2Script:
	faceplayer
	showemote EMOTE_SHOCK, MT_NAVEL_CROSS, 15
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMtNavelText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossMtNavelWinLoss, 0
	setlasttalked MT_NAVEL_CROSS
	loadtrainer CROSS, 6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotCharmander:
	winlosstext CrossMtNavelWinLoss, 0
	setlasttalked MT_NAVEL_CROSS
	loadtrainer CROSS, 4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossMtNavelWinLoss, 0
	setlasttalked MT_NAVEL_CROSS
	loadtrainer CROSS, 5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMtNavelLeavingNowText
	waitbutton
	closetext
	applymovement PLAYER, PlayerMtNavel_Movement
	applymovement MT_NAVEL_CROSS, CrossMtNavel_Movement
	disappear MT_NAVEL_CROSS
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	setevent EVENT_MT_NAVEL_CROSS
	end
	
CrossMtNavelText:
	text "CROSS: Well, look"
	line "what we have here!"

	para "<PLAYER>, so not"
	line "nice to see you!"

	para "I have a score to"
	line "settle with you,"
	cont "loser!"

	para "Let's battle!"
	done
	
CrossMtNavelWinLoss:
	text "As if that was my"
	line "full strength!"
	done
	
CrossMtNavelLeavingNowText:
	text "CROSS: Hmph!"

	para "#MON are"
	line "nothing more than"
	cont "tools for winning!"

	para "At the rate you"
	line "are going, there"
	cont "is no way I will"
	cont "lose next time!"
	done
	
PlayerMtNavel_Movement:
	step RIGHT
	turn_head LEFT
	step_end
	
CrossMtNavel_Movement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MtNavel1F_MapEventHeader::

.Warps: db 4
	warp_def 25, 5, 1, NAVEL_ISLAND
	warp_def 7, 25, 2, NAVEL_ISLAND
	warp_def 17, 19, 1, MT_NAVEL_2F
	warp_def 9, 19, 2, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_BOULDER, 6, 21, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MtNavel1FBoulder, -1
	person_event SPRITE_ROCKER, 21, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CrossBattle2Script, EVENT_MT_NAVEL_CROSS

