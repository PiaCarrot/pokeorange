const_value = 1
	const PROF_QUACKENPOKER_RIND
	const KARP_SALESMAN_RIND

QuackenpokerLab_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ProfQuackenpokercript:
	faceplayer
	opentext
	checkitem SUPER_ROD
	iftrue .AlreadyGotSuperRod
	writetext WantASuperRodText
	verbosegiveitem SUPER_ROD
	writetext SuperRodHappyFishingText
	waitbutton
	closetext
	end

.AlreadyGotSuperRod:
	writetext AlreadyGotSuperRodText
	waitbutton
	closetext
	end

WantASuperRodText:
	text "Ah, you must be"
	line "<PLAYER>!"
	
	para "PROF. IVY told me"
	line "you'd drop by."
	
	para "The name's"
	line "QUACKENPOKER."
	
	para "I'm a researcher"
	line "of MAGIKARP. Did"
	cont "you know they come"
	cont "here to RIND"
	
	para "ISLAND during"
	line "breeding season?"
	
	para "They also have"
	line "striking markings!"

	para "Ehem<...>"
	line "Anyway, this is"
	cont "for you."
	done

AlreadyGotSuperRodText:
	text "How goes the fish-"
	line "ing, <PLAYER>?"
	done

SuperRodHappyFishingText:
	text "If you would be"
	line "so kind, you can"
	cont "start off by cat-"
	cont "ching some KARP!"
	done

KarpSalesmanScript:
	faceplayer
	opentext
	checkevent EVENT_BOUGHT_SHINY_MAGIKARP
	iftrue .AlreadyBoughtMagikarp
	writetext KarpSalesmanText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusedKarpSalesman
	checkmoney $0, 200000
	if_equal $2, .NotEnoughMoney
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	givepoke MAGIKARP, 15, NUGGET, SHINY_MASK
	special SpecialMagikarp
	setevent EVENT_BOUGHT_SHINY_MAGIKARP
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 200000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessKarpSalesmanText
	waitbutton
	closetext
	end
	
.NotEnoughMoney:
	writetext NotEnoughMoneyKarpSalesmanText
	waitbutton
	closetext
	end

.PartyFull:
	writetext KarpSalesmanPartyFullText
	waitbutton
	closetext
	end

.RefusedKarpSalesman:
	writetext RefusedKarpSalesmanText
	waitbutton
	closetext
	end
	
.AlreadyBoughtMagikarp:
	writetext AlreadyBoughtMagikarpText
	waitbutton
	closetext
	end

KarpSalesmanText1:
	text "Hey, kid!"
	
	para "I got a golden"
	line "MAGIKARP for sale!"
	cont "How does ¥200000"
	cont "sound?"
	done
	
NotEnoughMoneyKarpSalesmanText:
	text "You ain't got the"
	line "cash!"
	done
	
PleasureDoingBusinessKarpSalesmanText:
	text "Pleasure doin'"
	line "business with ya!"
	done
	
KarpSalesmanPartyFullText:
	text "You're going to"
	line "need to make more"
	cont "room."
	done

RefusedKarpSalesmanText:
	text "No problemo, old"
	line "QUACKENPOKER would"
	cont "not buy it either."
	done
	
AlreadyBoughtMagikarpText:
	text "Sorry, no refunds."
	done

QuackenpokerLabHealingMachine:
	opentext
	writetext QuackenpokerLabHealingMachineText2
	yesorno
	iftrue QuackenpokerLabHealingMachine_HealParty
	closetext
	end

QuackenpokerLabHealingMachine_HealParty:
	special HealParty
	playmusic MUSIC_NONE
	writebyte 1 ; Machine is in Ivy's Lab
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

QuackenpokerLabTrashcan:
	dwb EVENT_RIND_ISLAND_HIDDEN_LEFTOVERS, LEFTOVERS

QuackenPokerLabBookshelf:
	jumpstd difficultbookshelf

QuackenpokerLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

QuackenpokerLab_MapEventHeader::

.Warps: db 2
	warp_def 11, 4, 1, RIND_ISLAND
	warp_def 11, 5, 1, RIND_ISLAND

.CoordEvents: db 0

.BGEvents: db 14
	signpost 1, 2, SIGNPOST_READ, QuackenpokerLabHealingMachine
	signpost 1, 6, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 1, 7, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 1, 8, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 1, 9, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 0, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 1, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 2, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 3, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 6, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 7, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 8, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 7, 9, SIGNPOST_READ, QuackenPokerLabBookshelf
	signpost 3, 9, SIGNPOST_ITEM, QuackenpokerLabTrashcan

.ObjectEvents: db 2
	person_event SPRITE_GRAMPS, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, PAL_OW_BROWN, ProfQuackenpokercript, -1
	person_event SPRITE_POKEFAN_M, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KarpSalesmanScript, -1