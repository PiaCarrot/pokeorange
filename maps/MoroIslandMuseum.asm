MoroIslandMuseum_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

MoroTrophyScript:
	jumptext MoroTrophyText
	
MoroTrophyText:
	text "Although quite old"
	line "and rusted, it"
	cont "gives off a proud"
	cont "vibe."
	done
	
MoroMuseumShip:
	jumptext MoroMuseumShipText
	
MoroMuseumShipText:
	text "A small-scale ver-"
	line "sion of the S.S."
	cont "ORANGE, which will"
	cont "debut on HAMLIN"
	cont "ISLAND."
	done
	
MoroMuseumKabutopsFossil:
	refreshscreen
	pokepic KABUTOPS
	waitbutton
	closepokepic
	writetext MoroMuseumKabutopsFossilText
	waitbutton
	closetext
	end
	
MoroMuseumKabutopsFossilText:
	text "KABUTOPS"
	
	para "Only recently,"
	line "scientists have"
	cont "been able to re-"
	cont "vive these ancient"
	cont "#MON."
	
	para "It once swam under"
	line "water to hunt for"
	cont "prey."
	done

MoroMuseumOmastarFossil:
	refreshscreen
	pokepic OMASTAR
	waitbutton
	closepokepic
	writetext MoroMuseumOmastarFossilText
	waitbutton
	closetext
	end
	
MoroMuseumOmastarFossilText:
	text "OMASTAR"
	
	para "Only recently,"
	line "scientists have"
	cont "been able to re-"
	cont "vive these ancient"
	cont "#MON."
	
	para "It uses its tenta-"
	line "cles to capture"
	cont "its prey."
	done
	
MoroMuseumMewTablet:
	jumptext MoroMuseumMewTabletText
	
MoroMuseumMewTabletText:
	text "The tablet depicts"
	line "a mythical #MON."
	
	para "It is in an un-"
	line "known language and"
	cont "could not be read."
	done
	
MoroMuseumTrophySign:
	jumptext MoroMuseumTrophySignText
	
MoroMuseumTrophySignText:
	text "This trophy was"
	line "found in a wreck-"
	cont "age off the coast"
	cont "of the island."
	
	para "It is believed to"
	line "have belonged to"
	cont "an ORANGE LEAGUE"
	cont "champion nearly"
	cont "300 years ago."
	done
	
MoroMuseumSign:
	jumptext MoroMuseumSignText
	
MoroMuseumSignText:
	text "Please do not"
	line "touch the display!"
	done
	
MoroIslandMuseum_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 1, MORO_ISLAND
	warp_def 15, 5, 1, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 10
	signpost 8, 5, SIGNPOST_READ, MoroMuseumShip
	signpost 8, 4, SIGNPOST_READ, MoroMuseumShip
	signpost 5, 3, SIGNPOST_READ, MoroMuseumKabutopsFossil
	signpost 5, 2, SIGNPOST_READ, MoroMuseumKabutopsFossil
	signpost 5, 6, SIGNPOST_READ, MoroMuseumOmastarFossil
	signpost 5, 7, SIGNPOST_READ, MoroMuseumOmastarFossil
	signpost 1, 12, SIGNPOST_READ, MoroMuseumMewTablet
	signpost 1, 11, SIGNPOST_READ, MoroMuseumMewTablet
	signpost 8, 11, SIGNPOST_READ, MoroMuseumTrophySign
	signpost 0, 9, SIGNPOST_READ, MoroMuseumSign

.ObjectEvents: db 1
	person_event SPRITE_GOLD_TROPHY, 10, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroTrophyScript, EVENT_MORO_TROPHY_FOUND

