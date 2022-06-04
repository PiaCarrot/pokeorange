const_value = 1
	const KUMQUAT_NURSE
	const KUMQUAT_SLOUCH

KumquatCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KumquatCenterNurseScript:
	jumpstd pokecenternurse

KumquatCenterSlouchScript:
	opentext
	writetext KumquatCenterSlouchText
	waitbutton
	closetext
	end

KumquatCenterSlouchText:
	text "Past this island"
	line "is VICTORY ROAD."
	
	para "It's a rocky crag"
	line "that the strongest"
	cont "TRAINERS gather to"
	cont "stomp competition."
	done


KumquatCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 4, KUMQUAT_ISLAND_EAST
	warp_def 7, 5, 4, KUMQUAT_ISLAND_EAST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatCenterNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatCenterSlouchScript, -1
