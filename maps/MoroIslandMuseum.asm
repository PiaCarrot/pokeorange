MoroIslandMuseum_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

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
	line "a mythic #MON."

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

MoroMuseumStone:
	jumptext MoroMuseumStoneText

MoroMuseumStoneText:
	text "ICE STONE"

	para "This is a recently"
	line "discovered stone."
	cont "It evolves certain"
	cont "kinds of #MON."
	done

MoroMuseumCuratorScript:
	checkevent EVENT_MORO_TROPHY_FOUND
	iftrue .CuratorTrophyFound
	opentext
	writetext CuratorTrophyMissingText
	waitbutton
	closetext
	end

.CuratorTrophyFound:
	opentext
	writetext CuratorTrophyFoundText
	waitbutton
	closetext
	end

CuratorTrophyMissingText:
	text "CURATOR: Hello."
	line "I'm sorry to say"
	cont "this, but someone"
	cont "stole the ORANGE"
	cont "LEAGUE trophy we"
	cont "had on display."

	para "I hope the police"
	line "find it soon."
	done

CuratorTrophyFoundText:
	text "CURATOR: Welcome"
	line "to the MORO MUSEUM"
	cont "where we keep rare"
	cont "exhibits that are"
	cont "found underwater."

	para "Please enjoy it to"
	line "your heart's con-"
	cont "tent!"
	done

MoroMuseumPoliceScript:
	faceplayer
	checkevent EVENT_MORO_TROPHY_FOUND
	iftrue .NoMorePolice
	checkitem MORO_TROPHY
	iftrue .MoroTrophyFound
	opentext
	writetext PoliceTrophyMissingText
	waitbutton
	closetext
	end

.MoroTrophyFound:
	takeitem MORO_TROPHY
	opentext
	writetext PoliceTrophyReturnedText
	waitbutton
	verbosegiveitem HM_FLY
	clearevent EVENT_MORO_TROPHY_MISSING
	setevent EVENT_MORO_TROPHY_FOUND
	closetext
	end

.NoMorePolice:
	opentext
	writetext PoliceMuseumDoneText
	waitbutton
	closetext
	end

PoliceTrophyMissingText:
	text "This is a doozy. A"
	line "TROPHY was stolen"
	cont "from this display"
	cont "while the CURATOR"
	cont "wasn't looking."

	para "Unfortunately, no"
	line "one saw the perp-"
	cont "atrators, so we"
	cont "are stumped."
	done

PoliceTrophyReturnedText:
	text "Is that what I"
	line "think it is?"

	para "<...>"

	para "I can't believe"
	line "you found the"
	cont "trophy!"

	para "Thank you for"
	line "returning it!"
	cont "Here's something"
	cont "for your trouble."
	done

PoliceMuseumDoneText:
	text "Thank you for"
	line "being a good"
	cont "samaritan!"
	done

MoroMuseumBoyScript:
	jumptextfaceplayer MoroMuseumBoyText

MoroMuseumBoyText:
	text "The fossils are"
	line "way cool!"

	para "This one looks"
	line "like a BUG!"
	done

MoroMuseumLadyScript:
	jumptextfaceplayer MoroMuseumLadyText

MoroMuseumLadyText:
	text "My son is very ex-"
	line "cited to be here."

	para "I've already lost"
	line "track of him!"
	done

MoroMuseumGrampsScript:
	jumptextfaceplayer MoroMuseumGrampsText

MoroMuseumGrampsText:
	text "Mm<...>"

	para "Mythic #MON<...>"
	line "When I was a wee"
	cont "lad, I saw one."

	para "As black as a"
	line "SHADOW, with"
	cont "burning red eyes."

	para "It simply watched"
	line "me from the shade"
	cont "of a tree, and"
	cont "then disappeared."

	para "I wonder what it"
	line "was?"
	done

MoroIslandMuseum_MapEventHeader::

.Warps: db 2
	warp_def 15, 4, 1, MORO_ISLAND
	warp_def 15, 5, 1, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 12
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
	signpost 1, 5, SIGNPOST_READ, MoroMuseumStone
	signpost 1, 4, SIGNPOST_READ, MoroMuseumStone

.ObjectEvents: db 6
	person_event SPRITE_GOLD_TROPHY, 10, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroTrophyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_OFFICER, 11, 11, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumPoliceScript, EVENT_MORO_TROPHY_FOUND
	person_event SPRITE_GENTLEMAN, 15, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumCuratorScript, -1
	person_event SPRITE_BUG_CATCHER, 6, 3, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MoroMuseumBoyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_POKEFAN_F, 12, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -2, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroMuseumLadyScript, EVENT_MORO_TROPHY_MISSING
	person_event SPRITE_GRAMPS, 3, 12, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MoroMuseumGrampsScript, EVENT_MORO_TROPHY_MISSING
