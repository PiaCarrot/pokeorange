const_value set 2
	const INFO_WAITRESS
	const WAITRESS_SATOMI
	const WAITRESS_NAOMI
	const WAITRESS_SAORI
	const WAITRESS_JUN

KinnowCafe_MapScriptHeader::

.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KinnowCafe_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 9, 2, 6, KINNOW_ISLAND
	warp_def 9, 3, 6, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
;	person_event SPRITE_COOLTRAINER_F, 6, 0, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 1, WaitressInfo, -1
;	person_event SPRITE_COOLTRAINER_F, 2, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, WaitressSatomi, -1
;	person_event SPRITE_COOLTRAINER_F, 4, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 1, WaitressNaomi, -1
;	person_event SPRITE_COOLTRAINER_F, 5, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, WaitressSaori, -1
;	person_event SPRITE_COOLTRAINER_F, 7, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, WaitressJun, -1

