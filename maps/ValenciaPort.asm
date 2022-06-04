const_value = 1
	const VALENCIAPORT_SAILOR
	const VALENCIAPORT_FISHING_GURU

ValenciaPort_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SailorScript:
	faceplayer
	opentext
	writetext SailorText
	yesorno
	iftrue .ToTangelo
	closetext
	end

.ToTangelo:
	writetext SailorAhoyText
	waitbutton
	closetext
	spriteface VALENCIAPORT_SAILOR, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear VALENCIAPORT_SAILOR
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear VALENCIAPORT_SAILOR
	warp TANGELO_PORT, 11, 7
	end

FishingGuruScript_0x74a01:
	faceplayer
	opentext
	writetext UnknownText_0x74bf4
	waitbutton
	closetext
	spriteface VALENCIAPORT_FISHING_GURU, LEFT
	end

ValenciaPortHiddenSuperPotion:
	dwb EVENT_VALENCIA_PORT_HIDDEN_SUPER_POTION, SUPER_POTION

MovementData_0x74a30:
	step UP
	step_end

SailorText:
	text "Hey, kid! Do you"
	line "need a ride to"
	cont "TANGELO ISLAND?"
	done

SailorAhoyText:
	text "Alright! Off we"
	line "go!"
	done

UnknownText_0x74bf4:
	text "Fish in ports when"
	line "you can!"

	para "Some #MON"
	line "only appear around"
	cont "them."
	done

ValenciaPort_MapEventHeader::

.Warps: db 2
	warp_def 19, 10, 1, ROUTE_49
	warp_def 19, 11, 1, ROUTE_49

.CoordEvents: db 0

.BGEvents: db 1
	signpost 11, 9, SIGNPOST_ITEM, ValenciaPortHiddenSuperPotion

.ObjectEvents: db 2
	person_event SPRITE_SAILOR, 6, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript, -1
	person_event SPRITE_FISHING_GURU, 9, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x74a01, -1
