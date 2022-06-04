const_value = 1
	const KINNOWMART_CLERK
	const KINNOWMART_LASS

KinnowMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_KINNOW
	closetext
	end

KinnowMartLassScript:
	jumptextfaceplayer KinnowMartLassText

KinnowMartLassText:
	text "I heard there's an"
	line "old lady who sells"
	cont "bitter herbs."

	para "They work wonders,"
	line "but they taste bad"
	cont "to #MON."
	done

KinnowMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, KINNOW_ISLAND
	warp_def 7, 3, 5, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowClerkScript, -1
	person_event SPRITE_LASS, 2, 9, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KinnowMartLassScript, -1
