const_value = 1

KumquatHouse2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatEastHouseLass:
	jumptextfaceplayer KumquatEastHouseLassText
	
KumquatEastHouseLassText:
	text "There's a SAILOR"
	line "at the dock who"
	cont "takes trainers to"
	cont "SHAMOUTI ISLAND."
	
	para "I hear you need a"
	line "TICKET of some"
	cont "sort, though."
	done

KumquatHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, KUMQUAT_ISLAND_EAST
	warp_def 7, 3, 3, KUMQUAT_ISLAND_EAST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KumquatEastHouseLass, -1