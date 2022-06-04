const_value = 1
 const ROUTE_60_GATE_COOLTRAINER_F

Route60GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route60GateCooltrainer:
	faceplayer
	opentext
	writetext Route60GateCooltrainerText
	showemote EMOTE_HEART, ROUTE_60_GATE_COOLTRAINER_F, 15
	closetext
	end

Route60GateCooltrainerText:
	text "That's a lot of"
	line "badges you have!"

	para "Maybe you have a"
	line "shot at the champ-"
	cont "ionship."
	done

MoroBinoculars1:
	jumptext MoroBinoculars1Text

MoroBinoculars1Text:
	text "Hmm<...>"

	para "A flock of WINGULL"
	line "heading east!"
	done

MoroBinoculars2:
	jumptext MoroBinoculars2Text

MoroBinoculars2Text:
	text "Interesting WATER"
	line "#MON are jump-"
	cont "ing out the water."
	done

Route60GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, MORO_ROUTE_60_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, MoroBinoculars1
	signpost 4, 6, SIGNPOST_UP, MoroBinoculars2

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 2, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route60GateCooltrainer, -1
