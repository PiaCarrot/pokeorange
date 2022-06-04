const_value = 1
	const MIKANISLANDROUTE53GATE_OFFICER
	const MIKANISLANDROUTE53GATE_YOUNGSTER

MikanIslandRoute53Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

OfficerScript_0x69a2d:
	jumptextfaceplayer UnknownText_0x69a36

YoungsterScript_0x69a33:
	jumptextfaceplayer UnknownText_0x69abd
	end

Guard_Stop1:
	applymovement PLAYER, Movement_Hey
	opentext
	writetext Text_WaitPlayer2
	waitbutton
	closetext
	applymovement PLAYER, Movement_Go_Away
	end

Text_WaitPlayer2:
	text "Hey!"

	para "I'm afraid I can't"
	line "let you pass."

	para "There are suspici-"
	line "ous people on"
	cont "ROUTE 53."

	para "It seems there"
	line "are several repor-"
	cont "ts of a couple"
	cont "wearing the now-"

	para "defunct TEAM"
	line "ROCKET's uniform."
	done

UnknownText_0x69a36:
	text "From here, you'll"
	line "have access to two"
	cont "islands."

	para "There's MANDARIN"
	line "NORTH and SUNBURST"
	cont "ISLAND."
	done

UnknownText_0x69abd:
	text "I heard that TEAM"
	line "ROCKET dispersed"
	cont "recently."

	para "Maybe some stragg-"
	line "lers are up to no"
	cont "good."
	done

Movement_Hey:
	turn_head UP
	step_end

Movement_Go_Away:
	step LEFT
	step_end

MikanIslandRoute53Gate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 6, MIKAN_ISLAND
	warp_def 5, 0, 7, MIKAN_ISLAND
	warp_def 4, 9, 1, ROUTE_53
	warp_def 5, 9, 2, ROUTE_53
	warp_def 2, 1, 1, ROUTE_53_GATE_UPSTAIRS

.CoordEvents: db 2
	xy_trigger 0, 4, 5, Guard_Stop1
	xy_trigger 0, 5, 5, Guard_Stop1

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x69a2d, -1
	person_event SPRITE_YOUNGSTER, 6, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x69a33, -1
