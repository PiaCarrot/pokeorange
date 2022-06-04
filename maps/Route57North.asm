const_value = 1
	const ROUTE_57_NORTH_SIGHTSEERM_KENTA
	const ROUTE_57_NORTH_FISHERMAN_
	const ROUTE_57_NORTH_MAX_REVIVE

Route57North_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrainerSightSeerKenta:
	trainer EVENT_BEAT_SIGHTSEERM_KENTA, SIGHTSEERM, KENTA, SightSeerKentaSeenText, SightSeerKentaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightSeerKentaAfterText
	waitbutton
	closetext
	end

SightSeerKentaSeenText:
	text "It's a secret to"
	line "everyone."
	done

SightSeerKentaBeatenText:
	text "Woah!"
	done

SightSeerKentaAfterText:
	text "Did you know?"
	line "SALAZZLE will only"
	cont "evolve from FEMALE"
	cont "SALANDIT."
	done
	
TrainerFisherShinji:
	trainer EVENT_BEAT_FISHER_SHINJI, FISHER, SHINJI, FisherShinjiSeenText, FisherShinjiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherShinjiAfterText
	waitbutton
	closetext
	end

FisherShinjiSeenText:
	text "Kid, you need a"
	line "SUPER ROD to catch"
	cont "SUPER #MON!"
	done

FisherShinjiBeatenText:
	text "That's just SUPER."
	done

FisherShinjiAfterText:
	text "Hmph. You can get"
	line "a SUPER ROD some-"
	cont "where on KUMQUAT."
	done
	
Route57NorthMaxRevive:
	itemball MAX_REVIVE

Route57North_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_COOLTRAINER_M, 20, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightSeerKenta, -1
	person_event SPRITE_FISHER, 7, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherShinji, -1
	person_event SPRITE_POKE_BALL, 28, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route57NorthMaxRevive, EVENT_ROUTE_57_NORTH_MAX_REVIVE

