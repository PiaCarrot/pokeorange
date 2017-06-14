const_value set 2
	const ROUTE52_FISHER1
	const ROUTE52_FISHER2
	const ROUTE52_FISHER3
	const ROUTE52_YOUNGSTER1
	const ROUTE52_YOUNGSTER2
	const ROUTE52_YOUNGSTER3
	const ROUTE52_LASS1
	const ROUTE52_YOUNGSTER4
	const ROUTE52_POKE_BALL1
	const ROUTE52_FISHER5
	const ROUTE52_POKE_BALL2

Route52_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCamperSamm:
	trainer EVENT_BEAT_CAMPER_SAMM, CAMPER, SAMM, CamperSammSeenText, CamperSammBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperSammAfterText
	waitbutton
	closetext
	end

TrainerFisherSojiro:
	trainer EVENT_BEAT_FISHER_SOJIRO, FISHER, SOJIRO, FisherSojiroSeenText, FisherSojiroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherSojiroAfterText
	waitbutton
	closetext
	end

TrainerFisherFugu:
	trainer EVENT_BEAT_FISHER_FUGU, FISHER, FUGU, FisherFuguSeenText, FisherFuguBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherFuguAfterText
	waitbutton
	closetext
	end


TrainerFisherNobu:
	trainer EVENT_BEAT_FISHER_NOBU, FISHER, NOBU, FisherNobuSeenText, FisherNobuBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherNobuAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfYuka:
	trainer EVENT_BEAT_SWIMMERF_YUKA, SWIMMERF, YUKA, SwimmerfYukaSeenText, SwimmerfYukaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfYukaAfterText
	waitbutton
	closetext
	end

TrainerSwimmermTheo:
	trainer EVENT_BEAT_SWIMMERM_THEO, SWIMMERM, THEO, SwimmermTheoSeenText, SwimmermTheoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermTheoAfterText
	waitbutton
	closetext
	end

TrainerYoungsterBowie:
	trainer EVENT_BEAT_YOUNGSTER_BOWIE, YOUNGSTER, BOWIE, YoungsterBowieSeenText, YoungsterBowieBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterBowieAfterText
	waitbutton
	closetext
	end

TrainerSwimmermAtecain:
	trainer EVENT_BEAT_SWIMMERM_ATECAIN, SWIMMERM, ATECAIN, SwimmermAtecainSeenText, SwimmermAtecainBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermAtecainAfterText
	waitbutton
	closetext
	end

Route52GreatBall:
	itemball GREAT_BALL

Route52Repel:
	itemball REPEL

Route52Sign:
	jumptext Route52SignText

Route52PokeCenterSign:
	jumpstd pokecentersign

Route52HiddenGreatBall:
	dwb EVENT_ROUTE_52_HIDDEN_GREAT_BALL, GREAT_BALL

Route52HiddenSuperPotion:
	dwb EVENT_ROUTE_52_HIDDEN_SUPER_POTION, SUPER_POTION

FisherSojiroSeenText:
	text "I been lookin'"
	line "for a fish to"
	cont "catch. Looks to"
	cont "me I caught you!"
	done

FisherSojiroBeatenText:
	text "Fishing's fun!"
	done

FisherSojiroAfterText:
	text "Calm, collected<...>"
	line "The essence of"

	para "fishing and #-"
	line "MON is the same."
	done

FisherFuguSeenText:
	text "#MON caught"
	line "on a ROD are"
	cont "much cooler than"
	cont "anything you got!"

	para "I'll show ya!"
	done

FisherFuguBeatenText:
	text "Darn. I should've"
	line "used my ace<...>"
	done

FisherFuguAfterText:
	text "You're good, kid."
	done

FisherNobuSeenText:
	text "My #MON?"
	line "Freshly caught!"
	done

FisherNobuBeatenText:
	text "Off to the SUSHI"
	line "stand they go<...>"
	done

FisherNobuAfterText:
	text "Freshly caught"
	line "#MON taste"
	cont "phenomenal!"
	done

SwimmermTheoSeenText:
	text "Man I'm starving."
	line "Could use a JELLY-"
	cont "FILLED DONUT right"
	cont "now."
	done

SwimmermTheoBeatenText:
	text "Or was it a RICE-"
	line "BALL?"
	done

SwimmermTheoAfterText:
	text "Mmm<...> DONUTS<...>"
	done

YoungsterBowieSeenText:
	text "There's some rare"
	line "#MON in the"
	cont "grass here."
	done

YoungsterBowieBeatenText:
	text "But my #MON"
	line "is rare!"
	done

YoungsterBowieAfterText:
	text "TANGELA is still"
	line "a pretty good"
	cont "#MON."
	done

CamperSammSeenText:
	text "Want that item?"
	line "Gonna have to"
	cont "beat me first."
	done

CamperSammBeatenText:
	text "Ugh. Take it."
	done

CamperSammAfterText:
	text "It's not even a"
	line "good item."
	done

SwimmerfYukaSeenText:
	text "CISSY is a WATER-"
	line "TYPE trainer. If"
	cont "can't beat me you"
	cont "are hopeless!"
	done

SwimmerfYukaBeatenText:
	text "Ooh, you've got"
	line "a chance!"
	done

SwimmerfYukaAfterText:
	text "Good luck!"
	done

SwimmermAtecainSeenText:
	text "Diving for rubies"
	line "to make THONSU."

	para "Is new invention"
	line "to add FLUTE of"
	cont "mystical power."
	done

SwimmermAtecainBeatenText:
	text "Do not said give"
	line "you money."
	done

SwimmermAtecainAfterText:
	text "I stop now. SUN"
	line "is getting DIRTY."
	done

Route52SignText:
	text "ROUTE 52"

	para "TANGELO -"
	line "MIKAN"
	done

Route52_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 77, 13, 1, ROUTE_52_POKECENTER_1F
	warp_def 83, 7, 1, ROUTE_52_TANGELO_JUNGLE_GATE
	warp_def 83, 8, 2, ROUTE_52_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 80, 8, SIGNPOST_READ, Route52Sign
	signpost 77, 14, SIGNPOST_READ, Route52PokeCenterSign
	signpost 81, 4, SIGNPOST_ITEM, Route52HiddenGreatBall
	signpost 49, 16, SIGNPOST_ITEM, Route52HiddenSuperPotion

.ObjectEvents: db 10
	person_event SPRITE_FISHER, 41, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherSojiro, -1
	person_event SPRITE_FISHER, 30, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherFugu, -1
	person_event SPRITE_FISHER, 32, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherNobu, -1
	person_event SPRITE_SWIMMER_GUY, 15, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermTheo, -1
	person_event SPRITE_YOUNGSTER, 53, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterBowie, -1
	person_event SPRITE_YOUNGSTER, 16, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperSamm, -1
	person_event SPRITE_SWIMMER_GIRL, 23, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfYuka, -1
	person_event SPRITE_SWIMMER_GUY, 43, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmermAtecain, -1
	person_event SPRITE_POKE_BALL, 54, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52GreatBall, EVENT_ROUTE_52_GREAT_BALL
	person_event SPRITE_POKE_BALL, 14, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52Repel, EVENT_ROUTE_52_REPEL

