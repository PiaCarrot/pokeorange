const_value set 2
	const ROUTE_60_JESSIE
	const ROUTE_60_JAMES

Route60_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

RocketRoute60Event:
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext Route60RocketText1
	waitbutton
	closetext
	spriteface ROUTE_60_JESSIE, DOWN
	spriteface ROUTE_60_JAMES, DOWN
	playmusic MUSIC_ROCKET_OVERTURE
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
	playmusic MUSIC_ROUTE_29
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
	
Route60_MapEventHeader::

.Warps: db 4
	warp_def 10, 49, 1, MORO_ROUTE_60_GATE
	warp_def 11, 49, 2, MORO_ROUTE_60_GATE
	warp_def 10, 4, 1, GOLDEN_ISLAND
	warp_def 11, 4, 1, GOLDEN_ISLAND

.CoordEvents: db 2
	xy_trigger 0, 12, 39, 0, RocketRoute60Event, 0, 0
	xy_trigger 0, 13, 39, 0, RocketRoute60Event, 0, 0

.BGEvents: db 1
	signpost 6, 16, SIGNPOST_READ, Route60Sign

.ObjectEvents: db 2
	person_event SPRITE_JESSIE, 13, 36, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET
	person_event SPRITE_JAMES, 13, 35, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_60_ROCKET

