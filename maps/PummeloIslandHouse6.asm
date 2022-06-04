const_value = 1
	const DRAKES_HOUSE_POKEBALL

PummeloIslandHouse6_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloIslandDrakeGift:
	opentext
	writetext DrakeGiftText1
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 30, GOLD_BERRY, SHINY_MASK
	special SpecialDratini
	setevent EVENT_PUMMELO_ISLAND_DRAKE_GIFT
	disappear DRAKES_HOUSE_POKEBALL
	closetext
	end

.PartyFull:
	writetext DrakeGiftPartyFullText
	waitbutton
	closetext
	end
	
DrakeGiftPartyFullText:
	text "Your party is"
	line "full!"
	done
	
DrakeGiftText1:
	text "There's a note."
	
	para "DRAKE: <PLAYER>."
	line "I'm going to KANTO"
	cont "to train."
	
	para "Next time we meet,"
	line "I'll be ready to"
	cont "take back my"
	cont "place as CHAMPION!"
	
	para "I met your friend,"
	line "TRACEY, as well."
	cont "I know you have"
	cont "business in KANTO"
	
	para "anyway. I also"
	line "have a gift for"
	cont "you. Take this"
	cont "#MON, and show"
	
	para "that you're not"
	line "just a CHAMPION,"
	cont "you're THE CHAMP!"
	done

PummeloIslandHouse6_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 10, PUMMELO_ISLAND
	warp_def $7, $4, 10, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_POKE_BALL,  3,  3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandDrakeGift, EVENT_PUMMELO_ISLAND_DRAKE_GIFT
