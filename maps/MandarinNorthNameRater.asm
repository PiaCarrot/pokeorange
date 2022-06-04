const_value = 1
	const MANDARINNORTH_NAME_RATER

MandarinNorthNameRater_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenrodNameRater:
	faceplayer
	opentext
	special SpecialNameRater
	waitbutton
	closetext
	end

MandarinNorthNameRaterBookshelf:
	jumpstd difficultbookshelf

MandarinNorthNameRater_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 2, MANDARIN_NORTH
	warp_def 7, 3, 2, MANDARIN_NORTH

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, MandarinNorthNameRaterBookshelf
	signpost 1, 1, SIGNPOST_READ, MandarinNorthNameRaterBookshelf

.ObjectEvents: db 1
	person_event SPRITE_GENTLEMAN, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenrodNameRater, -1
