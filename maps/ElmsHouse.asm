const_value set 2
	const TRIPLET_1
	const TRIPLET_2

ElmsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Faith:
	faceplayer
	opentext
	writetext FaithText
	yesorno
	iftrue .ChangeTime
	closetext
	end
.ChangeTime:
	special ClockResetter
	reloadmap
	closetext
	end

Charity:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .BattlePrompt
	writetext CharityHiText
	waitbutton
	closetext
	end
	
.BattlePrompt:
	writetext CharityText
	yesorno
	iftrue .Battle
	closetext
	end
	
.Battle:
	winlosstext CharityWinLoss, 0
	loadtrainer SCIENTIST, 1
	startbattle
	reloadmapafterbattle
	end
	
ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

FaithText:
	text "FAITH: Best of"
	line "luck on your adv-"
	cont "enture, <PLAYER>!"
	
	para "If you'd like, I"
	line "can change the"
	cont "date and time"
	cont "for you."
	done
	
CharityHiText:
	text "CHARITY: Hi,"
	line "<PLAYER>!"
	done
	
CharityText:
	text "CHARITY: Hey,"
	line "<PLAYER>! Want"
	cont "to have a battle?"
	cont "For practice!"
	done
	
CharityWinLoss:
	text "Good battle!"
	done

ElmsHousePCText:
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done

ElmsHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 4, NEW_BARK_TOWN
	warp_def 7, 3, 4, NEW_BARK_TOWN

.CoordEvents: db 0

.BGEvents: db 3
	signpost 0, 5, SIGNPOST_READ, ElmsHousePC
	signpost 1, 2, SIGNPOST_READ, ElmsHouseBookshelf
	signpost 1, 3, SIGNPOST_READ, ElmsHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_COOLTRAINER_F, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Charity, -1
	person_event SPRITE_COOLTRAINER_F, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Faith, -1

