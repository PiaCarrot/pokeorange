const_value = 1
	const KINNOWLOREHOUSE_ROCKER

KinnowLoreHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowRockerLoreScript:
	jumptextfaceplayer KinnowRockerLoreText

KinnowRockerLoreText:
	text "Hey, kid!"

	para "Have you been to"
	line "the SKATE SHOP?"

	para "Skateboarding is"
	line "the way to go for"
	cont "land travel!"
	done

KinnowLoreHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 2, KINNOW_ISLAND
	warp_def 7, 3, 2, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KinnowRockerLoreScript, -1
