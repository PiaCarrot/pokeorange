const_value = 1
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
	const ROUTE52_THUNDERPUNCH_TUTOR

Route52_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

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

TrainerYoungsterKouta:
	trainer EVENT_BEAT_YOUNGSTER_KOUTA, YOUNGSTER, KOUTA, YoungsterKoutaSeenText, YoungsterKoutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterKoutaAfterText
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
	text "Or was it a RICE"
	line "BALL?"
	done

SwimmermTheoAfterText:
	text "Mmm<...> DONUTS<...>"
	done

YoungsterKoutaSeenText:
	text "There's some rare"
	line "#MON in the"
	cont "grass here."
	done

YoungsterKoutaBeatenText:
	text "But my #MON"
	line "is rare!"
	done

YoungsterKoutaAfterText:
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
	line "type trainer. If"
	cont "you can't beat me,"
	cont "you're hopeless!"
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
	
Route52ThunderpunchTutor:
	faceplayer
	opentext
	writetext GivePlayerThunderpunchText
	yesorno
	iffalse .TutorRefused
	writebyte THUNDERPUNCH
	writetext Text_ThunderpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_ThunderpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_ThunderpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerThunderpunchText:
	text "Getting tired of"
	line "the water already?"
	
	para "Ha. You've come to"
	line "the right place."
	cont "Want me to teach"
	cont "your #MON"
	
	para "THUNDERPUNCH?"
	done
	
Text_ThunderpunchTutorTaught:
	text "THUNDERPUNCH is"
	line "an ELECTRIC attack"
	cont "that can sometimes"
	cont "cause paralysis!"
	done
	
Text_ThunderpunchTutorRefused:
	text "Take the high road"
	line "why don'cha?"
	done
	
Text_ThunderpunchTutorClear:
	text ""
	done

Route52_MapEventHeader::

.Warps: db 3
	warp_def 69, 13, 1, ROUTE_52_POKECENTER_1F
	warp_def 75, 7, 1, ROUTE_52_TANGELO_JUNGLE_GATE
	warp_def 75, 8, 2, ROUTE_52_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 72, 8, SIGNPOST_READ, Route52Sign
	signpost 73, 4, SIGNPOST_ITEM, Route52HiddenGreatBall
	signpost 41, 16, SIGNPOST_ITEM, Route52HiddenSuperPotion

.ObjectEvents: db 11
	person_event SPRITE_FISHER, 33, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherSojiro, -1
	person_event SPRITE_FISHER, 22, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherFugu, -1
	person_event SPRITE_FISHER, 29, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherNobu, -1
	person_event SPRITE_SWIMMER_GUY, 8, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermTheo, -1
	person_event SPRITE_YOUNGSTER, 48, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerYoungsterKouta, -1
	person_event SPRITE_YOUNGSTER, 8, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerCamperSamm, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfYuka, -1
	person_event SPRITE_SWIMMER_GUY, 35, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmermAtecain, -1
	person_event SPRITE_POKE_BALL, 6, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52GreatBall, EVENT_ROUTE_52_GREAT_BALL
	person_event SPRITE_POKE_BALL, 50, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route52Repel, EVENT_ROUTE_52_REPEL
	person_event SPRITE_BLACK_BELT, 62, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route52ThunderpunchTutor, -1
