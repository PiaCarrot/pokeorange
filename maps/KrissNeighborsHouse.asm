const_value = 1
	const KRISSNEIGHBORSHOUSE_COOLTRAINER_F
	const KRISSNEIGHBORSHOUSE_POKEDEX

KrissNeighborsHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KrissNeighborsDaughter:
	faceplayer
	opentext
	checkevent EVENT_TOWN_MAP_OBTAINED
	iftrue .After
	writetext KrissNeighborsDaughterText
	buttonsound
	verbosegiveitem TOWN_MAP
	iffalse .Done
	disappear KRISSNEIGHBORSHOUSE_POKEDEX
.Done
	closetext
	end

.After:
	writetext KrissNeighborsDaughterAfterText
	waitbutton
	closetext
	end

KrissNeighborsTownMap:
	jumptext KrissNeighborsTownMapText

KrissNeighborsHouseBookshelf:
	jumpstd magazinebookshelf

KrissNeighborsHouseRadio:
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext KrisNeighborRadioText1
	pause 45
	writetext KrisNeighborRadioText2
	pause 45
	writetext KrisNeighborRadioText3
	pause 45
	musicfadeout MUSIC_CINNABAR, 16
	writetext KrisNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.AbbreviatedRadio:
	opentext
	writetext KrisNeighborRadioText4
	pause 45
	closetext
	end

KrissNeighborsDaughterText:
	text "Oh, <PLAYER>!"
	line "Nice of you to"
	cont "drop by!"

	para "I have something"
	line "for you so you"
	cont "won't get lost!"
	done

KrissNeighborsDaughterAfterText:
	text "Have a safe trip,"
	line "<PLAYER>!"
	done

KrisNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisNeighborRadioText2:
	text "#MON CHANNEL!"
	done

KrisNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL<...>"
	done

KrissNeighborsTownMapText:
	text "It's a map of the"
	line "ORANGE ISLANDS."
	done

KrissNeighborsHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $2, 3, VALENCIA_ISLAND
	warp_def $7, $3, 3, VALENCIA_ISLAND

.XYTriggers: db 0

.Signposts: db 3
	signpost 1, 0, SIGNPOST_READ, KrissNeighborsHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, KrissNeighborsHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, KrissNeighborsHouseRadio

.PersonEvents: db 2
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KrissNeighborsDaughter, -1
	person_event SPRITE_POKEDEX, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KrissNeighborsTownMap, EVENT_TOWN_MAP_OBTAINED
