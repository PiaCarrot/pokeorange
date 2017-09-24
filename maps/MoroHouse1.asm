const_value set 2

MoroHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroHeadbuttScript:
	faceplayer
	checkevent EVENT_HEADBUTT_GUY
	iftrue .AlreadyHaveHeadbutt
	opentext
	writetext GivePlayerHeadbuttText
	waitbutton
	verbosegiveitem TM_HEADBUTT
	closetext
	setevent EVENT_HEADBUTT_GUY
	end
	
.AlreadyHaveHeadbutt:
	opentext
	faceplayer
	writetext AlreadyGaveYouHeadbuttText
	waitbutton
	closetext
	end
	
GivePlayerHeadbuttText:
	text "Hey, have you seen"
	line "those thick vines?"
	
	para "Sometimes, #MON"
	line "live inside them."
	cont "You can use this"
	cont "to draw them out!"
	done

AlreadyGaveYouHeadbuttText:
	text "HEADBUTT can be"
	line "used to shake"
	cont "thick vines."
	done

MoroHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, MORO_ISLAND
	warp_def 7, 3, 5, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MoroHeadbuttScript, -1
