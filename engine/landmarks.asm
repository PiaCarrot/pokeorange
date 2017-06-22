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
	landmark   50,  132, ValenciaIslandName
	landmark   44,  132, Route49Name
	landmark   16,  132, TangeloIslandName
	landmark   16,  124, Route50Name
	landmark   24,  124, Route51Name
	landmark   24,  120, TangeloJungleName
	landmark   28,  112, Route52Name
	landmark   28,  100, MikanIslandName
	landmark   40,  92,  Route53Name
	landmark   52,  84,  Route54Name
	landmark   52,  76,  MandarinNorthName
	landmark   52,  100, SunburstIslandName
	landmark   56,  114, Route55Name
	landmark   52,  110, CrystalCaveName
	landmark   72,  120, PinkanIslandName
	landmark   92,  124, Route56Name
	landmark   108, 124, Fukuhara4Name
	landmark   120, 104, KinnowIslandName
	landmark   136,  96, Route57Name
	landmark   136,  80, UnnamedIsland1Name
	landmark   148,  76, Route58Name
	landmark   156,  76, NavelIslandName
	landmark   158,  74, MtNavelName
	landmark   148, 100, GrapefruitName
	landmark   148, 108, Route59Name
	landmark   148, 116, MoroIslandName
	landmark   146, 116, WreckedShipName
	landmark   140, 124, Route60Name
	landmark   128, 128, GoldenIslandName
	landmark   124, 140, Route61Name
	landmark   140, 144, MurcottIslandName
	landmark   124, 156, UnnamedIsland2Name
	landmark   104, 144, Route62Name
	landmark   96,  144, MandarinDesertName
	landmark   84,  140, TrovitopolisName
	landmark   76,  148, TrovitaIslandName
	landmark   132,  72, Route63Name
	landmark   128,  56, CleopatraIslandName
	landmark   152,  52, Route64Name
	landmark   160,  32, AscorbiaIslandName
	landmark   152,  36, Route65Name
	landmark   148,  36, Route66Name
	landmark   136,  32, ButwalIslandName
	landmark   112,  32, Route67Name
	landmark   108,  52, KumquatIslandName
	landmark   82,   60, Route68Name
	landmark   64,   56, RindIslandName
	landmark   44,   60, Route69Name
	landmark   24,   56, UnnamedIsland3Name
	landmark   20,   36, Route70Name
	landmark   36,   36, PummeloIslandName
	landmark   52,   36, Route71Name
	landmark   64,   32, TarrocoIslandName
	landmark   76,   36, Route72Name
	landmark   92,   36, HamlinIslandName
	landmark   96,   36, HamlinFieldsName
	landmark   92,   84, ShamoutiIslandName
	landmark   84,   92, FireIslandName
	landmark   100,  92, IceIslandName
	landmark   108,  84, LightningIslandName

	landmark   0,   0, VermilionCityName
	landmark   0,   0, Route11Name
	landmark   0,   0, Route12Name
	landmark   0,   0, Route13Name
	landmark   0,   0, Route14Name
	landmark   0,   0, Route15Name
	landmark   0,   0, FuchsiaCityName
	landmark   0,   0, Route19Name
	landmark   0,   0, Route20Name
	landmark   0,   0, SeafoamIslandsName
	landmark   0,   0, CinnabarIslandName
	landmark   0,   0, CinnabarVolcanoName
	landmark   0,   0, Route21Name
	landmark   0,   0, PalletTownName
	landmark   0,   0, Route1Name
	landmark   0,   0, CinnabarSeaName
	landmark   0,   0, SaydaIslandName
	landmark   0,   0, KantoSea1Name
	landmark   0,   0, CamomileIslandName
	landmark   0,   0, VermilionSeaName
	landmark   0,   0, KantoSea2Name
	landmark   0,   0, ChrysanthemumName
	landmark   0,   0, MetallicaIslandName
	landmark   0,   0, KantoSea3Name
	landmark   0,   0, WisteriaTownName
	landmark   0,   0, HutberCityName
	landmark   0,   0, PortaVistaName
	landmark   0,   0, AcapulcoTownName
	landmark   0,   0, NewIslandName
	landmark   0,   0, RainbowIslandName
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
MtNavelName:         db "MT. NAVEL@"
GrapefruitName:      db "7 GRAPEFRUITS@"
Route59Name:         db "ROUTE 59@"
MoroIslandName:      db "MORO ISLAND@"
WreckedShipName:     db "WRECKED SHIP@"
Route60Name:         db "ROUTE 60@"
GoldenIslandName:    db "GOLDEN ISLAND@"
Route61Name:         db "ROUTE 61@"
MurcottIslandName:   db "MURCOTT ISLAND@"
UnnamedIsland2Name:  db "UNNAMED ISLAND@"
Route62Name:         db "ROUTE 62@"
MandarinDesertName:  db "MANDARIN DESERT@"
TrovitopolisName:    db "TROVITOPOLIS@"
TrovitaIslandName:   db "TROVITA ISLAND@"
Route63Name:         db "ROUTE 63@"
CleopatraIslandName: db "CLEOPATRA ISLE@"
Route64Name:         db "ROUTE 64@"
AscorbiaIslandName:  db "ASCORBIA ISLAND@"
Route65Name:         db "ROUTE 65@"
Route66Name:         db "ROUTE 66@"
ButwalIslandName:    db "BUTWAL ISLAND@"
Route67Name:         db "ROUTE 67@"
KumquatIslandName:   db "KUMQUAT ISLAND@"
Route68Name:         db "ROUTE 68@"
RindIslandName:      db "RIND ISLAND@"
Route69Name:         db "ROUTE 69@"
UnnamedIsland3Name:  db "UNNAMED ISLAND@"
Route70Name:         db "ROUTE 70@"
PummeloIslandName:   db "PUMMELO ISLAND@"
Route71Name:         db "ROUTE 71@"
TarrocoIslandName:   db "TARROCO ISLAND@"
Route72Name:         db "ROUTE 72@"
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
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
SeafoamIslandsName:  db "SEAFOAM ISLANDS@"
CinnabarIslandName:  db "CINNABAR ISLAND@"
CinnabarVolcanoName: db "CINNABAR VOLCANO@"
Route21Name:         db "ROUTE 21@"
PalletTownName:      db "PALLET TOWN@"
Route1Name:          db "ROUTE 1@"
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
