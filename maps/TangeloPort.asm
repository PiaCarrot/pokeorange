const_value set 2
	const TANGELOPORT_SAILOR

TangeloPort_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TangeloPortSailorScript:
	faceplayer
	opentext
	writetext TangeloPortSailorText
	yesorno
	iftrue .ToValencia
	closetext
	end

.ToValencia:
	writetext TangeloPortSailorAhoyText
	waitbutton
	closetext
	spriteface TANGELOPORT_SAILOR, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TANGELOPORT_SAILOR
	waitsfx
	applymovement PLAYER, SailorMove1
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear TANGELOPORT_SAILOR
	warp VALENCIA_PORT, 9, 7
	end

SailorMove1:
	step UP
	step_end

TangeloPortSailorText:
	text "Hey, kid! Do you"
	line "need a ride to"
	cont "VALENCIA ISLAND?"
	done

TangeloPortSailorAhoyText:
	text "Alright! Off we"
	line "go!"
	done

TangeloPort_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 8, 5, TANGELO_ISLAND
	warp_def 19, 9, 5, TANGELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SAILOR, 6, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloPortSailorScript, -1

