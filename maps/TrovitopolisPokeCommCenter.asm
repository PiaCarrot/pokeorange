const_value set 1
	const TROVITOPOLIS_NURSE

TrovitopolisPokeCommCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisPokeCommCenter_MapEventHeader::

.Warps: db 2
	warp_def 21, 6, 2, TROVITOPOLIS
	warp_def 21, 7, 2, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_NURSE, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunburstNurseScript, -1

