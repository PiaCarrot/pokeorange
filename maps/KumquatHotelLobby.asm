const_value = 1
	const KUMQUAT_LOBBY_RECEPTIONIST
	const KUMQUAT_LOBBY_GYM_GUY
	const KUMQUAT_LOBBY_LUANA

KumquatHotelLobby_MapScriptHeader::

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	priorityjump .KumquatHotelLobbyLuanaScript
	end

.Trigger1:
	end
	
.KumquatHotelLobbyLuanaScript:
	applymovement PLAYER, KumquatHotelPlayerLuanaMovement1
	spriteface KUMQUAT_LOBBY_LUANA, DOWN
	showemote EMOTE_SHOCK, KUMQUAT_LOBBY_LUANA, 15
	pause 10
	opentext
	writetext KumquatHotelLobbyLuanaText1
	waitbutton
	closetext
	showemote EMOTE_QUESTION, PLAYER, 15
	opentext
	writetext KumquatHotelLobbyLuanaText2
	waitbutton
	closetext
	applymovement KUMQUAT_LOBBY_LUANA, KumquatHotelLobbyLuanaMovement2
	playsound SFX_EXIT_BUILDING
	disappear KUMQUAT_LOBBY_LUANA
	dotrigger $1
	waitsfx
	end

KumquatHotelLobbyLuanaText1:
	text "My baby!"
	done

KumquatHotelLobbyLuanaText2:
	text "Oh, you're finally"
	line "home! Mommy missed"
	cont "you so so-"
	
	para "Oh my goodness!"
	line "I'm so sorry, you"
	cont "look just like my"
	cont "kid!"
	
	para "I'm LUANA of the"
	line "ORANGE CREW, and"
	cont "this is my GYM!"
	
	para "If you're here to"
	line "challenge me, you"
	cont "have to beat my"
	cont "trainers to reach"
	
	para "the top floor!"
	line "Well then, good"
	cont "luck, ahaha!"
	done
	
	
KumquatHotelReceptionistScript:
	jumptextfaceplayer KumquatHotelReceptionistText
	
KumquatHotelReceptionistText:
	text "Welcome to the"
	line "KUMQUAT GYM!"
	
	para "It also doubles as"
	line "a luxury hotel, so"
	cont "enjoy your stay!"
	done

KumquatGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUANA
	iftrue .KumquatGymGuyWinScript
	writetext KumquatGymGuyText
	waitbutton
	closetext
	end

.KumquatGymGuyWinScript:
	writetext KumquatGymGuyWinText
	waitbutton
	closetext
	end
	
KumquatGymGuyText:
	text "Yo, champ in the"
	line "making!"
	
	para "LUANA uses no set"
	line "typing, so make"
	cont "sure all your"
	cont "bases are covered!"
	
	para "Her ALAKAZAM and"
	line "MAROWAK combo is"
	cont "powerful!"
	done
	
KumquatGymGuyWinText:
	text "Yo, champ in the"
	line "making!"
	
	para "You're the real"
	line "deal! Good luck"
	cont "with the fight"
	cont "on PUMMELO ISLAND."
	done
	
KumquatHotelPlayerLuanaMovement1:
	step UP
	step UP
	step UP
	step_end
	
KumquatHotelLobbyLuanaMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

KumquatHotelLobby_MapEventHeader::

.Warps: db 4
	warp_def 9, 5, 1, KUMQUAT_ISLAND_EAST
	warp_def 9, 6, 1, KUMQUAT_ISLAND_EAST
	warp_def 0, 1, 1, KUMQUAT_HOTEL_POOL
	warp_def 0, 11, 1, KUMQUAT_HOTEL_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_RECEPTIONIST,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatHotelReceptionistScript, -1
	person_event SPRITE_GYM_GUY,  1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatGymGuyScript, -1
	person_event SPRITE_LUANA,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LUANA_HOTEL_LOBBY
