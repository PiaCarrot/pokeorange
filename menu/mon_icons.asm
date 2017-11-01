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
	db ICON_BULBASAUR
	db ICON_IVYSAUR
	db ICON_VENUSAUR
	db ICON_CHARMANDER
	db ICON_CHARMELEON
	db ICON_CHARIZARD
	db ICON_SQUIRTLE
	db ICON_WARTORTLE
	db ICON_BLASTOISE
	db ICON_CATERPIE
	db ICON_METAPOD
	db ICON_BUTTERFREE
	db ICON_WEEDLE
	db ICON_KAKUNA
	db ICON_BEEDRILL
	db ICON_PIDGEY
	db ICON_PIDGEOTTO
	db ICON_PIDGEOT
	db ICON_RATTATA
	db ICON_RATICATE
	db ICON_SPEAROW
	db ICON_FEAROW
	db ICON_EKANS
	db ICON_ARBOK
	db ICON_PIKACHU
	db ICON_RAICHU
	db ICON_SANDSHREW
	db ICON_SANDSLASH
	db ICON_NIDORAN_F
	db ICON_NIDORINA
	db ICON_NIDOQUEEN
	db ICON_NIDORAN_M
	db ICON_NIDORINO
	db ICON_NIDOKING
	db ICON_CLEFAIRY
	db ICON_CLEFABLE
	db ICON_VULPIX
	db ICON_NINETALES
	db ICON_JIGGLYPUFF
	db ICON_WIGGLYTUFF
	db ICON_ZUBAT
	db ICON_GOLBAT
	db ICON_ODDISH
	db ICON_GLOOM
	db ICON_VILEPLUME
	db ICON_PARAS
	db ICON_PARASECT
	db ICON_VENONAT
	db ICON_VENOMOTH
	db ICON_DIGLETT
	db ICON_DUGTRIO
	db ICON_MEOWTH
	db ICON_PERSIAN
	db ICON_PSYDUCK
	db ICON_GOLDUCK
	db ICON_MANKEY
	db ICON_PRIMEAPE
	db ICON_GROWLITHE
	db ICON_ARCANINE
	db ICON_POLIWAG
	db ICON_POLIWHIRL
	db ICON_POLIWRATH
	db ICON_ABRA
	db ICON_KADABRA
	db ICON_ALAKAZAM
	db ICON_MACHOP
	db ICON_MACHOKE
	db ICON_MACHAMP
	db ICON_BELLSPROUT
	db ICON_WEEPINBELL
	db ICON_VICTREEBEL
	db ICON_TENTACOOL
	db ICON_TENTACRUEL
	db ICON_GEODUDE
	db ICON_GRAVELER
	db ICON_GOLEM
	db ICON_PONYTA
	db ICON_RAPIDASH
	db ICON_SLOWPOKE
	db ICON_SLOWBRO
	db ICON_MAGNEMITE
	db ICON_MAGNETON
	db ICON_FARFETCH_D
	db ICON_DODUO
	db ICON_DODRIO
	db ICON_SEEL
	db ICON_DEWGONG
	db ICON_GRIMER
	db ICON_MUK
	db ICON_SHELLDER
	db ICON_CLOYSTER
	db ICON_GASTLY
	db ICON_HAUNTER
	db ICON_GENGAR
	db ICON_ONIX
	db ICON_DROWZEE
	db ICON_HYPNO
	db ICON_KRABBY
	db ICON_KINGLER
	db ICON_VOLTORB
	db ICON_ELECTRODE
	db ICON_EXEGGCUTE
	db ICON_EXEGGUTOR
	db ICON_CUBONE
	db ICON_MAROWAK
	db ICON_HITMONLEE
	db ICON_HITMONCHAN
	db ICON_LICKITUNG
	db ICON_KOFFING
	db ICON_WEEZING
	db ICON_RHYHORN
	db ICON_RHYDON
	db ICON_CHANSEY
	db ICON_TANGELA
	db ICON_KANGASKHAN
	db ICON_HORSEA
	db ICON_SEADRA
	db ICON_GOLDEEN
	db ICON_SEAKING
	db ICON_STARYU
	db ICON_STARMIE
	db ICON_MR__MIME
	db ICON_SCYTHER
	db ICON_JYNX
	db ICON_ELECTABUZZ
	db ICON_MAGMAR
	db ICON_PINSIR
	db ICON_TAUROS
	db ICON_MAGIKARP
	db ICON_GYARADOS
	db ICON_LAPRAS
	db ICON_DITTO
	db ICON_EEVEE
	db ICON_VAPOREON
	db ICON_JOLTEON
	db ICON_FLAREON
	db ICON_PORYGON
	db ICON_OMANYTE
	db ICON_OMASTAR
	db ICON_KABUTO
	db ICON_KABUTOPS
	db ICON_AERODACTYL
	db ICON_SNORLAX
	db ICON_ARTICUNO
	db ICON_ZAPDOS
	db ICON_MOLTRES
	db ICON_DRATINI
	db ICON_DRAGONAIR
	db ICON_DRAGONITE
	db ICON_MEWTWO
	db ICON_MEW
	db ICON_TROPIUS
	db ICON_KECLEON
	db ICON_CHATOT
	db ICON_PIKIPEK
	db ICON_TRUMBEAK
	db ICON_TOUCANNON
	db ICON_MUNCHLAX
	db ICON_MINCCINO
	db ICON_CINCCINO
	db ICON_WINGULL
	db ICON_PELIPPER
	db ICON_CHINGLING
	db ICON_CHIMECHO
	db ICON_SALANDIT
	db ICON_SALAZZLE
	db ICON_FINNEON
	db ICON_LUMINEON
	db ICON_CROBAT
	db ICON_CHINCHOU
	db ICON_LANTURN
	db ICON_PICHU
	db ICON_CLEFFA
	db ICON_IGGLYBUFF
	db ICON_TOGEPI
	db ICON_TOGETIC
	db ICON_TOGEKISS
	db ICON_AZURILL
	db ICON_MAREEP
	db ICON_FLAFFY
	db ICON_AMPHAROS
	db ICON_BELLOSSOM
	db ICON_MARILL
	db ICON_AZUMARILL
	db ICON_MIME_JR
	db ICON_POLITOED
	db ICON_HOPPIP
	db ICON_SKIPLOOM
	db ICON_JUMPLUFF
	db ICON_STUNFISK
	db ICON_SUNKERN
	db ICON_SUNFLORA
	db ICON_LEAFEON
	db ICON_GLACEON
	db ICON_SYLVEON
	db ICON_ESPEON
	db ICON_UMBREON
	db ICON_RELICANTH
	db ICON_SLOWKING
	db ICON_MIMIKYU
	db ICON_SPINDA
	db ICON_SKRELP
	db ICON_DRAGALGE
	db ICON_TRAPINCH
	db ICON_VIBRAVA
	db ICON_FLYGON
	db ICON_TURTONATOR
	db ICON_STEELIX
	db ICON_WAILMER
	db ICON_WAILORD
	db ICON_QWILFISH
	db ICON_SCIZOR
	db ICON_SHUCKLE
	db ICON_MAREANIE
	db ICON_TOXAPEX
	db ICON_SANDYGAST
	db ICON_PALOSSAND
	db ICON_SLUGMA
	db ICON_MAGCARGO
	db ICON_CARVANHA
	db ICON_SHARPEDO
	db ICON_CORSOLA
	db ICON_REMORAID
	db ICON_OCTILLERY
	db ICON_MANTYKE
	db ICON_MANTINE
	db ICON_SKARMORY
	db ICON_MAGMORTAR
	db ICON_ELECTIVIRE
	db ICON_KINGDRA
	db ICON_PHANPY
	db ICON_DONPHAN
	db ICON_PORYGON2
	db ICON_PORYGON_Z
	db ICON_LICKILICKY
	db ICON_TYROGUE
	db ICON_HITMONTOP
	db ICON_SMOOCHUM
	db ICON_ELEKID
	db ICON_MAGBY
	db ICON_HAPPINY
	db ICON_BLISSEY
	db ICON_CUTIEFLY
	db ICON_RIBOMBEE
	db ICON_TANGROWTH
	db ICON_RHYPERIOR
	db ICON_MAGNEZONE
	db ICON_MARSHADOW
	db ICON_LUGIA
	db ICON_HO_OH
	db ICON_CELEBI
	db ICON_LATIAS
	db ICON_LATIOS

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
	
	dw CrobatIcon
	dw TogeticIcon
	dw QwilfishIcon
	dw CorsolaIcon
	dw RemoraidIcon
	dw KingdraIcon
	dw SkarmoryIcon
	dw MantineIcon
	dw ChinchouIcon
	dw LanturnIcon
	
	dw WingullIcon
	dw PelipperIcon
	dw AzurillIcon
	dw ChimechoIcon
	dw KecleonIcon
	dw TropiusIcon
	dw RelicanthIcon
	dw WailmerIcon
	dw WailordIcon
	dw CarvanhaIcon
	dw SharpedoIcon
	
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

CrobatIcon:       INCBIN "gfx/icon/crobat.2bpp"
TogeticIcon:      INCBIN "gfx/icon/togetic.2bpp"
QwilfishIcon:     INCBIN "gfx/icon/qwilfish.2bpp"
CorsolaIcon:      INCBIN "gfx/icon/corsola.2bpp"
RemoraidIcon:     INCBIN "gfx/icon/remoraid.2bpp"
KingdraIcon:      INCBIN "gfx/icon/kingdra.2bpp"
SkarmoryIcon:     INCBIN "gfx/icon/skarmory.2bpp"
MantineIcon:      INCBIN "gfx/icon/mantine.2bpp"
ChinchouIcon:     INCBIN "gfx/icon/chinchou.2bpp"
LanturnIcon:      INCBIN "gfx/icon/lanturn.2bpp"

WingullIcon:      INCBIN "gfx/icon/wingull.2bpp"
PelipperIcon:     INCBIN "gfx/icon/pelipper.2bpp"
AzurillIcon:      INCBIN "gfx/icon/azurill.2bpp"
ChimechoIcon:     INCBIN "gfx/icon/chimecho.2bpp"
KecleonIcon:      INCBIN "gfx/icon/kecleon.2bpp"
TropiusIcon:      INCBIN "gfx/icon/tropius.2bpp"
RelicanthIcon:    INCBIN "gfx/icon/relicanth.2bpp"
WailmerIcon:      INCBIN "gfx/icon/wailmer.2bpp"
WailordIcon:      INCBIN "gfx/icon/wailord.2bpp"
CarvanhaIcon:     INCBIN "gfx/icon/carvanha.2bpp"
SharpedoIcon:     INCBIN "gfx/icon/sharpedo.2bpp"