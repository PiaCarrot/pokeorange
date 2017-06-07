const_value set 2
	const ROUTE54_SWIMMERM1
	const ROUTE54_SWIMMERM2
	const ROUTE54_SWIMMERM3
	const ROUTE54_SWIMMERF1
	const ROUTE54_SWIMMERF2

Route54_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerSwimmerLucas:
	trainer EVENT_BEAT_SWIMMERM_LUCAS, SWIMMERM, HAIRO, SwimmerLucasSeenText, SwimmerLucasBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerLucasAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerBrand:
	trainer EVENT_BEAT_SWIMMERM_BRAND, SWIMMERM, DAISUKE, SwimmerBrandSeenText, SwimmerBrandBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerBrandAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerArnold:
	trainer EVENT_BEAT_SWIMMERM_ARNOLD, SWIMMERM, JUNPEI, SwimmerArnoldSeenText, SwimmerArnoldBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerArnoldAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerPaula:
	trainer EVENT_BEAT_SWIMMERF_PAULA, SWIMMERF, REINA, SwimmerPaulaSeenText, SwimmerPaulaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerPaulaAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerUmiko:
	trainer EVENT_BEAT_SWIMMERF_UMIKO, SWIMMERF, UMIKO, SwimmerUmikoSeenText, SwimmerUmikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerUmikoAfterText
	waitbutton
	closetext
	end
	
Route54Sign:
	jumptext Route54SignText

NicoSign:
	jumptext NicoSignText
	
.Text:

SwimmerLucasSeenText:
	text "Did you see those"
	line "two weirdos in"
	cont "TEAM ROCKET out-"
	cont "fits earlier?"
	done

SwimmerLucasBeatenText:
	text "I wonder who they"
	line "are?"
	done

SwimmerLucasAfterText:
	text "I wonder who they"
	line "are?"
	done
	
SwimmerBrandSeenText:
	text "Racing #MON"
	line "is the best exer-"
	cont "cise!"
	done

SwimmerBrandBeatenText:
	text "Are you faster"
	line "than me?"
	done

SwimmerBrandAfterText:
	text "I'll beat the"
	line "world record some"
	cont "day!"
	done
	
SwimmerArnoldSeenText:
	text "My #MON"
	line "have been raised"
	cont "with care!"
	
	para "Let's see who's"
	line "stronger!"
	done

SwimmerArnoldBeatenText:
	text "Yo, that was a"
	line "good fight!"
	done

SwimmerArnoldAfterText:
	text "That wasn't too"
	line "bad!"
	done
	
SwimmerPaulaSeenText:
	text "I see you're"
	line "heading to"
	cont "MANDARIN NORTH."
	
	para "Care to spar"
	line "with me first?"
	done

SwimmerPaulaBeatenText:
	text "Ohoho, not bad!"
	done

SwimmerPaulaAfterText:
	text "Ohohoho! STARYU"
	line "was no match for"
	cont "you!"
	done

SwimmerUmikoSeenText:
	text "Yikes! I think a"
	line "MAREANIE almost"
	cont "touched me!"
	done

SwimmerUmikoBeatenText:
	text "Thank goodness, it"
	line "was just some sea-"
	cont "weed<...>"
	done

SwimmerUmikoAfterText:
	text "Thank goodness, it"
	line "was just some sea-"
	cont "weed<...>"
	done

Route54SignText:
	text "ROUTE 54 -"
	line "MANDARIN NORTH"
	done
	
NicoSignText:
	text "NICO ISLAND"
	
	para "Nico nico nii!"
	done

Route54_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 40, 4, SIGNPOST_READ, Route54Sign
	signpost 9, 13, SIGNPOST_READ, NicoSign

.ObjectEvents: db 5
	person_event SPRITE_SWIMMER_GUY, 38, 4, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerLucas, -1
	person_event SPRITE_SWIMMER_GUY, 36, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerBrand, -1
	person_event SPRITE_SWIMMER_GUY, 26, 4, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerArnold, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 7, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerUmiko, -1
	person_event SPRITE_SWIMMER_GIRL, 30, 8, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerPaula, -1

