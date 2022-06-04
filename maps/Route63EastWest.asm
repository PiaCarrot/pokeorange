const_value = 1
	const ROUTE_63_EAST_WEST_ITEMBALL_FULL_HEAL
	const ROUTE_63_EAST_WEST_ITEMBALL_IRON_TAIL
	const ROUTE_63_EAST_WEST_FISHER_MIYAGI
	const ROUTE_63_EAST_WEST_FISHER_KUNAI

Route63EastWest_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route63EastWestFullHeal:
	itemball FULL_HEAL
	
Route63EastWestTMIronTail:
	itemball TM_IRON_TAIL
	
TrainerFisherMiyagi:
	trainer EVENT_BEAT_FISHER_MIYAGI, FISHER, MIYAGI, FisherMiyagiSeenText, FisherMiyagiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherMiyagiAfterText
	waitbutton
	closetext
	end

FisherMiyagiSeenText:
	text "A true fisherman"
	line "can brave anything"
	cont "for the sake of"
	cont "fishing."
	done

FisherMiyagiBeatenText:
	text "A typhoon couldn't"
	line "match your might!"
	done

FisherMiyagiAfterText:
	text "Truly skilled play"
	line "you have shown me."
	done
	
TrainerFisherKunai:
	trainer EVENT_BEAT_FISHER_KUNAI, FISHER, KUNAI, FisherKunaiSeenText, FisherKunaiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherKunaiAfterText
	waitbutton
	closetext
	end

FisherKunaiSeenText:
	text "It's MAN-TIME for"
	line "MANTINE!"
	done

FisherKunaiBeatenText:
	text "I can't MAN-TAIN"
	line "any more!"
	done

FisherKunaiAfterText:
	text "MAN, that was a"
	line "MAN-TY fine"
	cont "battle!"
	done
	
TrainerCooltrainerMSei:
	trainer EVENT_BEAT_COOLTRAINERM_SEI, COOLTRAINERM, SEI, CooltrainerMSeiSeenText, CooltrainerMSeiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMSeiAfterText
	waitbutton
	closetext
	end

CooltrainerMSeiSeenText:
	text "The ASCORBIA"
	line "TRAINER CREW re-"
	cont "jected me, so I'm"
	cont "training!"
	done

CooltrainerMSeiBeatenText:
	text "Oof!"
	done

CooltrainerMSeiAfterText:
	text "You can find the"
	line "#MON MEOWTH"
	cont "around here."
	done
	
Route63Sign:
	jumptext Route63SignText
	
Route63SignText:
	text "ROUTE 63"
	done

Route63EastWest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 13, 19, SIGNPOST_READ, Route63Sign

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 10, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63EastWestFullHeal, EVENT_ROUTE_63_EAST_WEST_FULL_HEAL
	person_event SPRITE_POKE_BALL, 4, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63EastWestTMIronTail, EVENT_ROUTE_63_EAST_WEST_TM_IRON_TAIL
	person_event SPRITE_FISHER, 5, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherMiyagi, -1
	person_event SPRITE_FISHER, 13, 51, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherKunai, -1
	person_event SPRITE_COOLTRAINER_M, 5, 66, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerMSei, -1

