const_value = 1
	const KRISSHOUSE1F_MOM1

KrissHouse1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MotherScript:
	opentext
	faceplayer
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .MotherOrangeCrewText
	writetext MotherText
	waitbutton
	closetext
	end
	
.MotherOrangeCrewText:
	checkevent EVENT_BEAT_RED
	iftrue .MotherBattle
	writetext MotherBeatOrangeCrewText
	waitbutton
	closetext
	end
	
.MotherBattle ;TODO
	writetext MotherBeatRedText
	waitbutton
	closetext
	end

TVScript:
	checkevent EVENT_EON_DUO_WILD
	iftrue .TvScriptNormal
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .TvScriptNormal
	opentext
	writetext EonDuoTVSpecial
	waitbutton
	writebyte LATIAS
	special ShowPokedexEntry
	writebyte LATIOS
	special ShowPokedexEntry
	closetext
	setevent EVENT_EON_DUO_WILD
	special InitRoamMons
	end

.TvScriptNormal
	jumptext TVText

EonDuoTVSpecial:
	text "Breaking news!"
	line "Two #MON"
	cont "that were reported"
	cont "to look like jets"
	
	para "have been seen"
	line "flying around the"
	cont "ORANGE ISLANDS."
	cont "This broadcast was"
	
	para "Brought to you by"
	line "HAMLIN TV!"
	done

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

;	para "If you ever get"
;	line "strong, I will"
;	cont "gladly battle you."
	done
	
MotherBeatOrangeCrewText:
	text "MOM: Way to go,"
	line "baby!"
	
	para "Keep at it, I'm"
	line "rooting for you."
	
	para "I once took on"
	line "the INDIGO LEAGUE."
	cont "I hear there's a"
	cont "new CHAMPION now,"
	cont "there are rumors"
	cont "he's come to the"
	cont "islands to face"
	cont "our CHAMPION, and"
	cont "that is you!"
	
	para "Apparently he was"
	line "last seen in"
	cont "CLEOPATRA ISLAND."
	done

MotherBeatRedText:
	text "MOM: You defeated"
	line "INDIGO LEAGUE's"
	cont "CHAMPION?!"
	
	para "I guess you ended"
	line "up being a better"
	cont "TRAINER than I"
	cont "used to. I wish I"
	cont "still had my old"
	cont "companions around,"
	cont "I'm sure battling"
	cont "with my own son,"
	para "the CHAMPION!,"
	para "would be so much"
	line "fun!"
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

	para "sky as two kids"
	line "sail on a raft<...>"

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
