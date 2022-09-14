const_value = 1
	const ROUTE_60_JESSIE
	const ROUTE_60_JAMES
	const ROUTE_60_POKE_BALL
	const ROUTE_60_SWIMMER_GIRL
	const ROUTE_60_POKE_BALL2
	const ROUTE_60_SWIMMER_GUY
	const ROUTE_60_ROCKER
	const ROUTE_60_SEASHELL
	const ROUTE_60_SEASHELL_2

Route60_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP, 0, 0
	return
	
RocketRoute60Event:
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Route60RocketText1
	waitbutton
	closetext
	spriteface ROUTE_60_JESSIE, DOWN
	spriteface ROUTE_60_JAMES, DOWN
	playmusic MUSIC_ROCKET_MOTTO
	opentext
	writetext Route60RocketMottoText
	waitbutton
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	spriteface ROUTE_60_JESSIE, LEFT
	spriteface ROUTE_60_JAMES, RIGHT
	writetext WhereIsMeowthText
	waitbutton
	closetext
	applymovement ROUTE_60_JAMES, ROUTE_60_JAMES_MOVEMENT
	applymovement ROUTE_60_JESSIE, ROUTE_60_JESSIE_MOVEMENT
	disappear ROUTE_60_JESSIE
	disappear ROUTE_60_JAMES
	setevent EVENT_ROUTE_60_ROCKET
	domaptrigger ROUTE_60, $1
	playmusic MUSIC_ROUTE_62
	end


Route60RocketText1:
	text "???: Ooh, look at"
	line "it, JESSIE!"

	para "JESSIE: You're far"
	line "too loud, JAMES."
	cont "What if some cop"
	cont "hears us?"

	para "JAMES: That's when"
	line "we give them our"
	cont "motto, like we"
	cont "practiced."

	para "Then we give them"
	line "a little taste of"
	cont "ARBOK and WEEZING!"

	para "<...> <...> <...>"
	done

Route60RocketMottoText:
	text "Prepare the world"
	line "for devastation!"

	para "To unite all"
	line "peoples within our"
	cont "nation!"

	para "To denounce the"
	line "evils of truth and"
	cont "love!"

	para "To extend our"
	line "reach to the stars"
	cont "above!"

	para "JESSIE!"

	para "JAMES!"

	para "TEAM ROCKET, blast"
	line "off at the speed"
	cont "of light!"

	para "Surrender now or"
	line "prepare to fight!"
	done

WhereIsMeowthText:
	text "<...> <...> <...>"

	para "JAMES: MEOWTH?"

	para "<...>"

	para "JAMES: JESSIE, do"
	line "you know where"
	cont "MEOWTH went to?"

	para "JESSIE: No idea."

	para "JAMES: Maybe he"
	line "went to the next"
	cont "ISLAND?"

	para "JESSIE: Well, why"
	line "don't we find out?"
	done

ROUTE_60_JESSIE_MOVEMENT:
	step LEFT
	step LEFT
	step LEFT
	step_end

ROUTE_60_JAMES_MOVEMENT:
	step LEFT
	step LEFT
	step_end

Route60Sign:
	jumptext Route60SignText

Route60SignText:
	text "ROUTE 60"
	done

Route60UltraBall:
	itemball ULTRA_BALL
	
Route60SuperRepel:
	itemball SUPER_REPEL

Route60SwimmerGirlScript:
	jumptextfaceplayer Route60SwimmerText

Route60SwimmerText:
	text "See this deep part"
	line "of the water?"

	para "There's a WRECKED"
	line "SHIP underneath!"

	para "GHOST-type #MON"
	line "appear around here"
	cont "because of it."
	done
	
; SWIMMER_M_TAKAO
TrainerSwimmermTakao:
	trainer EVENT_BEAT_SWIMMERM_TAKAO, SWIMMERM, TAKAO, SwimmerMTakaoSeenText, SwimmerMTakaoWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerMTakaoAfterText
	waitbutton
	closetext
	end
	
SwimmerMTakaoSeenText:
	text "I tried to go to"
	line "the WRECKED SHIP"
	cont "underwater, but a"
	cont "GHOST attacked me!"
	done
	
SwimmerMTakaoWinText:
	text "Spooky!"
	done
	
SwimmerMTakaoAfterText:
	text "I can deal with a"
	line "SHARPEDO or a TOX-"
	cont "APEX, but GHOSTS"
	cont "are too much!"
	done
	
; BIRDKEEPER_TATSUYA
TrainerBirdkeeperTatsuya:
	trainer EVENT_BEAT_BIRDKEEPER_TATSUYA, BIRDKEEPER, TATSUYA, BirdkeeperTatsuyaSeenText, BirdkeeperTatsuyaWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdkeeperTatsuyaAfterText
	waitbutton
	closetext
	end
	
BirdkeeperTatsuyaSeenText:
	text "Can you soar like"
	line "my BIRDS?"
	done
	
BirdkeeperTatsuyaWinText:
	text "I've been clipped!"
	done
	
BirdkeeperTatsuyaAfterText:
	text "BIRD #MON might"
	line "be common, but do"
	cont "not underestimate"
	cont "their power!"
	done
	
Route60SeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute60Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_60_SEASHELL
	disappear ROUTE_60_SEASHELL
	end
	
.NoShellBox:
	writetext Route60NoShellBox
	waitbutton
	closetext
	end
	
Route60NoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundRoute60Seashell:
	text "You found a rare"
	line "seashell!"
	done
	
Route60Seashell2Script:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute60Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_60_SEASHELL_2
	disappear ROUTE_60_SEASHELL_2
	end
	
.NoShellBox:
	writetext Route60NoShellBox
	waitbutton
	closetext
	end

Route60_MapEventHeader::

.Warps: db 4
	warp_def 10, 49, 1, MORO_ROUTE_60_GATE
	warp_def 11, 49, 2, MORO_ROUTE_60_GATE
	warp_def 52, 4, 3, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 53, 4, 4, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 12, 39, RocketRoute60Event
	xy_trigger 0, 13, 39, RocketRoute60Event

.BGEvents: db 1
	signpost 6, 16, SIGNPOST_READ, Route60Sign

.ObjectEvents: db 9
	person_event SPRITE_JESSIE, 13, 36, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET
	person_event SPRITE_JAMES, 13, 35, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET
	person_event SPRITE_POKE_BALL, 19, 46, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route60UltraBall, EVENT_ROUTE_60_ULTRA_BALL
	person_event SPRITE_SWIMMER_GIRL, 14, 18, SPRITEMOVEDATA_SWIM_AROUND, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route60SwimmerGirlScript, -1
	person_event SPRITE_POKE_BALL, 37, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route60SuperRepel, EVENT_ROUTE_60_SUPER_REPEL
	person_event SPRITE_SWIMMER_GUY, 53, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermTakao, -1
	person_event SPRITE_ROCKER, 35, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBirdkeeperTatsuya, -1
	person_event SPRITE_SEASHELL, 30,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route60SeashellScript, EVENT_ROUTE_60_SEASHELL
	person_event SPRITE_SEASHELL, 59, 49, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route60Seashell2Script, EVENT_ROUTE_60_SEASHELL_2
