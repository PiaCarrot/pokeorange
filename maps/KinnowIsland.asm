KinnowIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

KinnowTownSign:
	jumptext KinnowTownSignText

CafePiaSign:
	jumptext CafePiaSignText

SkateShopSign:
	jumptext SkateShopSignText

KinnowTownSignText:
	text "KINNOW ISLAND"
	line "The SAPPHIRE of"
	cont "the ORANGE ISLANDS"
	done

CafePiaSignText:
	text "PIA CARROT"
	line "CAFE"
	done

SkateShopSignText:
	text "SKATE SHOP"
	line "Roll around in"
	cont "style!"
	done

KinnowIsland_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 3
	signpost 18, 18, SIGNPOST_READ, KinnowTownSign
	signpost 24, 28, SIGNPOST_READ, CafePiaSign
	signpost 9, 11, SIGNPOST_READ, SkateShopSign

.ObjectEvents: db 0

