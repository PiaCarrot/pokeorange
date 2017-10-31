ReadMonMenuIcon: ; 8eab3
	cp EGG
	jr z, .egg
	dec a
	ld hl, MonMenuIcons
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret
.egg
	ld a, ICON_EGG
	ret
; 8eac4

MonMenuIcons: ; 8eac4
	db ICON_BULBASAUR    ; BULBASAUR
	db ICON_IVYSAUR      ; IVYSAUR
	db ICON_VENUSAUR     ; VENUSAUR
	db ICON_CHARMANDER   ; CHARMANDER
	db ICON_CHARMELEON   ; CHARMELEON
	db ICON_CHARIZARD       ; CHARIZARD
	db ICON_SQUIRTLE     ; SQUIRTLE
	db ICON_WARTORTLE     ; WARTORTLE
	db ICON_BLASTOISE     ; BLASTOISE
	db ICON_CATERPIE     ; CATERPIE
	db ICON_METAPOD      ; METAPOD
	db ICON_BUTTERFREE   ; BUTTERFREE
	db ICON_WEEDLE  ; WEEDLE
	db ICON_KAKUNA  ; KAKUNA
	db ICON_BEEDRILL          ; BEEDRILL
	db ICON_PIDGEY         ; PIDGEY
	db ICON_PIDGEOTTO         ; PIDGEOTTO
	db ICON_PIDGEOT         ; PIDGEOT
	db ICON_RATTATA          ; RATTATA
	db ICON_RATICATE          ; RATICATE
	db ICON_SPEAROW         ; SPEAROW
	db ICON_FEAROW         ; FEAROW
	db ICON_EKANS      ; EKANS
	db ICON_ARBOK      ; ARBOK
	db ICON_PIKACHU      ; PIKACHU
	db ICON_RAICHU      ; RAICHU
	db ICON_SANDSHREW      ; SANDSHREW
	db ICON_EGG      ; SANDSLASH
	db ICON_EGG          ; NIDORAN_F
	db ICON_EGG          ; NIDORINA
	db ICON_EGG      ; NIDOQUEEN
	db ICON_EGG          ; NIDORAN_M
	db ICON_EGG          ; NIDORINO
	db ICON_EGG      ; NIDOKING
	db ICON_EGG     ; CLEFAIRY
	db ICON_EGG     ; CLEFABLE
	db ICON_EGG          ; VULPIX
	db ICON_EGG          ; NINETALES
	db ICON_EGG   ; JIGGLYPUFF
	db ICON_EGG   ; WIGGLYTUFF
	db ICON_EGG          ; ZUEGG
	db ICON_EGG          ; GOLEGG
	db ICON_EGG       ; ODDISH
	db ICON_EGG       ; GLOOM
	db ICON_EGG       ; VILEPLUME
	db ICON_EGG          ; PARAS
	db ICON_EGG          ; PARASECT
	db ICON_EGG  ; VENONAT
	db ICON_EGG         ; VENOEGG
	db ICON_EGG      ; EGG
	db ICON_EGG      ; DUGTRIO
	db ICON_EGG          ; MEOWTH
	db ICON_EGG          ; PERSIAN
	db ICON_EGG      ; PSYDUCK
	db ICON_EGG      ; GOLDUCK
	db ICON_EGG      ; MANKEY
	db ICON_EGG      ; PRIMEAPE
	db ICON_EGG          ; GROWLITHE
	db ICON_EGG          ; ARCANINE
	db ICON_EGG      ; POLIWAG
	db ICON_EGG      ; POLIWHIRL
	db ICON_EGG      ; POLIWRATH
	db ICON_EGG   ; ABRA
	db ICON_EGG   ; KADABRA
	db ICON_EGG   ; ALAKAZAM
	db ICON_EGG      ; MACHOP
	db ICON_EGG      ; MACHOKE
	db ICON_EGG      ; MACHAMP
	db ICON_EGG       ; BELLSPROUT
	db ICON_EGG       ; WEEPINBELL
	db ICON_EGG       ; VICTREEBEL
	db ICON_EGG    ; TENTACOOL
	db ICON_EGG    ; TENTACRUEL
	db ICON_EGG      ; GEODUDE
	db ICON_EGG      ; GRAVELER
	db ICON_EGG      ; GOLEM
	db ICON_EGG       ; PONYTA
	db ICON_EGG       ; RAPIDASH
	db ICON_EGG     ; SLOWPOKE
	db ICON_EGG     ; SLOWBRO
	db ICON_EGG      ; MAGNEMITE
	db ICON_EGG      ; MAGNETON
	db ICON_EGG         ; FARFETCH_D
	db ICON_EGG         ; DODUO
	db ICON_EGG         ; DODRIO
	db ICON_EGG       ; SEEL
	db ICON_EGG       ; DEWGONG
	db ICON_EGG         ; GRIMER
	db ICON_EGG         ; MUK
	db ICON_EGG        ; EGGDER
	db ICON_EGG        ; CLOYSTER
	db ICON_EGG        ; GASTLY
	db ICON_EGG        ; HAUNTER
	db ICON_EGG        ; GENGAR
	db ICON_EGG      ; ONIX
	db ICON_EGG   ; DROWZEE
	db ICON_EGG   ; HYPNO
	db ICON_EGG        ; KRABBY
	db ICON_EGG        ; KINGLER
	db ICON_EGG      ; EGG
	db ICON_EGG      ; ELECTRODE
	db ICON_EGG       ; EXEGGCUTE
	db ICON_EGG       ; EXEGGUTOR
	db ICON_EGG      ; CUBONE
	db ICON_EGG      ; MAROWAK
	db ICON_EGG      ; HITMONLEE
	db ICON_EGG      ; HITMONCHAN
	db ICON_EGG      ; LICKITUNG
	db ICON_EGG         ; KOFFING
	db ICON_EGG         ; WEEZING
	db ICON_EGG       ; RHYHORN
	db ICON_EGG      ; RHYDON
	db ICON_EGG     ; CHANSEY
	db ICON_EGG       ; TANGELA
	db ICON_EGG      ; KANGASKHAN
	db ICON_EGG         ; HORSEA
	db ICON_EGG         ; SEADRA
	db ICON_EGG         ; GOLDEEN
	db ICON_EGG         ; SEAKING
	db ICON_EGG       ; STARYU
	db ICON_EGG       ; STARMIE
	db ICON_EGG   ; MR__MIME
	db ICON_EGG          ; SCYTHER
	db ICON_EGG   ; JYNX
	db ICON_EGG   ; ELECTABUZZ
	db ICON_EGG   ; MAGMAR
	db ICON_EGG          ; PINSIR
	db ICON_EGG       ; TAUROS
	db ICON_EGG         ; MAGIKARP
	db ICON_EGG     ; GYARADOS
	db ICON_LAPRAS       ; LAPRAS
	db ICON_EGG         ; DITTO
	db ICON_EGG          ; EEVEE
	db ICON_EGG          ; VAPOREON
	db ICON_EGG          ; JOLTEON
	db ICON_EGG          ; FLAREON
	db ICON_EGG      ; PORYGON
	db ICON_EGG        ; OMANYTE
	db ICON_EGG        ; OMASTAR
	db ICON_EGG        ; KABUTO
	db ICON_EGG        ; KABUTOPS
	db ICON_EGG         ; AERODACTYL
	db ICON_EGG      ; EGG
	db ICON_EGG         ; ARTICUNO
	db ICON_EGG         ; ZAPDOS
	db ICON_EGG         ; MOLTRES
	db ICON_EGG      ; DRATINI
	db ICON_EGG      ; DRAGONAIR
	db ICON_EGG       ; DRAGONITE
	db ICON_EGG   ; MEWTWO
	db ICON_EGG   ; MEW
	db ICON_TROPIUS      ; TROPIUS
	db ICON_KECLEON      ; KECLEON
	db ICON_EGG       ; CHATOT
	db ICON_EGG          ; PIKIPEK
	db ICON_EGG          ; TRUMBEAK
	db ICON_EGG          ; TOUCANNON
	db ICON_EGG      ; MUNCHLAX
	db ICON_EGG      ; MINCCINO
	db ICON_EGG      ; CINCCINO
	db ICON_WINGULL      ; WINGULL
	db ICON_PELIPPER     ; PELIPPER
	db ICON_EGG         ; CHINGLING
	db ICON_CHIMECHO     ; CHIMECHO
	db ICON_EGG          ; SALANDIT
	db ICON_EGG          ; SALAZZLE
	db ICON_EGG          ; FINNEON
	db ICON_EGG          ; LUMINEON
	db ICON_EGG          ; CROEGG
	db ICON_EGG         ; CHINCHOU
	db ICON_EGG         ; LANTURN
	db ICON_EGG      ; PICHU
	db ICON_EGG     ; CLEFFA
	db ICON_EGG   ; IGGLYBUFF
	db ICON_EGG     ; TOGEPI
	db ICON_EGG         ; TOGETIC
	db ICON_EGG         ; TOGEKISS
	db ICON_AZURILL      ; AZURILL
	db ICON_EGG          ; MAREEP
	db ICON_EGG      ; FLAAFFY
	db ICON_EGG      ; AMPHAROS
	db ICON_EGG       ; BELLOSSOM
	db ICON_EGG   ; MARILL
	db ICON_EGG   ; AZUMARILL
	db ICON_EGG     ; EGG
	db ICON_EGG      ; POLITOED
	db ICON_EGG       ; HOPPIP
	db ICON_EGG       ; SKIPLOOM
	db ICON_EGG       ; JUMPLUFF
	db ICON_EGG         ; STUNFISK
	db ICON_EGG       ; SUNKERN
	db ICON_EGG       ; SUNFLORA
	db ICON_EGG          ; LEAFEON
	db ICON_EGG      ; GLACEON
	db ICON_EGG      ; SYLVEON
	db ICON_EGG          ; ESPEON
	db ICON_EGG          ; UMBREON
	db ICON_RELICANTH    ; RELICANTH
	db ICON_EGG     ; SLOWKING
	db ICON_EGG        ; MIMIKYU
	db ICON_EGG      ; SPINDA
	db ICON_EGG        ; SKRELP
	db ICON_EGG       ; DRAGALGE
	db ICON_EGG          ; TRAPINCH
	db ICON_EGG          ; VIBRAVA
	db ICON_EGG      ; FLYGON
	db ICON_EGG          ; TURTONATOR
	db ICON_EGG      ; STEELIX
	db ICON_EGG         ; WAILMER
	db ICON_EGG         ; WAILORD
	db ICON_EGG         ; QWILEGG
	db ICON_EGG          ; SCIZOR
	db ICON_EGG          ; SHUCKLE
	db ICON_EGG          ; MAREANIE
	db ICON_EGG          ; TOXAPEX
	db ICON_EGG      ; SANDYGAST
	db ICON_EGG      ; PALOSSAND
	db ICON_EGG         ; SLUGMA
	db ICON_EGG         ; MAGCARGO
	db ICON_EGG       ; CARVANHA
	db ICON_EGG       ; SHARPEDO
	db ICON_EGG        ; CORSOLA
	db ICON_EGG         ; REMORAID
	db ICON_EGG         ; OCTILLERY
	db ICON_EGG         ; MANTYKE
	db ICON_EGG         ; MANTINE
	db ICON_EGG         ; SKARMORY
	db ICON_EGG   ; MAGMORTAR
	db ICON_EGG   ; ELECTIVIRE
	db ICON_EGG       ; KINGDRA
	db ICON_EGG       ; PHANPY
	db ICON_EGG       ; DONPHAN
	db ICON_EGG      ; PORYGON2
	db ICON_EGG      ; PORYGONZ
	db ICON_EGG      ; LICKILICKY
	db ICON_EGG      ; TYROGUE
	db ICON_EGG      ; HITMONTOP
	db ICON_EGG   ; SMOOCHUM
	db ICON_EGG   ; ELEKID
	db ICON_EGG   ; MAGBY
	db ICON_EGG     ; HAPPINY
	db ICON_EGG     ; BLISSEY
	db ICON_EGG          ; CUTIEFLY
	db ICON_EGG          ; RIBOMBEE
	db ICON_EGG       ; TANGROWTH
	db ICON_EGG      ; RHYPERIOR
	db ICON_EGG      ; MAGNEZONE
	db ICON_EGG   ; MARSHADOW
	db ICON_EGG        ; LUGIA
	db ICON_EGG        ; HO_OH
	db ICON_EGG   ; CELEBI
	db ICON_EGG         ; LATIAS
	db ICON_EGG         ; LATIOS

IconPointers:
	dw NullIcon
	dw EggIcon
	
	dw BulbasaurIcon
	dw IvysaurIcon
	dw VenusaurIcon
	dw CharmanderIcon
	dw CharmeleonIcon
	dw CharizardIcon
	dw SquirtleIcon
	dw WartortleIcon
	dw BlastoiseIcon
	dw CaterpieIcon
	dw MetapodIcon
	dw ButterfreeIcon
	dw WeedleIcon
	dw KakunaIcon
	dw BeedrillIcon
	dw PidgeyIcon
	dw PidgeottoIcon
	dw PidgeotIcon
	dw RattataIcon
	dw RaticateIcon
	dw SpearowIcon
	dw FearowIcon
	dw EkansIcon
	dw ArbokIcon
	dw PikachuIcon
	dw RaichuIcon
	dw SandshrewIcon
	
	dw LaprasIcon
	
	dw WingullIcon
	dw PelipperIcon
	dw AzurillIcon
	dw ChimechoIcon
	dw KecleonIcon
	dw TropiusIcon
	dw RelicanthIcon
	
Icons:
NullIcon:
EggIcon:          INCBIN "gfx/icon/egg.2bpp" ; 0x8f98d

BulbasaurIcon:    INCBIN "gfx/icon/bulbasaur.2bpp" ; 0x8f68d
IvysaurIcon:      INCBIN "gfx/icon/ivysaur.2bpp"
VenusaurIcon:     INCBIN "gfx/icon/venusaur.2bpp"
CharmanderIcon:   INCBIN "gfx/icon/charmander.2bpp"
CharmeleonIcon:   INCBIN "gfx/icon/charmeleon.2bpp"
CharizardIcon:    INCBIN "gfx/icon/charizard.2bpp"
SquirtleIcon:     INCBIN "gfx/icon/squirtle.2bpp"
WartortleIcon:    INCBIN "gfx/icon/wartortle.2bpp"
BlastoiseIcon:    INCBIN "gfx/icon/blastoise.2bpp"
CaterpieIcon:     INCBIN "gfx/icon/caterpie.2bpp"
MetapodIcon:      INCBIN "gfx/icon/metapod.2bpp"
ButterfreeIcon:   INCBIN "gfx/icon/butterfree.2bpp"
WeedleIcon:       INCBIN "gfx/icon/weedle.2bpp"
KakunaIcon:       INCBIN "gfx/icon/kakuna.2bpp"
BeedrillIcon:     INCBIN "gfx/icon/beedrill.2bpp"
PidgeyIcon:       INCBIN "gfx/icon/pidgey.2bpp"
PidgeottoIcon:    INCBIN "gfx/icon/pidgeotto.2bpp"
PidgeotIcon:      INCBIN "gfx/icon/pidgeot.2bpp"
RattataIcon:	  INCBIN "gfx/icon/rattata.2bpp"
RaticateIcon:	  INCBIN "gfx/icon/raticate.2bpp"
SpearowIcon:	  INCBIN "gfx/icon/spearow.2bpp"
FearowIcon:		  INCBIN "gfx/icon/fearow.2bpp"
EkansIcon:		  INCBIN "gfx/icon/ekans.2bpp"
ArbokIcon:		  INCBIN "gfx/icon/arbok.2bpp"
PikachuIcon:	  INCBIN "gfx/icon/pikachu.2bpp"
RaichuIcon:       INCBIN "gfx/icon/raichu.2bpp"
SandshrewIcon:    INCBIN "gfx/icon/sandshrew.2bpp"

LaprasIcon:       INCBIN "gfx/icon/lapras.2bpp"

WingullIcon:      INCBIN "gfx/icon/wingull.2bpp"
PelipperIcon:     INCBIN "gfx/icon/pelipper.2bpp"
AzurillIcon:      INCBIN "gfx/icon/azurill.2bpp"
ChimechoIcon:     INCBIN "gfx/icon/chimecho.2bpp"
KecleonIcon:      INCBIN "gfx/icon/kecleon.2bpp"
TropiusIcon:      INCBIN "gfx/icon/tropius.2bpp"
RelicanthIcon:    INCBIN "gfx/icon/relicanth.2bpp"