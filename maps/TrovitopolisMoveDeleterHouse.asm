const_value = 1
	
TrovitopolisMoveDeleterHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

TrovitopolisMoveDeleterHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, TROVITOPOLIS
	warp_def 7, 3, 6, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoveDeleter, -1