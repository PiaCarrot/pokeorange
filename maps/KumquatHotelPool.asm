const_value set 1
	const KUMQUAT_POOL_TRAINER_1
	const KUMQUAT_POOL_TRAINER_2
	const KUMQUAT_POOL_TRAINER_3
	const KUMQUAT_POOL_TRAINER_4
	const KUMQUAT_POOL_KEY_TRAINER_

KumquatHotelPool_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

PlaceholderScript:
	end

KumquatHotelPool_MapEventHeader::

.Warps: db 2
	warp_def 15, 9, 3, KUMQUAT_HOTEL_LOBBY
	warp_def 15, 10, 3, KUMQUAT_HOTEL_LOBBY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F,  5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, PlaceholderScript, -1
	person_event SPRITE_COOLTRAINER_F,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, PlaceholderScript, -1
	person_event SPRITE_COOLTRAINER_M,  5,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, PlaceholderScript, -1
	person_event SPRITE_COOLTRAINER_M,  9, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, PlaceholderScript, -1
	person_event SPRITE_SWIMMER_GIRL,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 3, PlaceholderScript, -1
