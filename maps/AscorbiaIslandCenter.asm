const_value set 1
	const ASCORBIA_NURSE
	const ASCORBIA_SLOUCH

AscorbiaIslandCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

AscorbiaNurseScript:
	jumpstd pokecenternurse

AscorbiaSlouchScript:
	opentext
	writetext AscorbiaSlouchText
	waitbutton
	closetext
	end

AscorbiaSlouchText:
	text "PLACEHOLDER."
	done

AscorbiaIslandCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 8, ASCORBIA_ISLAND
	warp_def 7, 5, 8, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaSlouchScript, -1
