const_value = 1

MurcottHouse3_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottPharmacistScript:
	faceplayer
	opentext
	writetext PharmacistText1
	yesorno
	iftrue .MakeMedicine
	closetext
	end
	
.MakeMedicine:
	checkitem PINKAN_BERRY
	iffalse .NoBerries
	writetext PharmacistText2
	verbosegiveitem PINK_CURE
	iffalse PharmacistDoneScript
	takeitem PINKAN_BERRY
	waitbutton
	closetext
	end
	
.NoBerries:
	writetext PharmacistText3
	waitbutton
	closetext
	end
	
PharmacistDoneScript:
	closetext
	end
	
PharmacistText1:
	text "Hello. I'm the"
	line "pharmacist here."
	
	para "If you bring me a"
	line "PINKAN BERRY, I"
	cont "can make some"
	cont "PINK CURE."
	
	para "Do you need some"
	line "medicine made?"
	done
	
PharmacistText2:
	text "I'll make some"
	line "right away."
	
	para "<...>"
	
	para "<...>"
	
	para "Here you go!"
	done

PharmacistText3:
	text "You don't have any"
	line "PINKAN BERRIES."
	done

MurcottHouse3_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, MURCOTT_ISLAND
	warp_def 7, 3, 4, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_PHARMACIST, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MurcottPharmacistScript, -1

