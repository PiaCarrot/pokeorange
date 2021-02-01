const_value set 1
	const PUMMELO_NURSE
	const PUMMELO_SLOUCH

PummeloCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloNurseScript:
	jumpstd pokecenternurse

PummeloSlouchScript:
	opentext
	writetext PummeloSlouchText
	waitbutton
	closetext
	end

PummeloSlouchText:
	done

PummeloCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 5, PUMMELO_ISLAND
	warp_def 7, 5, 5, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloSlouchScript, -1
