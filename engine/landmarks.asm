GetLandmarkCoords: ; 0x1ca896
; Return coordinates (d, e) of landmark e.
	push hl
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret
; 0x1ca8a5


GetLandmarkName:: ; 0x1ca8a5
; Copy the name of landmark e to StringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks + 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, StringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret
; 0x1ca8c3


Landmarks: ; 0x1ca8c3

landmark: MACRO
	db \1, \2
	dw \3
ENDM

	landmark   0,   0,   SpecialMapName
	landmark   52,  140, ValenciaIslandName
	landmark   44,  132, Route49Name
	landmark   28,  132, TangeloIslandName
	landmark   20,  128, Route50Name
	landmark   28,  124, Route51Name
	landmark   20,  124, TangeloJungleName
	landmark   28,  112, Route52Name
	landmark   28,  100, MikanIslandName
	landmark   40,  92,  Route53Name
	landmark   52,  84,  Route54Name
	landmark   52,  76,  MandarinNorthName
	landmark   52,  100, SunburstIslandName
	landmark   56,  116, Route55Name
	landmark   52,  110, CrystalCaveName
	landmark   72,  120, PinkanIslandName
	landmark   92,  124, Route56Name
	landmark   108, 124, Fukuhara4Name
	landmark   116, 108, KinnowIslandName
	landmark   136,  96, Route57Name
	landmark   136,  80, UnnamedIsland1Name
	landmark   148,  76, Route58Name
	landmark   156,  76, NavelIslandName
	landmark   158,  74, MtNavelName
	landmark   148, 100, GrapefruitName
	landmark   148, 108, Route59Name
	landmark   148, 116, MoroIslandName
	landmark   140, 124, Route60Name
	landmark   142, 118, WreckedShipName
	landmark   128, 128, GoldenIslandName
	landmark   124, 140, Route61Name
	landmark   140, 148, MurcottIslandName
	landmark   124, 156, UnnamedIsland2Name
	landmark   104, 144, Route62Name
	landmark   96,  144, MandarinDesertName
	landmark   84,  140, TrovitopolisName
	landmark   76,  148, TrovitaIslandName
	landmark   128,  56, CleopatraIslandName
	landmark   152,  52, Route63Name
	landmark   164,  36, AscorbiaIslandName
	landmark   152,  32, Route64Name
	landmark   148,  36, Route65Name
	landmark   136,  32, ButwalIslandName
	landmark   112,  32, Route66Name
	landmark   108,  52, KumquatIslandName
	landmark   82,   60, Route67Name
	landmark   60,   60, RindIslandName
	landmark   44,   60, Route68Name
	landmark   24,   56, UnnamedIsland3Name
	landmark   20,   36, Route69Name
	landmark   28,   36, VictoryRoadName
	landmark   36,   36, PummeloIslandName
	landmark   52,   36, Route70Name
	landmark   64,   32, TarrocoIslandName
	landmark   76,   36, Route71Name
	landmark   92,   36, HamlinIslandName
	landmark   96,   36, HamlinFieldsName
	landmark   92,   84, ShamoutiIslandName
	landmark   84,   92, FireIslandName
	landmark   100,  92, IceIslandName
	landmark   108,  84, LightningIslandName

	landmark   116,   28, VermilionCityName
	landmark   138,   28, Route11Name
	landmark   156,   36, Route12Name
	landmark   148,   44, Route13Name
	landmark   140,   52, Route14Name
	landmark   132,   60, Route15Name
	landmark   116,   60, FuchsiaCityName
	landmark   116,   58, SafariZoneName
	landmark   116,   72, Route19Name
	landmark   92,   76, Route20Name
	landmark   84,   76, SeafoamIslandsName
	landmark   60,   76, CinnabarIslandName
	landmark   62,   74, CinnabarVolcanoName
	landmark   60,   64, Route21Name
	landmark   60,   52, PalletTownName
	landmark   42,   68, CinnabarSeaName
	landmark   20,   60, SaydaIslandName
	landmark   84,   64, KantoSea1Name
	landmark   92,   52, CamomileIslandName
	landmark   100,   36, VermilionSeaName
	landmark   100,   92, KantoSea2Name
	landmark   84,   92, ChrysanthemumName
	landmark   100,   116, MetallicaIslandName
	landmark   116,   92, KantoSea3Name
	landmark   132,   92, WisteriaTownName
	landmark   124,   116, HutberCityName
	landmark   132,   128, PortaVistaName
	landmark   116,   132, AcapulcoTownName
	landmark   36,   116, NewIslandName
	landmark   68,   140, RainbowIslandName
	landmark 148, 132, FastShipName


ValenciaIslandName:  db "VALENCIA ISLAND@"
Route49Name:         db "ROUTE 49@"
TangeloIslandName:   db "TANGELO ISLAND@"
Route50Name:         db "ROUTE 50@"
Route51Name:         db "ROUTE 51@"
TangeloJungleName:   db "TANGELO JUNGLE@"
Route52Name:         db "ROUTE 52@"
MikanIslandName:     db "MIKAN ISLAND@"
Route53Name:         db "ROUTE 53@"
Route54Name:         db "ROUTE 54@"
MandarinNorthName:   db "MANDARIN NORTH@"
SunburstIslandName:  db "SUNBURST ISLAND@"
Route55Name:         db "ROUTE 55@"
CrystalCaveName:     db "CRYSTAL CAVE@"
PinkanIslandName:    db "PINKAN ISLAND@"
Route56Name:         db "ROUTE 56@"
Fukuhara4Name:       db "FUKUHARA №.4@"
KinnowIslandName:    db "KINNOW ISLAND@"
Route57Name:         db "ROUTE 57@"
UnnamedIsland1Name:  db "UNNAMED ISLAND@"
Route58Name:         db "ROUTE 58@"
NavelIslandName:     db "NAVEL ISLAND@"
MtNavelName:         db "MT.NAVEL@"
GrapefruitName:      db "7 GRAPEFRUITS@"
Route59Name:         db "ROUTE 59@"
MoroIslandName:      db "MORO ISLAND@"
Route60Name:         db "ROUTE 60@"
WreckedShipName:     db "WRECKED SHIP@"
GoldenIslandName:    db "GOLDEN ISLAND@"
Route61Name:         db "ROUTE 61@"
MurcottIslandName:   db "MURCOTT ISLAND@"
UnnamedIsland2Name:  db "UNNAMED ISLAND@"
Route62Name:         db "ROUTE 62@"
MandarinDesertName:  db "MANDARIN DESERT@"
TrovitopolisName:    db "TROVITOPOLIS@"
TrovitaIslandName:   db "TROVITA ISLAND@"
CleopatraIslandName: db "CLEOPATRA ISLAND@"
Route63Name:         db "ROUTE 63@"
AscorbiaIslandName:  db "ASCORBIA ISLAND@"
Route64Name:         db "ROUTE 64@"
Route65Name:         db "ROUTE 65@"
ButwalIslandName:    db "BUTWAL ISLAND@"
Route66Name:         db "ROUTE 66@"
KumquatIslandName:   db "KUMQUAT ISLAND@"
Route67Name:         db "ROUTE 67@"
RindIslandName:      db "RIND ISLAND@"
Route68Name:         db "ROUTE 68@"
UnnamedIsland3Name:  db "UNNAMED ISLAND@"
Route69Name:         db "ROUTE 69@"
VictoryRoadName:     db "VICTORY ROAD@"
PummeloIslandName:   db "PUMMELO ISLAND@"
Route70Name:         db "ROUTE 70@"
TarrocoIslandName:   db "TARROCO ISLAND@"
Route71Name:         db "ROUTE 71@"
HamlinIslandName:    db "HAMLIN ISLAND@"
HamlinFieldsName:    db "HAMLIN FIELDS@"
ShamoutiIslandName:  db "SHAMOUTI ISLAND@"
FireIslandName:      db "FIRE ISLAND@"
IceIslandName:       db "ICE ISLAND@"
LightningIslandName: db "LIGHTNING ISLAND@"

; Kanto
VermilionCityName:   db "VERMILION CITY@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
FuchsiaCityName:     db "FUCHSIA CITY@"
SafariZoneName:		 db "SAFARI ZONE@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
SeafoamIslandsName:  db "SEAFOAM ISLANDS@"
CinnabarIslandName:  db "CINNABAR ISLAND@"
CinnabarVolcanoName: db "CINNABAR VOLCANO@"
Route21Name:         db "ROUTE 21@"
PalletTownName:      db "PALLET TOWN@"
CinnabarSeaName:     db "CINNABAR SEA@"
SaydaIslandName:     db "SAYDA ISLAND@"
KantoSea1Name:       db "KANTO SEA@"
CamomileIslandName:  db "CAMOMILE ISLAND@"
VermilionSeaName:    db "VERMILION SEA@"
KantoSea2Name:       db "KANTO SEA@"
ChrysanthemumName:   db "CHRYSANTHEMUM@"
MetallicaIslandName: db "METALLICA ISLAND@"
KantoSea3Name:       db "KANTO SEA@"
WisteriaTownName:    db "WISTERIA TOWN@"
HutberCityName:      db "HUTBER CITY@"
PortaVistaName:      db "PORTA VISTA@"
AcapulcoTownName:    db "ACAPULCO TOWN@"
NewIslandName:       db "NEW ISLAND@"
RainbowIslandName:   db "RAINBOW ISLAND@"

SpecialMapName:      db "SPECIAL@"
FastShipName:        db "FAST SHIP@"

RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP ; S.S. Aqua
	jr z, .johto
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp KANTO_LANDMARK
	jr c, .johto

; Victory Road area is considered to be Johto.
	cp VALENCIA_ISLAND
	jr c, .kanto

.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret
