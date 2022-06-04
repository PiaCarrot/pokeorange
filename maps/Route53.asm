const_value = 1
	const ROUTE53_POKEFAN_M
	const ROUTE53_LASS
	const ROUTE53_FRUIT_TREE
	const ROUTE53_SWIMMER1
	const ROUTE53_SWIMMER2

Route53_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route53LassScript:
	jumptextfaceplayer Route53LassText

TrainerFisherNatPagle:
	trainer EVENT_BEAT_FISHER_NAT_PAGLE, FISHER, NAT_PAGLE, FisherNatPagleSeenText, FisherNatPagleBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherNatPagleAfterText
	waitbutton
	closetext
	end

TrainerSwimmermKojuro:
	trainer EVENT_BEAT_SWIMMERM_KOJURO, SWIMMERM, KOJURO, SwimmermKojuroSeenText, SwimmermKojuroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermKojuroAfterText
	waitbutton
	closetext
	end

TrainerSwimmermYouta:
	trainer EVENT_BEAT_SWIMMERM_YOUTA, SWIMMERM, YOUTA, SwimmermYoutaSeenText, SwimmermYoutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermYoutaAfterText
	waitbutton
	closetext
	end

Route53Sign:
	jumptext Route53SignText

Route53Tips:
	jumptext Route53TrainerTipsText

Route53FruitTreeScript:
	fruittree FRUITTREE_ROUTE_53

FisherNatPagleSeenText:
	text "If you ask me,"
	line "the best part"
	cont "about fishing is"
	cont "its slow pace."

	para "It gives one time"
	line "to think, to ref-"
	cont "lect on past"
	cont "events and to plan"
	cont "for future ones."
	done

FisherNatPagleBeatenText:
	text "I'm like some kind"
	line "of fishing god<...>"
	done

FisherNatPagleAfterText:
	text "Now, I'm not say-"
	line "ing you need to"
	cont "fish for 30 years"
	cont "or catch every"

	para "fish in the sea"
	line "to become a mas-"
	cont "ter fisherman."

	para "I reckon you just"
	line "need to be deter-"
	cont "mined--enough to"
	cont "sit on your duff"
	cont "for hours at a"
	cont "time."
	done

SwimmermKojuroSeenText:
	text "You beat CISSY?"
	line "Let's see what"
	cont "you're made of!"
	done

SwimmermKojuroBeatenText:
	text "Fried like a"
	line "fish!"
	done

SwimmermKojuroAfterText:
	text "You're hot stuff,"
	line "kid!"
	done

SwimmermYoutaSeenText:
	text "Some kid riding a"
	line "MARILL came by!"

	para "He beat me, so I"
	line "am gonna take out"
	cont "my anger on you!"
	done

SwimmermYoutaBeatenText:
	text "Yaaaah! I'm mad!"
	done

SwimmermYoutaAfterText:
	text "Two brats in a"
	line "single day! Yah!"
	done

Route53LassText:
	text "Hey."

	para "Once you hit the"
	line "end of this route,"
	cont "there are two"
	cont "paths."

	para "North goes to"
	line "MANDARIN NORTH,"
	cont "and south goes to"
	cont "SUNBURST ISLAND."
	done

Route53SignText:
	text "ROUTE 53"
	done

Route53TrainerTipsText:
	text "TRAINER TIPS"

	para "Be wary of shady"
	line "thugs! They may"

	para "try to steal your"
	line "#MON!"
	done

Route53_MapEventHeader::

.Warps: db 2
	warp_def 8, 4, 3, MIKAN_ISLAND_ROUTE_53_GATE
	warp_def 9, 4, 4, MIKAN_ISLAND_ROUTE_53_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 10, 8, SIGNPOST_READ, Route53Sign
	signpost 9, 41, SIGNPOST_READ, Route53Tips

.ObjectEvents: db 5
	person_event SPRITE_FISHER, 11, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherNatPagle, -1
	person_event SPRITE_LASS, 6, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route53LassScript, -1
	person_event SPRITE_FRUIT_TREE, 5, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route53FruitTreeScript, -1
	person_event SPRITE_SWIMMER_GUY, 10, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermKojuro, -1
	person_event SPRITE_SWIMMER_GUY, 9, 50, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermYouta, -1
