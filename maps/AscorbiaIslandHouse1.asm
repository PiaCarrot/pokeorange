const_value = 1
	const ASCORBIA_DITTO_GUY

AscorbiaIslandHouse1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaDittoGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ASCORBIA_GOT_METAL_POWDER
	iftrue .AlreadyGotMetalPowder	
	writetext AscorbiaDittoGuyText
	yesorno
	iffalse .SaidNo
	special Special_BillsGrandfather
	iffalse .SaidNo
	if_not_equal DITTO, .SaidNo
	writetext AscorbiaDittoGuyText4
	waitbutton
	verbosegiveitem METAL_POWDER
	iffalse AscorbiaDittoGuyDoneScript
	closetext
	setevent EVENT_ASCORBIA_GOT_METAL_POWDER
	end
	
.AlreadyGotMetalPowder
	writetext AscorbiaDittoGuyText2
	waitbutton
	closetext
	end
	
.SaidNo
	writetext AscorbiaDittoGuyText3
	waitbutton
	closetext
	end
	
AscorbiaDittoGuyDoneScript:
	closetext
	end

AscorbiaDittoGuyText:
	text "I love DITTO!"
	line "But I don't own"
	cont "one!"
	
	para "Can you please"
	line "show me a DITTO?"
	done

AscorbiaDittoGuyText2:
	text "METAL POWDER"
	line "doubles DITTO's"
	cont "DEFENSE!"
	done

AscorbiaDittoGuyText3:
	text "Aw, you don't have"
	line "it?"
	done
	
AscorbiaDittoGuyText4:
	text "That's it!"
	line "It's so cute!"
	
	para "Thank you for"
	line "showing me DITTO!"
	cont "Here's a token of"
	cont "my gratitude."
	done

AscorbiaIslandHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, ASCORBIA_ISLAND
	warp_def 7, 3, 5, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, AscorbiaDittoGuyScript, -1