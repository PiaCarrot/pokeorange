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

Route52RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	buttonsound
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

TrainerCamperRoland:
	trainer EVENT_BEAT_CAMPER_ROLAND, CAMPER, SAMM, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer EVENT_BEAT_FISHER_JUSTIN, FISHER, SOJIRO, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph:
	trainer EVENT_BEAT_FISHER_RALPH, FISHER, FUGU, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherRalphAfterText
	waitbutton
	closetext
	end


TrainerFisherHenry:
	trainer EVENT_BEAT_FISHER_HENRY, FISHER, NOBU, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz:
	trainer EVENT_BEAT_PICNICKER_LIZ, SWIMMERF, YUKA, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PicnickerLiz1AfterText
	waitbutton
	closetext
	end

TrainerYoungsterAlbert:
	trainer EVENT_BEAT_YOUNGSTER_ALBERT, SWIMMERM, THEO, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer EVENT_BEAT_YOUNGSTER_GORDON, YOUNGSTER, BOWIE, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBird_keeperPeter:
	trainer EVENT_BEAT_BIRD_KEEPER_PETER, SWIMMERM, ATECAIN, Bird_keeperPeterSeenText, Bird_keeperPeterBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bird_keeperPeterAfterText
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

FisherJustinSeenText:
	text "I been lookin'"
	line "for a fish to"
	cont "catch. Looks to"
	cont "me I caught you!"
	done

FisherJustinBeatenText:
	text "Fishing's fun!"
	done

FisherJustinAfterText:
	text "Calm, collected…"
	line "The essence of"

	para "fishing and #-"
	line "MON is the same."
	done

FisherRalph1SeenText:
	text "#MON caught"
	line "on a ROD are"
	cont "much cooler than"
	cont "anything you got!"

	para "I'll show ya!"
	done

FisherRalph1BeatenText:
	text "Darn. I should've"
	line "used my ace..."
	done

FisherRalphAfterText:
	text "You're good, kid."
	done

FisherHenrySeenText:
	text "My #MON?"
	line "Freshly caught!"
	done

FisherHenryBeatenText:
	text "Off to the SUSHI"
	line "stand they go..."
	done

FisherHenryAfterText:
	text "Freshly caught"
	line "#MON taste"
	cont "phenomenal!"
	done

YoungsterAlbertSeenText:
	text "Man I'm starving."
	line "Could use a JELLY-"
	cont "FILLED DONUT right"
	cont "now."
	done

YoungsterAlbertBeatenText:
	text "Or was it a RICE-"
	line "BALL?"
	done

YoungsterAlbertAfterText:
	text "Mmm...DONUTS..."
	done

YoungsterGordonSeenText:
	text "There's some rare"
	line "#MON in the"
	cont "grass here."
	done

YoungsterGordonBeatenText:
	text "But my #MON"
	line "is rare!"
	done

YoungsterGordonAfterText:
	text "TANGELA is still"
	line "a pretty good"
	cont "#MON."
	done

CamperRolandSeenText:
	text "Want that item?"
	line "Gonna have to"
	cont "beat me first."
	done

CamperRolandBeatenText:
	text "Ugh. Take it."
	done

CamperRolandAfterText:
	text "It's not even a"
	line "good item."
	done

PicnickerLiz1SeenText:
	text "CISSY is a WATER-"
	line "TYPE trainer. If"
	cont "can't beat me you"
	cont "are hopeless!"
	done

PicnickerLiz1BeatenText:
	text "Ooh, you've got"
	line "a chance!"
	done

PicnickerLiz1AfterText:
	text "Good luck!"
	done

Bird_keeperPeterSeenText:
	text "Diving for rubies"
	line "to make THONSU."
	
	para "Is new invention"
	line "to add FLUTE of"
	cont "mystical power."
	done

Bird_keeperPeterBeatenText:
	text "Do not said give"
	line "you money."
	done

Bird_keeperPeterAfterText:
	text "I stop now. SUN"
	line "is getting DIRTY."
	done

Text_RoarIntro:
	text "WROOOOAR!"
	line "PEOPLE RUN WHEN I"

	para "ROAR! BUT YOU"
	line "CAME LOOKING!"

	para "THAT PLEASES ME!"
	line "NOW TAKE THIS!"
	done

Text_RoarOutro:
	text "WROOOAR!"
	line "IT'S ROAR!"

	para "EVEN #MON RUN"
	line "FROM A GOOD ROAR!"
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
	person_event SPRITE_FISHER, 41, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherJustin, -1
	person_event SPRITE_FISHER, 14, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherRalph, -1
	person_event SPRITE_FISHER, 37, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherHenry, -1
	person_event SPRITE_SWIMMER_GUY, 27, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterAlbert, -1
	person_event SPRITE_YOUNGSTER, 53, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterGordon, -1
	person_event SPRITE_YOUNGSTER, 16, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperRoland, -1
	person_event SPRITE_SWIMMER_GIRL, 30, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerPicnickerLiz, -1
	person_event SPRITE_SWIMMER_GUY, 43, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerBird_keeperPeter, -1
	person_event SPRITE_POKE_BALL, 54, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52GreatBall, EVENT_ROUTE_52_GREAT_BALL
	person_event SPRITE_POKE_BALL, 14, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52Repel, EVENT_ROUTE_52_REPEL
