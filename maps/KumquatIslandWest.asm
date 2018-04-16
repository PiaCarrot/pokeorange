KumquatIslandWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatWestUmbrellas:
	end

KumquatIslandWest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_SAILBOAT_TOP, 28, 14, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 28, 14, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 24, 20, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 24, 21, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1

