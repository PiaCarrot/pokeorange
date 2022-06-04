const_value = 1
	
TrovitopolisHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisBugBoyScript:
	jumptextfaceplayer TrovitopolisBugBoyText
	
TrovitopolisBugBoyText:
	text "PINSIR is an odd"
	line "#MON."
	
	para "It's compared to"
	line "SCYTHER often, but"
	cont "PINSIR doesn't"
	cont "evolve."
	
	para "I wonder if one"
	line "day someone will"
	cont "discover a new"
	cont "evolution method?"
	done

TrovitopolisHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 8, TROVITOPOLIS
	warp_def 7, 3, 8, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BUG_BOY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisBugBoyScript, -1