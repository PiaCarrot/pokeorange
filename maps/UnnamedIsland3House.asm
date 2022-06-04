const_value = 1
	const UNNAMED_ISLAND_3_JESSIE
	const UNNAMED_ISLAND_3_JAMES
	const UNNAMED_ISLAND_3_MEOWTH

UnnamedIsland3House_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

UnnamedIsland3JessieScript:
	jumptext UnnamedIsland3JessieText
	
UnnamedIsland3JessieText:
	text "Ohh<...>"
	line "Prepare for<...>"
	cont "twerp<...>"
	done
	
UnnamedIsland3JamesScript:
	jumptext UnnamedIsland3JamesText

UnnamedIsland3JamesText:
	text "MEOWTH<...>"
	line "Tell<...>GROWLIE."
	cont "DADDY loves him<...>"
	done
	
UnnamedIsland3MeowthScript:
	faceplayer
	showemote EMOTE_SHOCK, UNNAMED_ISLAND_3_MEOWTH, 15
	opentext
	checkitem SALVEYO_WEED
	iftrue .HaveSalveyoWeed
	writetext MeowthNeedsSalveyoWeedText
	waitbutton
	closetext
	end
	
.HaveSalveyoWeed
	writetext GiveMeowthSalveyoWeedText
	yesorno
	iffalse .DontGiveSalveyoWeed
	closetext
	takeitem SALVEYO_WEED
	spriteface UNNAMED_ISLAND_3_MEOWTH, LEFT
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	applymovement PLAYER, UnnamedIsland3PlayerMovement
	spriteface PLAYER, RIGHT
	spriteface UNNAMED_ISLAND_3_MEOWTH, DOWN
	applymovement UNNAMED_ISLAND_3_MEOWTH, UnnamedIsland3MeowthMovement
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	spriteface UNNAMED_ISLAND_3_MEOWTH, RIGHT
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	spriteface UNNAMED_ISLAND_3_MEOWTH, LEFT
	opentext
	writetext MeowthDoneHealingText
	waitbutton
	verbosegiveitem HM_WATERFALL
	writetext MeowthLeavingUnnamedIsland3Text
	waitbutton
	closetext
	disappear UNNAMED_ISLAND_3_JESSIE
	disappear UNNAMED_ISLAND_3_JAMES
	disappear UNNAMED_ISLAND_3_MEOWTH
	special Special_FadeInQuickly
	end
	
	
.DontGiveSalveyoWeed:
	writetext DidntGiveSalveyoWeedText
	waitbutton
	closetext
	end

MeowthNeedsSalveyoWeedText:
	text "You, the twerp!"
	
	para "I know we 'ave"
	line "our<...>differences,"
	cont "but my buddies are"
	cont "in real trouble!"
	
	para "They gots a sudden"
	line "fevah!"
	
	para "They took a whif"
	line "of dah flowers,"
	cont "and turns out they"
	cont "was sniffin' VILE-"
	
	para "PLUME! I know"
	line "what ta' get 'em"
	cont "but I needs ta'"
	cont "watch dem."
	
	para "Wouldya be a pal"
	line "and get a cat some"
	cont "SALVEYO WEED?"
	
	para "It grows inside"
	line "dah ponds here!"
	done
	
GiveMeowthSalveyoWeedText:
	text "My buds are sick!"
	line "I needs SALVEYO"
	cont "WEED to cure 'em!"
	
	para "Give the SALVEYO"
	line "WEED to MEOWTH?"
	done
	
DidntGiveSalveyoWeedText:
	text "Hang in there,"
	line "guys!"
	done
	
MeowthDoneHealingText:
	text "They should be"
	line "good to go now!"
	
	para "Anyways, kid."
	line "You ain't so bad!"
	
	para "Take this, it's"
	line "not much<...>"
	
	para "Rather, I found"
	line "it in the guttah,"
	cont "but it's yours!"
	done
	
MeowthLeavingUnnamedIsland3Text:
	text "Well, we bettah"
	line "get goin'!"
	
	para "And don't tell"
	line "JESSIE and JAMES"
	cont "that ya' saved"
	cont "'em!"
	done
	
UnnamedIsland3PlayerMovement:
	step DOWN
	step LEFT
	step_end
	
UnnamedIsland3MeowthMovement:
	step DOWN
	step DOWN
	step_end
	

UnnamedIsland3House_MapEventHeader::

.Warps: db 2
	warp_def  5,  2, 1, UNNAMED_ISLAND_3
	warp_def  5,  3, 1, UNNAMED_ISLAND_3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_JESSIE,  4,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, 0, 0, UnnamedIsland3JessieScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED
	person_event SPRITE_JAMES,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3JamesScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED
	person_event SPRITE_ROCKET_MEOWTH,  2,  6, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, UnnamedIsland3MeowthScript, EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED

