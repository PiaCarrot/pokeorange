const_value = 1
	const TROVITA_PORT_SAILOR

TrovitaPort_MapScriptHeader:

.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrovitaPortSailorScript:
	faceplayer
	opentext
	writetext TrovitaPortSailorText
	yesorno
	iftrue .ToTrovitopolis
	closetext
	end
	
.ToTrovitopolis:
	writetext TrovitaSailorAhoyText
	waitbutton
	closetext
	spriteface TROVITA_PORT_SAILOR, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TROVITA_PORT_SAILOR
	waitsfx
	applymovement PLAYER, TrovitaSailorMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear TROVITA_PORT_SAILOR
	warp TROVITOPOLIS_PORT, 11, 7 ;TROVITA_PORT
	end

TrovitaSailorMovement:
	step UP
	step_end

TrovitaPortSailorText:
	text "Ready to head back"
	line "to TROVITOPOLIS?"
	done

TrovitaSailorAhoyText:
	text "Alright! Off we"
	line "go!"
	done

TrovitaPort_MapEventHeader::

.Warps: db 2
	warp_def 19, 10, 1, TROVITA_ISLAND
	warp_def 19, 11, 1, TROVITA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SAILOR, 6, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitaPortSailorScript, -1
