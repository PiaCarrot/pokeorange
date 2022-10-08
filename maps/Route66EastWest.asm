const_value = 1
	const ROUTE_63_EAST_WEST_ITEMBALL_PINK_BOW
	const ROUTE_63_EAST_WEST_ITEMBALL_LOCK_ON
	const ROUTE_63_EAST_WEST_FISHER
	const ROUTE_63_EAST_WEST_SIGHTSEER

Route66EastWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route66EastWestPinkBow:
	itemball PINK_BOW
	
Route66EastWestLockOn:
	itemball TM_LOCK_ON
	
TrainerFisherSho:
	trainer EVENT_BEAT_FISHER_SHO, FISHER, SHO, FisherShoSeenText, FisherShoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherShoAfterText
	waitbutton
	closetext
	end

FisherShoSeenText:
	text "I'm all out of"
	line "SODA POP."
	
	para "Got any, kid?"
	done

FisherShoBeatenText:
	text "I know, I'm"
	line "dehydrated!"
	done

FisherShoAfterText:
	text "So thirsty<...>"
	done
	
TrainerSightseerFLana:
	trainer EVENT_BEAT_SIGHTSEERF_LANA, SIGHTSEERF, LANA, SightseerFLanaSeenText, SightseerFLanaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerFLanaAfterText
	waitbutton
	closetext
	end

SightseerFLanaSeenText:
	text "Eek! I dropped it!"
	done

SightseerFLanaBeatenText:
	text "My bow!"
	done

SightseerFLanaAfterText:
	text "I lost my bow. Now"
	line "my hair is a"
	cont "disaster!"
	
	para "Oh, wait!"
	line "I forgot, I have a"
	cont "spare!"
	done
	
Route66Sign:
	jumptext Route65SignText
	
Route66SignText:
	text "ROUTE 66"
	done

Route66EastWest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 12, 12, SIGNPOST_READ, Route66Sign

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 13, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route66EastWestPinkBow, EVENT_ROUTE_66_EAST_WEST_PINK_BOW
	person_event SPRITE_POKE_BALL,  6, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route66EastWestLockOn, EVENT_ROUTE_66_EAST_WEST_LOCK_ON
	person_event SPRITE_FISHER, 12, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherSho, -1
	person_event SPRITE_SIGHTSEER_F, 15, 24, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSightseerFLana, -1
