const_value set 1
	const KRISSHOUSE1F_MOM1

KrissHouse1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MotherScript:
	jumptextfaceplayer MotherText

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MotherText:
	text "MOM: A TRAINER?"
	line "All kids leave"
	cont "home some day."
	cont "It said so on TV."

	para "You know, I used"
	line "to be a TRAINER,"
	cont "a long time ago."

	para "If you ever get"
	line "strong, I will"
	cont "gladly battle you."
	done

StoveText:
	text "An adept"
	line "arrangement by"
	cont "MOTHER<...>"

	para "VOLCANO BAKEMEAT!"
	done

SinkText:
	text "The sink is spot-"
	line "less. MOM likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge<...>"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train<...>"

	para "I'd better get"
	line "rolling too!"
	done

KrissHouse1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 6, 2, VALENCIA_ISLAND
	warp_def 7, 7, 2, VALENCIA_ISLAND
	warp_def 0, 9, 1, KRISS_HOUSE_2F

.CoordEvents: db 0

.BGEvents: db 4
	signpost 1, 0, SIGNPOST_READ, StoveScript
	signpost 1, 1, SIGNPOST_READ, SinkScript
	signpost 1, 2, SIGNPOST_READ, FridgeScript
	signpost 1, 4, SIGNPOST_READ, TVScript

.ObjectEvents: db 1
	person_event SPRITE_MOM, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MotherScript, -1
