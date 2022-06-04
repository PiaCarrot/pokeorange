const_value = 1
	const IVYSHOUSE_TRIPLET_1
	const IVYSHOUSE_TRIPLET_2

IvysHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

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
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue .BattlePrompt
	writetext CharityHiText
	waitbutton
	closetext
	end

.BattlePrompt:
	checkevent EVENT_BEAT_CHARITY
	iftrue .AlreadyBeat
	writetext CharityText
	yesorno
	iftrue .Battle
	closetext
	end

.Battle:
	winlosstext CharityWinLoss, 0
	loadtrainer PROF_AIDE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHARITY
	end
	
.AlreadyBeat:
	writetext CharityHiText
	waitbutton
	closetext
	end

IvysHouseBookshelf:
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

IvysHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, VALENCIA_ISLAND
	warp_def 7, 3, 4, VALENCIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 2, SIGNPOST_READ, IvysHouseBookshelf
	signpost 1, 3, SIGNPOST_READ, IvysHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_SCIENTIST_F, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Charity, -1
	person_event SPRITE_SCIENTIST_F, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Faith, -1
