const_value = 1
	const KINNOWISLANDROUTE57GATE_OFFICER

KinnowIslandRoute57Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowOfficerScript:
	faceplayer
	opentext
	checknite
	iffalse .NoFight
	checkevent EVENT_BEAT_JENNY_2
	iftrue .NoFight
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerJenny2SeenText
	waitbutton
	closetext
	winlosstext OfficerJenny2WinText, 0
	loadtrainer OFFICER, JENNY_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JENNY_2
	closetext
	end

.NoFight:
	writetext OfficerJenny2DaytimeText
	waitbutton
	closetext
	end

OfficerJenny2DaytimeText:
	text "Be careful out"
	line "there, kid."

	para "If you're headed"
	line "to NAVEL ISLAND,"
	cont "stock up on FULL"
	cont "HEAL."
	done
	
OfficerJenny2SeenText:
	text "Hey, it's pretty"
	line "boring around here"
	cont "at night. Let's"
	cont "have a battle!"
	done

OfficerJenny2WinText:
	text "You're a tough"
	line "little kid."
	done


KinnowIslandRoute57Gate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 8, KINNOW_ISLAND
	warp_def 5, 0, 9, KINNOW_ISLAND
	warp_def 4, 9, 1, ROUTE_57
	warp_def 5, 9, 2, ROUTE_57
	warp_def 2, 1, 1, ROUTE_57_GATE_UPSTAIRS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowOfficerScript, -1
