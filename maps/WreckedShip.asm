const_value = 1
	const WRECKED_SHIP_SEASHELL

WreckedShip_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_60, 0, 0
	return

WreckedShipSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundWreckedShipSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_WRECKED_SHIP_SEASHELL
	disappear WRECKED_SHIP_SEASHELL
	end
	
.NoShellBox:
	writetext WreckedShipNoShellBox
	waitbutton
	closetext
	end
	
WreckedShipNoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundWreckedShipSeashell:
	text "You found a rare"
	line "seashell!"
	done


WreckedShip_MapEventHeader::

.Warps: db 1
	warp_def 4, 12, 1, WRECKED_SHIP_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SEASHELL,  5,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, WreckedShipSeashellScript, EVENT_WRECKED_SHIP_SEASHELL
