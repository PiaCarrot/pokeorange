const_value = 1
	const TROVITOPOLIS_MR_FLASH
	
TrovitopolisMrFlashHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MrFlashScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_FLASH
	iftrue .AlreadyGotFlash
	writetext MrFlashText
	waitbutton
	verbosegiveitem TM_FLASH
	setevent EVENT_GOT_TM_FLASH
	closetext
	end
	
.AlreadyGotFlash:
	writetext AlreadyGotFlashText
	waitbutton
	closetext
	end

MrFlashText:
	text "MR. FLASH: Look"
	line "who FLASHed by!"
	
	para "Hey there, FLASHy"
	line "kid. You sure gave"
	cont "me a FLASHback!"
	
	para "I like to give"
	line "FLASHing light-"
	cont "bulbs like you"
	cont "presents."
	
	para "Here you go!"
	done
	
AlreadyGotFlashText:
	text "MR. FLASH: That"
	line "FLASHy TM there"
	cont "contains FLASH."
	
	para "You can light the"
	line "darkest caves"
	cont "right up with a"
	cont "FLASHing bang!"
	done

TrovitopolisMrFlashHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, TROVITOPOLIS
	warp_def 7, 3, 5, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_M, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MrFlashScript, -1
