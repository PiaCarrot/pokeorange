const_value set 1
	const KUMQUAT_UMBRELLA_LEFT_1
	const KUMQUAT_UMBRELLA_RIGHT_1
	const KUMQUAT_UMBRELLA_LEFT_2
	const KUMQUAT_UMBRELLA_RIGHT_2

KumquatIslandEast_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KUMQUAT
	return

KumquatEastUmbrellaScript:
	end

KumquatIslandEast_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_UMBRELLA, 24, 8, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 24, 9, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 14, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 15, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1