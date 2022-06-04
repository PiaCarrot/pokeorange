const_value = 1
	const KUMQUAT_HOUSE_4_POKEFAN_F

KumquatHouse4_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_KUMQUAT_STARTER
	iftrue .AlreadyReceivedKumquatPokefanFGift
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftrue .ObtainKumquatCharmanderScript
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .ObtainKumquatBulbasaurScript	
	writetext KumquatSquirtleText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 15, BLACKGLASSES
	special SpecialSquirtle
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.ObtainKumquatBulbasaurScript:
	writetext KumquatBulbasaurText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 15
	special SpecialBulbasaur
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.ObtainKumquatCharmanderScript:
	writetext KumquatCharmanderText
	yesorno
	iffalse .DeclinedFreeKumquatPokemon
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext PlayerReceivedKumquatCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 15
	special SpecialCharmander
	setevent EVENT_RECEIVED_KUMQUAT_STARTER
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.AlreadyReceivedKumquatPokefanFGift:
	writetext AlreadyReceivedKumquatPokefanFGiftText
	waitbutton
	closetext
	end
	
.DeclinedFreeKumquatPokemon:
	writetext DeclinedFreeKumquatPokemonText
	waitbutton
	closetext
	end
	
.PartyFull:
	writetext KumquatPartyFullText
	waitbutton
	closetext
	end
	
KumquatPartyFullText:
	text "Your #MON"
	line "party is full."
	done
	
KumquatBulbasaurText:
	text "I can tell from"
	line "your clothes<...>"
	cont "You're from"
	cont "VALENCIA ISLAND!"
	
	para "You've come a long"
	line "way!"
	
	para "Let's see<...>"
	
	para "I bet you started"
	line "with the #MON"
	cont "SQUIRTLE!"
	
	para "How would you like"
	line "a BULBASAUR?"
	done
	
KumquatSquirtleText:
	text "I can tell from"
	line "your clothes<...>"
	cont "You're from"
	cont "VALENCIA ISLAND!"
	
	para "You've come a long"
	line "way!"
	
	para "Let's see<...>"
	
	para "I bet you started"
	line "with the #MON"
	cont "CHARMANDER!"
	
	para "How would you like"
	line "a SQUIRTLE?"
	done
	
KumquatCharmanderText:
	text "I can tell from"
	line "your clothes<...>"
	cont "You're from"
	cont "VALENCIA ISLAND!"
	
	para "You've come a long"
	line "way!"
	
	para "Let's see<...>"
	
	para "I bet you started"
	line "with the #MON"
	cont "BULBASAUR!"
	
	para "How would you like"
	line "a CHARMANDER?"
	done
	
DeclinedFreeKumquatPokemonText:
	text "Oh<...>Ok<...>"
	done

AlreadyReceivedKumquatPokefanFGiftText:
	text "Good luck!"
	done
	
PlayerReceivedKumquatBulbasaurText:
	text "<PLAYER> received"
	line "BULBASAUR!"
	done
	
PlayerReceivedKumquatCharmanderText:
	text "<PLAYER> received"
	line "CHARMANDER!"
	done

PlayerReceivedKumquatSquirtleText:
	text "<PLAYER> received"
	line "SQUIRTLE!"
	done

KumquatHouse4_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, KUMQUAT_ISLAND_WEST
	warp_def 7, 3, 3, KUMQUAT_ISLAND_WEST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatPokefanFScript, -1