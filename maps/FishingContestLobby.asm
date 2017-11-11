const_value set 1

FishingContestLobby_MapScriptHeader::

.Triggers: db 3
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	
.Callbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .CheckIfContestRunning

.Trigger2:
	priorityjump .LeftTheContestEarly
.Trigger0:
.Trigger1:
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	dotrigger $0
	return

.BugContestIsRunning:
	dotrigger $2
	return

.LeftTheContestEarly:
	special FadeOutPalettes
	warpfacing DOWN, FISHING_CONTEST_LOBBY, 2, 6
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext FishingContestStillHaveTimeText
	yesorno
	iffalse .GoBackToContest
	writetext FishingContestDecidedToQuitText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	warpfacing DOWN, FISHING_CONTEST_LOBBY, 2, 6
	pause 15
	special Special_FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext FishingContestDecideNotToQuitText
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing RIGHT, FISHING_CONTEST, 10, 0
	end
	
;============================================================

FishingContestEntry:
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext FishingContestEntryText
	yesorno
	iffalse .Declined
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, .LeaveMonsWithReferee
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	writetext FishingContestExplanationText
	buttonsound
	waitsfx
	writetext FishingContestHereAreBallsText
	playsound SFX_ITEM
	waitsfx
	writetext FishingContestBallObtainedText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special Special_GiveParkBalls
	spriteface PLAYER, RIGHT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing RIGHT, FISHING_CONTEST, 10, 0
	end
	
.LeaveMonsWithReferee:
	checkcode VAR_PARTYCOUNT
	if_less_than $6, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	if_equal $0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	if_equal $1, .FirstMonIsEgg
	writetext FishingContestTooManyPokemonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext FishingContestWillHoldPokemonText
	buttonsound
	writetext FishingContestPokemonWereLeftText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest
	
.RefusedToLeaveMons:
	writetext FishingContestPleaseChoosePokemonText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext FishingContestFirstPokemonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext FishingContestPartyPCFullText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext FishingContestEggPartyText
	waitbutton
	closetext
	end
	
.Declined:
	writetext FishingContestDeclinedText
	waitbutton
	closetext
	warpfacing LEFT, UNNAMED_ISLAND_2, 10, 29
	end
	
Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .SuperRod
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext FishingContestOverText
	waitbutton
	closetext
	end

.SuperRod:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .TradeStone
	writetext FishingContestHeldOntoPrizeText
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	setevent EVENT_GOT_SUPER_ROD
	closetext
	end
	
.TradeStone:
	writetext FishingContestHeldOntoPrizeText
	buttonsound
	verbosegiveitem TRADE_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext FishingContestHeldOntoPrizeText
	buttonsound
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext FishingContestHeldOntoPrizeText
	buttonsound
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext FishingContestHeldOntoPrizeText
	buttonsound
	verbosegiveitem POTION
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext FishingContestPackFullText
	waitbutton
	closetext
	end
	
FishingContestFirstPokemonCantBattleText:
	text "Uh-oh<...>"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
	
FishingContestPartyPCFullText:
	text "Uh-oh<...>"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the WATER"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

FishingContestEggPartyText:
	text "Uh-oh<...>"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
	
FishingContestDeclinedText:
	text "OK. Seeya around."
	done

FishingContestEntryText:
	text "Hey, kid!"

	para "Fishing Con-"
	line "test entry's open."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "WATER #MON to"
	line "be judged."

	para "Would you like to"
	line "give it a try?"
	done

FishingContestHereAreBallsText:
	text "Here are CONTEST"
	line "BALLS for the"
	cont "Contest."
	done

FishingContestBallObtainedText:
	text "<PLAYER> received"
	line "20 CONTEST BALLS."
	done

FishingContestExplanationText:
	text "The person who"
	line "gets the best"
	cont "WATER #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "CONTEST BALLS,"
	cont "you're done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the best WATER"

	para "#MON you can"
	line "find!"
	done

FishingContestTooManyPokemonText:
	text "Uh-oh<...>"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram StringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

FishingContestWillHoldPokemonText:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

FishingContestPokemonWereLeftText:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

FishingContestPleaseChoosePokemonText:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

FishingContestStillHaveTimeText:
	text "You still have @"
	text_from_ram StringBuffer3
	text ""
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

FishingContestDecidedToQuitText:
	text "OK. Please wait"
	line "here for the"

	para "announcement of"
	line "the winners."
	done

FishingContestDecideNotToQuitText:
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done

FishingContestOverText:
	text "Today's Contest is"
	line "over. Seeya."
	done

FishingContestPackFullText:
	text "Uh-oh<...> Your PACK"
	line "is full."

	para "I'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done

FishingContestHeldOntoPrizeText:
	text "<PLAYER>?"

	para "Here's the prize"
	line "I was holding"
	cont "for you."
	done
	
FishingContestLobby_MapEventHeader::

.Warps: db 4
	warp_def 2, 0, 1, UNNAMED_ISLAND_2
	warp_def 3, 0, 2, UNNAMED_ISLAND_2
	warp_def 2, 11, 1, FISHING_CONTEST
	warp_def 3, 11, 2, FISHING_CONTEST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_FISHING_GURU, 4, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FishingContestEntry, -1

