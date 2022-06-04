const_value = 1
	const ROUTE_55_SWIMMER_GIRL
	const ROUTE_55_SWIMMER_GUY
	const ROUTE_55_RUNNER
	const ROUTE_55_ITEMBALL
	const ROUTE_55_SEASHELL

Route55_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_55_UNDERWATER, 0, 0
	return

TrainerSwimmerMayumi:
	trainer EVENT_BEAT_SWIMMERF_MAYUMI, SWIMMERF, MAYUMI, SwimmerMayumiSeenText, SwimmerMayumiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerMayumiAfterText
	waitbutton
	closetext
	end

SwimmerMayumiSeenText:
	text "Hello there!"

	para "Perhaps you would"
	line "like to battle?"
	done

SwimmerMayumiBeatenText:
	text "Ayaa! I didn't"
	line "think I'd lose!"
	done

SwimmerMayumiAfterText:
	text "Thanks for the"
	line "great battle!"
	done

TrainerSwimmerKosuke:
	trainer EVENT_BEAT_SWIMMERM_KOSUKE, SWIMMERM, KOSUKE, SwimmerKosukeSeenText, SwimmerKosukeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerKosukeAfterText
	waitbutton
	closetext
	end

SwimmerKosukeSeenText:
	text "I saw a PINK"
	line "MANKEY on the"
	cont "island near by!"
	done

SwimmerKosukeBeatenText:
	text "I swear it's the"
	line "truth!"
	done

SwimmerKosukeAfterText:
	text "I wonder if my"
	line "#MON could"
	cont "become PINK?"
	done

TrainerAthleteHideki:
	trainer EVENT_BEAT_ATHLETE_HIDEKI, ATHLETE, HIDEKI, AthleteHidekiSeenText, AthleteHidekiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteHidekiAfterText
	waitbutton
	closetext
	end

AthleteHidekiSeenText:
	text "Jogging on this"
	line "island made my"
	cont "#MON strong!"
	done

AthleteHidekiBeatenText:
	text "Looks like I"
	line "have more run-"
	cont "ning to do!"
	done

AthleteHidekiAfterText:
	text "To win a marathon,"
	line "you have to train"
	cont "super hard!"
	done

Route55MaxRevive:
	itemball MAX_REVIVE

Route55Sign:
	jumptext Route55SignText

RangiSign:
	jumptext RangiSignText

Route55PotHiddenItem:
	dwb EVENT_ROUTE_55_HIDDEN_SOFT_SAND, SOFT_SAND

.Text:

Route55SignText:
	text "ROUTE 55"
	line "TO KINNOW ISLAND"
	done

RangiSignText:
	text "RANGI ISLAND"

	para "GITHUB lies here."
	done
	
Route55SeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute55Seashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_55_SEASHELL
	disappear ROUTE_55_SEASHELL
	end
	
.NoShellBox:
	writetext Route55NoShellBox
	waitbutton
	closetext
	end
	
Route55NoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundRoute55Seashell:
	text "You found a rare"
	line "seashell!"
	done

Route55_MapEventHeader::

.Warps: db 2
	warp_def 5, 12, 3, CRYSTAL_CAVE_1F
	warp_def 41, 13, 1, ROUTE_55_QUEST_HOUSE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 10, 16, SIGNPOST_READ, Route55Sign
	signpost 22, 34, SIGNPOST_READ, RangiSign
	signpost 42, 10, SIGNPOST_ITEM, Route55PotHiddenItem

.ObjectEvents: db 5
	person_event SPRITE_SWIMMER_GIRL, 19, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSwimmerMayumi, -1
	person_event SPRITE_SWIMMER_GUY, 31, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerKosuke, -1
	person_event SPRITE_COOLTRAINER_M, 40, 37, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerAthleteHideki, -1
	person_event SPRITE_POKE_BALL, 39, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route55MaxRevive, EVENT_ROUTE_55_MAX_REVIVE
	person_event SPRITE_SEASHELL, 23, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route55SeashellScript, EVENT_ROUTE_55_SEASHELL
