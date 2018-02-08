const_value set 1
	const ASCORBIA_FAN_CLUB_PRESIDENT
	const ASCORBIA_FAN_CLUB_MEMBER_1
	const ASCORBIA_FAN_CLUB_MEMBER_2
	const ASCORBIA_FAN_CLUB_FEAROW
	const ASCORBIA_FAN_CLUB_MEMBER_3

AscorbiaIslandFanClub_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaFanClubPresidentScript:
	end

AscorbiaIslandFanClub_MapEventHeader::

.Warps: db 2
	warp_def 9, 15, 3, ASCORBIA_ISLAND
	warp_def 9, 16, 3, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_GENTLEMAN, 1, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1
	person_event SPRITE_FISHER, 4, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1
	person_event SPRITE_ROCKER, 7, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1
	person_event SPRITE_FEAROW, 8, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, ObjectEvent, -1
	person_event SPRITE_LASS, 5, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1

