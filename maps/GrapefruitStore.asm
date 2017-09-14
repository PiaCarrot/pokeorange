const_value set 2
	const GRAPEFRUIT_LASS
	const GRAPEFRUIT_VENDOR

GrapefruitStore_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0
	
GrapefruitLassScript:
	jumptextfaceplayer GrapefruitLassText
	
GrapefruitSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST3
	closetext
	end
	
GrapefruitLassText:
	text "The GRAPEFRUIT"
	line "grown here are so"
	cont "tasty!"
	done

GrapefruitStore_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 5, 1, 1, SEVEN_GRAPEFRUITS
	warp_def 5, 2, 1, SEVEN_GRAPEFRUITS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 2, 2, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GrapefruitLassScript, -1
	person_event SPRITE_YOUNGSTER, 5, 5, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrapefruitSalesmanScript, -1

