const_value = 1

ShamoutiBayHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ShamoutiSailor:
	faceplayer
	opentext
	writetext ShamoutiBayHouseSailorText2
	yesorno
	iftrue .OffWeGoToKumquat
	closetext
	end
	
.OffWeGoToKumquat
	writetext ShamoutiBayHouseSailorText3
	waitbutton
	closetext
	warp KUMQUAT_ISLAND_WEST, 12, 26
	end
	
ShamoutiBayHouseSailorText2:
	text "Oh, you want to"
	line "go back to KUMQUAT"
	cont "ISLAND?"
	done
	
ShamoutiBayHouseSailorText3:
	text "You must have"
	line "forgotten your"
	cont "FLYING #MON!"
	
	para "Off we go!"
	done

ShamoutiBayHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 1, SHAMOUTI_BAY
	warp_def $7, $4, 1, SHAMOUTI_BAY

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_COOLTRAINER_F,  3,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShamoutiSailor, -1
