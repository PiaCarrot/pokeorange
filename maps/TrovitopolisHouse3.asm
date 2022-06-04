const_value = 1
	
TrovitopolisHouse3_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisWildHintScript:
	jumptextfaceplayer TrovitopolisWildHintText
	
TrovitopolisWildHintText:
	text "This time of year,"
	line "MAGIKARP can only"
	cont "be found on RIND"
	cont "ISLAND."
	
	para "It's the mating"
	line "season."
	done

TrovitopolisHouse3_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 9, TROVITOPOLIS
	warp_def 7, 3, 9, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrovitopolisWildHintScript, -1