const_value = 1
	const ROUTE_65_HIKER_DALE
	const ROUTE_65_YOUNGSTER_ORO
	const ROUTE_65_PP_UP

Route65_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route65PPUp:
	itemball PP_UP

; BLACKBELT_KEN
TrainerBlackbeltKen:
	trainer EVENT_BEAT_BLACKBELT_KEN, BLACKBELT_T, KEN, BlackbeltKenSeenText, BlackbeltKenWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltKenAfterText
	waitbutton
	closetext
	end
	
BlackbeltKenSeenText:
	text "Ho! Ha! Hee!"
	
	para "Wataaaaaa!"
	
	para "You are already"
	line "defeated!"
	done
	
BlackbeltKenWinText:
	text "What?"
	done
	
BlackbeltKenAfterText:
	text "I will continue to"
	line "train under the"
	cont "way of the NORTH"
	cont "STAR."
	done
	
; YOUNGSTER_Oro
TrainerYoungsterOro:
	trainer EVENT_BEAT_YOUNGSTER_ORO, YOUNGSTER, ORO, YoungsterOroSeenText, YoungsterOroWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterOroAfterText
	waitbutton
	closetext
	end
	
YoungsterOroSeenText:
	text "It's getting hard"
	line "to level up my"
	cont "#MON!"
	
	para "Maybe the EXP I'll"
	line "get from you will"
	cont "help!"
	done
	
YoungsterOroWinText:
	text "Seems you got EXP"
	line "from me instead!"
	done
	
YoungsterOroAfterText:
	text "I'm sure you've"
	line "noticed, but"
	cont "higher level"
	cont "#MON give more"
	
	para "EXP than a lower"
	line "leveled one will."
	done
	
Route65Sign:
	jumptext Route65SignText
	
Route65SignText:
	text "ROUTE 65"
	done

Route65_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 13, 21, SIGNPOST_READ, Route65Sign

.ObjectEvents: db 3
	person_event SPRITE_BLACK_BELT, 14, 15, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBlackbeltKen, -1
	person_event SPRITE_YOUNGSTER, 20, 28, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterOro, -1
	person_event SPRITE_POKE_BALL, 5, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route65PPUp, EVENT_ROUTE_65_PP_UP

