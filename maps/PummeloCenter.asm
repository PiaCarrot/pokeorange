const_value = 1
	const PUMMELO_NURSE
	const PUMMELO_SLOUCH
	const PUMMELO_CENTER_FISHER

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
	text "They say there was"
	line "an ORANGE CREW"
	cont "CHAMPION who sunk"
	cont "at sea nearly 300"
	
	para "years ago. I think"
	line "it was somewhere"
	cont "near MORO ISLAND."
	done
	
PummeloCenterFisherScript:
	jumptextfaceplayer PummeloCenterFisherScriptText
	
PummeloCenterFisherScriptText:
	text "I've seen some"
	line "rocky walls that"
	cont "look climbable."
	
	para "I wonder if there"
	line "is a #MON"
	cont "move that can do"
	cont "it?"
	done

PummeloCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 11, PUMMELO_ISLAND
	warp_def 7, 5, 11, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloSlouchScript, -1
	person_event SPRITE_FISHER, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloCenterFisherScript, -1
