AscorbiaIslandMoveRelearner_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MoveReminderScript:
	faceplayer
	opentext
	special MoveReminder
	waitbutton
	closetext
	end

AscorbiaIslandMoveRelearner_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, ASCORBIA_ISLAND
	warp_def 7, 3, 4, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoveReminderScript, -1

