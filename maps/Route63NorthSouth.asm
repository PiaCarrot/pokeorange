const_value = 1
	const ROUTE_63_NORTH_SOUTH_ITEMBALL_NUGGET
	const ROUTE_63_NORTH_SOUTH_FISHER_YAMATO
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERM_YUUJI
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERF_REIKA
	const ROUTE_63_NORTH_SOUTH_SIGHTSEER_F_ARASHI
	const ROUTE_63_NORTH_SOUTH_SIGHTSEER_M_HYOU
	const ROUTE_63_NORTH_SOUTH_OTAKU_NIRO
	const ROUTE_63_NORTH_SOUTH_OTAKU_GODO
	const ROUTE_63_NORTH_SOUTH_COOLTRAINERM_SEI
	const ROUTE_63_NORTH_SOUTH_ITEMBALL_LEAF_STONE	

Route63NorthSouth_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrainerOtakuNiro:
	trainer EVENT_BEAT_OTAKU_NIRO, OTAKU, NIRO, OtakuNiroSeenText, OtakuNiroBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuNiroAfterText
	waitbutton
	closetext
	end

OtakuNiroSeenText:
	text "Hnyaah! My perfect"
	line "collection of"
	cont "#MON will show"
	cont "you how it's done!"
	done

OtakuNiroBeatenText:
	text "Aah! No!"
	done

OtakuNiroAfterText:
	text "Are you asking if"
	line "I always talk with"
	cont "a nasally voice?"
	cont "How rude!"
	done

TrainerFisherYamato:
	trainer EVENT_BEAT_FISHER_YAMATO, FISHER, YAMATO, FisherYamatoSeenText, FisherYamatoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherYamatoAfterText
	waitbutton
	closetext
	end

FisherYamatoSeenText:
	text "If you beat me, I"
	line "will tell you a"
	cont "good secret."
	done

FisherYamatoBeatenText:
	text "Well done."
	done

FisherYamatoAfterText:
	text "There is an island"
	line "west of here. It's"
	cont "the only place you"
	cont "can find MAGIKARP."
	
	para "Well, around this"
	line "time of year, at"
	cont "least."
	done

TrainerOtakuGodo:
	trainer EVENT_BEAT_OTAKU_GODO, OTAKU, GODO, OtakuGodoSeenText, OtakuGodoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuGodoAfterText
	waitbutton
	closetext
	end

OtakuGodoSeenText:
	text "If I win, you have"
	line "to check out my"
	cont "KATANA collection!"
	done

OtakuGodoBeatenText:
	text "Wayaaah!"
	done

OtakuGodoAfterText:
	text "My KATANA can cut"
	line "through hard steel"
	cont "because it's been"
	cont "folded 1000 times."
	done

TrainerCooltrainerFReika:
	trainer EVENT_BEAT_COOLTRAINERF_REIKA, COOLTRAINERF, REIKA, CooltrainerFReikaSeenText, CooltrainerFReikaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFReikaAfterText
	waitbutton
	closetext
	end

CooltrainerFReikaSeenText:
	text "I train every day"
	line "for the best re-"
	cont "sults!"
	done

CooltrainerFReikaBeatenText:
	text "Wow, you must be"
	line "training a lot!"
	done

CooltrainerFReikaAfterText:
	text "Your #MON need"
	line "to be in tip-top"
	cont "shape to succeed!"
	done
	
TrainerCooltrainerMYuuji:
	trainer EVENT_BEAT_COOLTRAINERM_YUUJI, COOLTRAINERM, YUUJI, CooltrainerMYuujiSeenText, CooltrainerMYuujiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMYuujiAfterText
	waitbutton
	closetext
	end

CooltrainerMYuujiSeenText:
	text "Our leader made"
	line "this group so we"
	cont "could train for"
	cont "the ORANGE CREW!"
	done

CooltrainerMYuujiBeatenText:
	text "How many badges"
	line "could you have?"
	done

CooltrainerMYuujiAfterText:
	text "I'll let you know."
	line "LUANA is a really"
	cont "strong ORANGE CREW"
	cont "member!"
	done

TrainerSightseerFArashi:
	trainer EVENT_BEAT_SIGHTSEERF_ARASHI, SIGHTSEERF, ARASHI, SightseerFArashiSeenText, SightseerFArashiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerFArashiAfterText
	waitbutton
	closetext
	end

SightseerFArashiSeenText:
	text "Ohohoho!"
	
	para "My darlings will"
	line "beat you in an"
	cont "instant!"
	done

SightseerFArashiBeatenText:
	text "Kyaa!"
	done

SightseerFArashiAfterText:
	text "You beat up my"
	line "little darlings!"
	done

TrainerSightseerMHyou:
	trainer EVENT_BEAT_SIGHTSEERM_HYOU, SIGHTSEERM, HYOU, SightseerMHyouSeenText, SightseerMHyouBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerMHyouAfterText
	waitbutton
	closetext
	end

SightseerMHyouSeenText:
	text "Back where I'm"
	line "from, most of the"
	cont "#MON here can't"
	cont "be found!"
	done

SightseerMHyouBeatenText:
	text "Those are some"
	line "neat #MON!"
	done

SightseerMHyouAfterText:
	text "At my home in the"
	line "SINNOH region,"
	cont "it's really cold!"
	done

Route63GauntletSign:
	jumptext Route63GauntletSignText
	
Route63GauntletSignText:
	text "ASCORBIA TRAINER"
	line "CREW"
	
	para "Test your might"
	line "for a grand prize!"
	done
	
Route63NorthSouthNugget:
	itemball NUGGET
	
Route63NorthSouthLeafStone:
	itemball LEAF_STONE
	
Route63GauntletEventScript:
	spriteface PLAYER, RIGHT
	opentext
	writetext CompletedGauntletText1
	waitbutton
	verbosegiveitem TM_WHIRLPOOL
	closetext
	domaptrigger ROUTE_63_NORTH_SOUTH, $1
	end
	
CompletedGauntletText1:
	text "Wow, great job!"
	
	para "You beat all of"
	line "the trainers!"
	cont "Here's your grand"
	cont "prize!"
	done
	
CooltrainerRoute63Script:
	jumptextfaceplayer CooltrainerRoute63ScriptText
	
CooltrainerRoute63ScriptText:
	text "You sure are a"
	line "tough kid!"
	done

Route63NorthSouth_MapEventHeader::

.Warps: db 1
	warp_def 5, 11, 3, ASCORBIA_ISLAND_ROUTE_63_GATE

.CoordEvents: db 1
	xy_trigger 0, 25, 13, Route63GauntletEventScript

.BGEvents: db 1
	signpost 42, 12, SIGNPOST_READ, Route63GauntletSign

.ObjectEvents: db 10
	person_event SPRITE_POKE_BALL, 25, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63NorthSouthNugget, EVENT_ROUTE_63_NORTH_SOUTH_NUGGET
	person_event SPRITE_FISHER, 17, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerFisherYamato, -1
	person_event SPRITE_COOLTRAINER_M, 36, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerMYuuji, -1
	person_event SPRITE_COOLTRAINER_F, 28, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerCooltrainerFReika, -1
	person_event SPRITE_SIGHTSEER_F, 32, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSightseerFArashi, -1
	person_event SPRITE_COOLTRAINER_M, 36, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerSightseerMHyou, -1
	person_event SPRITE_FISHER, 28, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, TrainerOtakuNiro, -1
	person_event SPRITE_FISHER, 32, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, TrainerOtakuGodo, -1
	person_event SPRITE_COOLTRAINER_M, 25, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerRoute63Script, -1
	person_event SPRITE_POKE_BALL, 60, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route63NorthSouthLeafStone, EVENT_ROUTE_63_NORTH_SOUTH_LEAF_STONE

