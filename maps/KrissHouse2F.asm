const_value = 1

KrissHouse2F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeRoom

.InitializeRoom:
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	jumpstd initializeevents
.SkipInizialization:
	return

KrissHouseRadio:
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext KrisRadioText1
	pause 45
	writetext KrisRadioText2
	pause 45
	writetext KrisRadioText3
	pause 45
	musicfadeout MUSIC_CINNABAR, 16
	writetext KrisRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.AbbreviatedRadio:
	opentext
	writetext KrisRadioText4
	pause 45
	closetext
	end

BigDoll:
	jumptext BigDollText

KrissHouseBookshelf:
	jumpstd picturebookshelf

KrissHousePC:
	opentext
	special Special_KrissHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, $0, $0
	end

KrisRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#MON CHANNEL!"
	done

KrisRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#MON!"
	line "#MON CHANNEL<...>"
	done

BigDollText:
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

KrissHouse2F_MapEventHeader:

.Warps: db 1
	warp_def $0, $7, 3, KRISS_HOUSE_1F

.XYTriggers: db 0

.Signposts: db 2
	signpost 1, 2, SIGNPOST_UP, KrissHousePC
	signpost 1, 5, SIGNPOST_READ, KrissHouseBookshelf

.PersonEvents: db 1
	person_event SPRITE_BIG_LAPRAS, 1, 0, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BigDoll, -1
