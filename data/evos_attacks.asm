INCLUDE "includes.asm"


SECTION "Evolutions and Attacks", ROMX


INCLUDE "data/evos_attacks_pointers.asm"


EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 25, SWEET_SCENT
	db 32, GROWTH
	db 39, SYNTHESIS
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 29, SWEET_SCENT
	db 38, GROWTH
	db 47, SYNTHESIS
	db 56, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, PETAL_DANCE
	db 1, TACKLE
	db 1, GROWL
	db 1, LEECH_SEED
	db 1, VINE_WHIP
	db 4, GROWL
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 29, SWEET_SCENT
	db 41, GROWTH
	db 53, SYNTHESIS
	db 65, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, METAL_CLAW
	db 19, RAGE
	db 25, SCARY_FACE
	db 31, FLAMETHROWER
	db 37, SLASH
	db 43, DRAGON_RAGE
	db 49, FIRE_SPIN
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, METAL_CLAW
	db 7, EMBER
	db 13, SMOKESCREEN
	db 20, RAGE
	db 27, SCARY_FACE
	db 34, FLAMETHROWER
	db 41, SLASH
	db 48, DRAGON_RAGE
	db 55, FIRE_SPIN
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, SCRATCH
	db 1, GROWL
	db 1, EMBER
	db 1, SMOKESCREEN
	db 7, EMBER
	db 13, SMOKESCREEN
	db 20, RAGE
	db 27, SCARY_FACE
	db 34, FLAMETHROWER
	db 36, WING_ATTACK
	db 44, SLASH
	db 54, DRAGON_RAGE
	db 64, FIRE_SPIN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 18, BITE
	db 23, RAPID_SPIN
	db 28, PROTECT
	db 33, RAIN_DANCE
	db 40, TAKE_DOWN ; SKULL_BASH
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 19, BITE
	db 25, RAPID_SPIN
	db 31, PROTECT
	db 37, RAIN_DANCE
	db 45, TAKE_DOWN ; SKULL_BASH
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, BUBBLE
	db 1, WITHDRAW
	db 4, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 19, BITE
	db 25, RAPID_SPIN
	db 31, PROTECT
	db 42, RAIN_DANCE
	db 55, TAKE_DOWN ; SKULL_BASH
	db 68, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 10, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 18, SUPERSONIC
	db 23, WHIRLWIND
	db 28, GUST
	db 34, PSYBEAM
	db 40, SAFEGUARD
	db 47, SIGNAL_BEAM ; SILVER_WIND
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 7, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 10, FURY_ATTACK
	db 15, FOCUS_ENERGY
	db 20, TWINEEDLE
	db 25, RAGE
	db 30, PURSUIT
	db 35, PIN_MISSILE
	db 40, AGILITY
	db 45, SIGNAL_BEAM ; ENDEAVOR
	db 50, POISON_JAB
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 19, WHIRLWIND
	db 25, WING_ATTACK
	db 31, MUD_SLAP ; FEATHERDANCE
	db 39, AGILITY
	db 47, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 20, WHIRLWIND
	db 27, WING_ATTACK
	db 34, MUD_SLAP ; FEATHERDANCE
	db 43, AGILITY
	db 52, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 1, GUST
	db 1, QUICK_ATTACK
	db 5, SAND_ATTACK
	db 9, GUST
	db 13, QUICK_ATTACK
	db 20, WHIRLWIND
	db 27, WING_ATTACK
	db 34, MUD_SLAP ; FEATHERDANCE
	db 48, AGILITY
	db 62, MIRROR_MOVE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 4, QUICK_ATTACK
	db 10, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG
	db 20, FOCUS_ENERGY
	db 22, CRUNCH
	db 25, FAINT_ATTACK
	db 28, SUPER_FANG
	db 31, DOUBLE_EDGE
	db 41, SUBSTITUTE ; ENDEAVOR
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, SWORDS_DANCE
	db 10, BITE
	db 13, PURSUIT
	db 16, HYPER_FANG
	db 20, SCARY_FACE
	db 22, FOCUS_ENERGY
	db 24, CRUNCH
	db 29, FAINT_ATTACK
	db 34, SUPER_FANG
	db 39, DOUBLE_EDGE
	db 50, SUBSTITUTE ; ENDEAVOR
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 19, PURSUIT
	db 25, AERIAL_ACE
	db 31, MIRROR_MOVE
	db 37, DRILL_PECK
	db 43, AGILITY
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, LEER
	db 1, FURY_ATTACK
	db 7, LEER
	db 13, FURY_ATTACK
	db 19, PURSUIT
	db 26, AERIAL_ACE
	db 32, MIRROR_MOVE
	db 40, DRILL_PECK
	db 47, AGILITY
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, POISON_STING
	db 13, BITE
	db 20, GLARE
	db 25, SCREECH
	db 32, ACID
	db 37, SCARY_FACE ; STOCKPILE + SPIT UP + SWALLOW
	db 43, HAZE
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, POISON_STING
	db 1, BITE
	db 8, POISON_STING
	db 13, BITE
	db 20, GLARE
	db 28, SCREECH
	db 38, ACID
	db 46, SCARY_FACE ; STOCKPILE + SPIT UP + SWALLOW
	db 56, HAZE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 15, DOUBLE_TEAM
	db 20, SLAM
	db 26, THUNDERBOLT
	db 33, AGILITY
	db 41, THUNDER
	db 50, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCHIC_M
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 6, DEFENSE_CURL
	db 11, SAND_ATTACK
	db 17, POISON_STING
	db 23, SWIFT
	db 30, FURY_SWIPES
	db 37, SLASH
	db 45, SWORDS_DANCE
	db 53, SANDSTORM
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 1, SAND_ATTACK
	db 6, DEFENSE_CURL
	db 11, SAND_ATTACK
	db 17, POISON_STING
	db 24, SWIFT
	db 33, FURY_SWIPES
	db 42, SLASH
	db 52, SWORDS_DANCE
	db 62, SANDSTORM
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, SCRATCH
	db 8, TAIL_WHIP
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 20, BITE
	db 23, SUPERSONIC ; HELPING_HAND
	db 30, FURY_SWIPES
	db 38, SUPER_FANG ; FLATTER
	db 47, CRUNCH
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, SCRATCH
	db 8, TAIL_WHIP
	db 12, DOUBLE_KICK
	db 18, POISON_STING
	db 22, BITE
	db 26, SUPERSONIC ; HELPING_HAND
	db 34, FURY_SWIPES
	db 43, SUPER_FANG ; FLATTER
	db 53, CRUNCH
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, BODY_SLAM
	db 43, EARTH_POWER
	db 58, FISSURE ; SUPERPOWER
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 8, FOCUS_ENERGY
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 20, HORN_ATTACK
	db 23, POISON_JAB ; HELPING_HAND
	db 30, FURY_ATTACK
	db 38, SUPER_FANG ; FLATTER
	db 47, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 8, FOCUS_ENERGY
	db 12, DOUBLE_KICK
	db 18, POISON_STING
	db 22, HORN_ATTACK
	db 26, POISON_JAB ; HELPING_HAND
	db 34, FURY_ATTACK
	db 43, SUPER_FANG ; FLATTER
	db 53, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, FOCUS_ENERGY
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, THRASH
	db 43, EARTH_POWER
	db 58, HORN_DRILL ; MEGAHORN
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, GROWL
	db 5, ENCORE
	db 9, SING
	db 13, DOUBLESLAP
	db 17, BATON_PASS ; FOLLOW_ME
	db 21, MINIMIZE
	db 25, DEFENSE_CURL
	db 29, METRONOME
	db 33, HEAL_BELL ; COSMIC_POWER
	db 37, MOONLIGHT
	db 41, LIGHT_SCREEN
	db 45, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 1, MINIMIZE
	db 1, METRONOME
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, ICE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 1, TAIL_WHIP
	db 7, ROAR
	db 9, CHARM
	db 12, CONFUSE_RAY
	db 15, ASTONISH
	db 20, MIST
	db 23, FAINT_ATTACK
	db 28, AURORA_BEAM
	db 31, PSYBEAM
	db 34, SAFEGUARD
	db 36, ICE_BEAM
	db 42, BLIZZARD
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD
	db 45, BLIZZARD
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 4, DEFENSE_CURL
	db 9, TACKLE ; POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, DOUBLESLAP
	db 29, REST
	db 34, BODY_SLAM
	db 39, PLAY_ROUGH
	db 44, PERISH_SONG ; HYPER_VOICE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 6, SUPERSONIC
	db 11, ASTONISH
	db 16, BITE
	db 21, WING_ATTACK
	db 26, CONFUSE_RAY
	db 31, AERIAL_ACE ; AIR_CUTTER
	db 36, MEAN_LOOK
	db 41, LEECH_LIFE
	db 46, HAZE
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 6, SUPERSONIC
	db 11, ASTONISH
	db 16, BITE
	db 21, WING_ATTACK
	db 28, CONFUSE_RAY
	db 35, AERIAL_ACE ; AIR_CUTTER
	db 42, MEAN_LOOK
	db 49, LEECH_LIFE
	db 56, HAZE
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 7, SWEET_SCENT
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 23, ACID
	db 30, MOONLIGHT
	db 37, MOONBLAST
	db 44, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, POISONPOWDER
	db 7, SWEET_SCENT
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 18, SLEEP_POWDER
	db 24, ACID
	db 35, MOONLIGHT
	db 44, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, GIGA_DRAIN ; MEGA_DRAIN
	db 44, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 7, STUN_SPORE
	db 13, POISONPOWDER
	db 19, LEECH_LIFE
	db 25, SPORE
	db 31, SLASH
	db 37, GROWTH
	db 43, GIGA_DRAIN
	db 49, SIGNAL_BEAM ; AROMATHERAPY
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, STUN_SPORE
	db 1, POISONPOWDER
	db 7, STUN_SPORE
	db 13, POISONPOWDER
	db 19, ZEN_HEADBUTT
	db 27, SPORE
	db 35, SLASH
	db 43, GROWTH
	db 51, GIGA_DRAIN
	db 59, SIGNAL_BEAM ; AROMATHERAPY
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 9, SUPERSONIC
	db 17, CONFUSION
	db 20, POISONPOWDER
	db 25, ZEN_HEADBUTT
	db 28, STUN_SPORE
	db 33, PSYBEAM
	db 36, SLEEP_POWDER
	db 41, PSYCHIC_M
	db 43, LEECH_LIFE
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 1, SUPERSONIC
	db 9, SUPERSONIC
	db 17, CONFUSION
	db 20, POISONPOWDER
	db 25, LEECH_LIFE
	db 28, STUN_SPORE
	db 31, GUST
	db 36, PSYBEAM
	db 42, SLEEP_POWDER
	db 52, PSYCHIC_M
	db 55, LEECH_LIFE
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 4, GROWL
	db 10, MUD_SLAP
	db 14, MAGNITUDE
	db 17, DIG
	db 23, METAL_CLAW
	db 28, EARTH_POWER
	db 33, SLASH
	db 41, EARTHQUAKE
	db 49, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, SCRATCH
	db 1, SAND_ATTACK
	db 1, GROWL
	db 1, MUD_SLAP
	db 4, GROWL
	db 10, MUD_SLAP
	db 14, MAGNITUDE
	db 17, DIG
	db 23, METAL_CLAW
	db 30, EARTH_POWER
	db 37, SLASH
	db 49, EARTHQUAKE
	db 61, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 11, BITE
	db 20, PAY_DAY
	db 28, FAINT_ATTACK
	db 35, PLAY_ROUGH
	db 41, FURY_SWIPES
	db 46, SLASH
	db 50, POWER_GEM ; FAKE OUT
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, BITE
	db 11, BITE
	db 20, PAY_DAY
	db 29, FAINT_ATTACK
	db 38, SCREECH
	db 46, FURY_SWIPES
	db 53, SLASH
	db 59, THIEF ; FAKE OUT
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, TAIL_WHIP
	db 10, DISABLE
	db 16, CONFUSION
	db 23, SCREECH
	db 31, AMNESIA ; PSYCH_UP
	db 40, ZEN_HEADBUTT
	db 50, HYDRO_PUMP
	db 52, TRI_ATTACK
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 1, DISABLE
	db 1, CONFUSION
	db 5, TAIL_WHIP
	db 10, DISABLE
	db 16, CONFUSION
	db 23, SCREECH
	db 31, ZEN_HEADBUTT ; PSYCH_UP
	db 44, FURY_SWIPES
	db 58, HYDRO_PUMP
	db 60, TRI_ATTACK
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 9, LOW_KICK
	db 15, KARATE_CHOP
	db 21, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 33, SEISMIC_TOSS
	db 39, CROSS_CHOP
	db 45, SCREECH
	db 51, THRASH
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LOW_KICK
	db 1, RAGE
	db 9, LOW_KICK
	db 15, KARATE_CHOP
	db 21, FURY_SWIPES
	db 27, FOCUS_ENERGY
	db 28, RAGE
	db 36, SEISMIC_TOSS
	db 45, CROSS_CHOP
	db 54, SCREECH
	db 63, THRASH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 7, EMBER
	db 13, LEER
	db 19, FORESIGHT ; ODOR_SLEUTH
	db 25, TAKE_DOWN
	db 31, FLAME_WHEEL
	db 37, BATON_PASS ; HELPING_HAND
	db 43, AGILITY
	db 49, FLAMETHROWER
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 1, TAKE_DOWN
	db 1, FLAME_WHEEL
	db 50, EXTREMESPEED
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 25, RAIN_DANCE
	db 31, BODY_SLAM
	db 37, BELLY_DRUM
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_ITEM, TRADE_STONE, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HYPNOSIS
	db 1, WATER_GUN
	db 7, HYPNOSIS
	db 13, WATER_GUN
	db 19, DOUBLESLAP
	db 27, RAIN_DANCE
	db 35, BODY_SLAM
	db 43, BELLY_DRUM
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SUBMISSION
	db 35, SUBMISSION
	db 51, LOCK_ON ; MIND_READER
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, REFLECT
	db 25, RECOVER
	db 30, FUTURE_SIGHT
	db 33, BARRIER ; ROLE_PLAY
	db 36, PSYCHIC_M
	db 43, LIGHT_SCREEN ; TRICK
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 23, REFLECT
	db 25, RECOVER
	db 30, FUTURE_SIGHT
	db 33, BARRIER ; CALM_MIND
	db 36, PSYCHIC_M
	db 43, LIGHT_SCREEN ; TRICK
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 22, FORESIGHT
	db 25, COUNTER ; REVENGE
	db 31, VITAL_THROW
	db 37, SUBMISSION
	db 40, CROSS_CHOP
	db 43, SCARY_FACE
	db 49, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 22, FORESIGHT
	db 25, COUNTER ; REVENGE
	db 33, VITAL_THROW
	db 41, SUBMISSION
	db 46, CROSS_CHOP
	db 51, SCARY_FACE
	db 59, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 1, FOCUS_ENERGY
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 22, FORESIGHT
	db 25, COUNTER ; REVENGE
	db 33, VITAL_THROW
	db 41, SUBMISSION
	db 46, CROSS_CHOP
	db 51, SCARY_FACE
	db 59, DYNAMICPUNCH
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 23, ACID
	db 30, SWEET_SCENT
	db 37, RAZOR_LEAF
	db 45, SLAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 1, WRAP
	db 6, GROWTH
	db 11, WRAP
	db 15, SLEEP_POWDER
	db 17, POISONPOWDER
	db 19, STUN_SPORE
	db 24, ACID
	db 33, SWEET_SCENT
	db 42, RAZOR_LEAF
	db 54, SLAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, SUPERSONIC
	db 12, WRAP ; CONSTRICT
	db 19, ACID
	db 25, BUBBLEBEAM
	db 30, POISON_JAB
	db 36, BARRIER
	db 43, SCREECH
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, WRAP ; CONSTRICT
	db 6, SUPERSONIC
	db 12, WRAP ; CONSTRICT
	db 19, ACID
	db 25, BUBBLEBEAM
	db 30, POISON_JAB
	db 38, BARRIER
	db 47, SCREECH
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 4, THUNDERSHOCK
	db 10, ROLLOUT
	db 12, SPARK
	db 16, ROCK_THROW
	db 18, SLAM
	db 22, THUNDERPUNCH
	db 24, SELFDESTRUCT
	db 30, MAGNITUDE
	db 34, THUNDER_WAVE
	db 36, EXPLOSION
	db 40, DOUBLE_EDGE
	db 42, ROCK_SLIDE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 6, THUNDERSHOCK
	db 12, SPARK
	db 16, ROCK_THROW
	db 18, SLAM
	db 22, THUNDERPUNCH
	db 24, SELFDESTRUCT
	db 30, MAGNITUDE
	db 34, THUNDER_WAVE
	db 44, EXPLOSION
	db 48, DOUBLE_EDGE
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, ROCK_THROW
	db 6, THUNDERSHOCK
	db 12, SPARK
	db 16, ROCK_THROW
	db 18, SLAM
	db 22, THUNDERPUNCH
	db 24, SELFDESTRUCT
	db 30, MAGNITUDE
	db 34, THUNDER_WAVE
	db 44, EXPLOSION
	db 50, DOUBLE_EDGE
	db 60, EARTHQUAKE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, GROWL
	db 9, TAIL_WHIP
	db 14, EMBER
	db 19, STOMP
	db 25, FIRE_SPIN
	db 31, TAKE_DOWN
	db 38, AGILITY
	db 45, HORN_DRILL ; BOUNCE
	db 53, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, EMBER
	db 5, GROWL
	db 9, TAIL_WHIP
	db 14, EMBER
	db 19, STOMP
	db 25, FIRE_SPIN
	db 31, TAKE_DOWN
	db 38, AGILITY
	db 40, FURY_ATTACK
	db 50, HORN_DRILL ; BOUNCE
	db 63, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, TRADE_STONE, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, ZEN_HEADBUTT
	db 43, AMNESIA
	db 48, PSYCHIC_M
	db 51, POWER_GEM
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 1, GROWL
	db 1, WATER_GUN
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, ZEN_HEADBUTT
	db 37, WITHDRAW
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 26, SPARK
	db 32, LOCK_ON
	db 38, FLASH_CANNON
	db 44, SCREECH
	db 50, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
;	db EVOLVE_MAP, GROUP_???, MAP_???, MAGNEZONE
	db EVOLVE_ITEM, THUNDERSTONE, MAGNEZONE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, SUPERSONIC
	db 1, SONICBOOM
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 26, SPARK
	db 30, TRI_ATTACK
	db 35, LOCK_ON
	db 44, FLASH_CANNON
	db 53, SCREECH
	db 62, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 6, SAND_ATTACK
	db 11, LEER
	db 16, FURY_ATTACK
	db 21, BATON_PASS ; KNOCK_OFF
	db 26, MIRROR_MOVE ; FURY_CUTTER
	db 31, SWORDS_DANCE
	db 36, AGILITY
	db 41, SLASH
	db 46, FALSE_SWIPE
	db 50, POISON_JAB
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, RAGE
	db 33, WHIRLWIND ; UPROAR
	db 37, DRILL_PECK
	db 45, AGILITY
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, PURSUIT
	db 1, FURY_ATTACK
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, RAGE
	db 38, WHIRLWIND ; UPROAR
	db 47, DRILL_PECK
	db 60, AGILITY
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 9, GROWL
	db 17, ICY_WIND
	db 21, AURORA_BEAM
	db 29, REST
	db 37, TAKE_DOWN
	db 41, ICE_BEAM
	db 49, SAFEGUARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, ICY_WIND
	db 1, AURORA_BEAM
	db 9, GROWL
	db 17, ICY_WIND
	db 21, AURORA_BEAM
	db 29, REST
	db 34, HORN_DRILL ; SHEER_COLD
	db 42, TAKE_DOWN
	db 51, ICE_BEAM
	db 64, SAFEGUARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE ; POUND
	db 5, HARDEN
	db 10, DISABLE
	db 16, SLUDGE
	db 23, MINIMIZE
	db 31, SCREECH
	db 36, FAINT_ATTACK
	db 40, ACID_ARMOR
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE ; POUND
	db 1, HARDEN
	db 33, HARDEN
	db 37, DISABLE
	db 45, SLUDGE
	db 23, MINIMIZE
	db 31, SCREECH
	db 39, FAINT_ATTACK
	db 45, ACID_ARMOR
	db 60, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 9, SUPERSONIC
	db 17, AURORA_BEAM
	db 25, PROTECT
	db 33, LEER
	db 41, CLAMP
	db 49, ICE_BEAM
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, WITHDRAW
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 33, SPIKES
	db 41, SPIKE_CANNON
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, ASTONISH ; SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 28, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, DARK_PULSE
	db 39, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, ASTONISH ; SPITE
	db 8, ASTONISH ; SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 25, SCARY_FACE ; SHADOW_PUNCH
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, DARK_PULSE
	db 57, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, ASTONISH ; SPITE
	db 8, ASTONISH ; SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 25, SCARY_FACE ; SHADOW_PUNCH
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, DARK_PULSE
	db 57, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 9, WRAP
	db 13, ROCK_THROW
	db 21, HARDEN
	db 25, RAGE
	db 33, SANDSTORM
	db 37, SLAM
	db 45, IRON_TAIL
	db 49, ANCIENTPOWER ; SAND_TOMB
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, HYPNOSIS
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 31, POISON_GAS
	db 36, ZEN_HEADBUTT ; MEDITATE ; TODO
	db 40, PSYCHIC_M
	db 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, HYPNOSIS
	db 1, DISABLE
	db 1, CONFUSION
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 33, POISON_GAS
	db 40, ZEN_HEADBUTT ; MEDITATE ; TODO
	db 49, PSYCHIC_M
	db 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, LEER
	db 12, SCRATCH ; VICEGRIP
	db 16, HARDEN
	db 23, MUD_SLAP ; MUD_SHOT
	db 27, STOMP
	db 34, GUILLOTINE
	db 41, PROTECT
	db 45, CRABHAMMER
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, LEER
	db 1, SCRATCH ; VICEGRIP
	db 5, LEER
	db 12, SCRATCH ; VICEGRIP
	db 16, HARDEN
	db 23, MUD_SLAP ; MUD_SHOT
	db 27, STOMP
	db 38, GUILLOTINE
	db 49, PROTECT
	db 57, CRABHAMMER
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, SCREECH
	db 15, SONICBOOM
	db 21, SPARK
	db 27, SELFDESTRUCT
	db 32, ROLLOUT
	db 37, LIGHT_SCREEN
	db 42, SWIFT
	db 46, EXPLOSION
	db 49, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, SONICBOOM
	db 1, SPARK
	db 8, SCREECH
	db 15, SONICBOOM
	db 21, SPARK
	db 27, SELFDESTRUCT
	db 34, ROLLOUT
	db 41, LIGHT_SCREEN
	db 48, SWIFT
	db 54, EXPLOSION
	db 59, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, LIGHT_SCREEN ; UPROAR
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 31, POISONPOWDER
	db 37, SLEEP_POWDER
	db 43, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, LIGHT_SCREEN ; UPROAR
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 1, LEECH_SEED
	db 17, ASTONISH ; PSYWAVE
	db 29, DRAGON_RAGE
	db 31, EGG_BOMB
	db 40, DRAGONBREATH
	db 47, OUTRAGE
	db 55, WOOD_HAMMER
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, MAGNITUDE ; BONE_CLUB
	db 13, HEADBUTT
	db 17, LEER
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 29, RAGE
	db 33, FALSE_SWIPE
	db 37, THRASH
	db 41, BONE_RUSH
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, TAIL_WHIP
	db 1, MAGNITUDE ; BONE_CLUB
	db 1, FLAME_WHEEL
	db 3, TAIL_WHIP
	db 7, MAGNITUDE ; BONE_CLUB
	db 11, FLAME_WHEEL
	db 13, LEER
	db 21, BONEMERANG
	db 28, SHADOW_BONE
	db 33, THRASH
	db 35, NIGHT_SHADE
	db 39, FALSE_SWIPE
	db 43, STOMP
	db 53, FIRE_SPIN
	db 61, DOUBLE_EDGE
	db 65, BONE_RUSH
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 6, AGILITY
	db 11, SLAM ; ROLLING_KICK ; TODO
	db 16, COUNTER ; JUMP_KICK ; TODO
	db 20, PURSUIT ; BRICK_BREAK
	db 21, FOCUS_ENERGY
	db 26, HI_JUMP_KICK
	db 31, LOCK_ON ; MIND_READER
	db 36, FORESIGHT
	db 41, ENDURE
	db 46, SWORDS_DANCE ; MEGA_KICK ; TODO
	db 51, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 7, AGILITY
	db 13, PURSUIT
	db 20, MACH_PUNCH
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, RAPID_SPIN ; SKY_UPPERCUT
	db 38, POWERUPPUNCH ; MEGA_PUNCH
	db 44, PROTECT ; DETECT
	db 50, COUNTER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db EVOLVE_MOVE, ROLLOUT, LICKILICKY
	db 0 ; no more evolutions
	db 1, LICK
	db 7, SUPERSONIC
	db 13, DEFENSE_CURL
	db 19, STOMP
	db 25, WRAP
	db 31, DISABLE
	db 33, ROLLOUT
	db 37, SLAM
	db 43, SCREECH
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 33, HAZE
	db 41, EXPLOSION
	db 45, DESTINY_BOND
	db 49, PSYBEAM ; MEMENTO
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 1, SMOG
	db 1, SELFDESTRUCT
	db 9, SMOG
	db 17, SELFDESTRUCT
	db 21, SLUDGE
	db 25, SMOKESCREEN
	db 33, HAZE
	db 39, ROCK_BLAST
	db 44, EXPLOSION
	db 51, DESTINY_BOND
	db 58, PSYBEAM ; MEMENTO
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 10, STOMP
	db 15, FURY_ATTACK
	db 24, SCARY_FACE
	db 29, ROCK_BLAST
	db 38, DOUBLE_EDGE
	db 53, TAKE_DOWN
	db 52, EARTHQUAKE
	db 57, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, RHYPERIOR
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 1, STOMP
	db 1, FURY_ATTACK
	db 10, STOMP
	db 15, FURY_ATTACK
	db 24, SCARY_FACE
	db 29, ROCK_BLAST
	db 38, DOUBLE_EDGE
	db 46, TAKE_DOWN
	db 58, EARTHQUAKE
	db 66, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, HEAL_BELL ; REFRESH
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 29, SING
	db 35, EGG_BOMB
	db 41, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db EVOLVE_MOVE, ANCIENTPOWER, TANGROWTH
	db 0 ; no more evolutions
	db 1, TACKLE ; CONSTRICT
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, GROWTH
	db 19, POISONPOWDER
	db 22, VINE_WHIP
	db 28, WRAP
	db 31, STUN_SPORE
	db 37, GIGA_DRAIN ; MEGA_DRAIN
	db 40, ANCIENTPOWER
	db 46, SLAM
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, LEER
	db 7, BITE
	db 13, TAIL_WHIP
	db 19, ASTONISH ; FAKE_OUT
	db 25, MACH_PUNCH ; MEGA_PUNCH
	db 31, RAGE
	db 37, ENDURE
	db 43, DIZZY_PUNCH
	db 49, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 8, SMOKESCREEN
	db 15, LEER
	db 22, WATER_GUN
	db 29, DRAGONBREATH ; TWISTER
	db 36, AGILITY
	db 43, HYDRO_PUMP
	db 50, OUTRAGE ; DRAGON_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 1, WATER_GUN
	db 8, SMOKESCREEN
	db 15, LEER
	db 22, WATER_GUN
	db 29, DRAGONBREATH ; TWISTER
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 62, OUTRAGE ; DRAGON_DANCE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 38, WATERFALL
	db 43, HORN_DRILL
	db 52, AGILITY
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 1, TAIL_WHIP
	db 10, SUPERSONIC
	db 15, HORN_ATTACK
	db 24, FLAIL
	db 29, FURY_ATTACK
	db 41, WATERFALL
	db 49, HORN_DRILL
	db 61, AGILITY
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 6, WATER_GUN
	db 10, RAPID_SPIN
	db 15, RECOVER
	db 19, MINIMIZE ; CAMOUFLAGE
	db 24, SWIFT
	db 28, BUBBLEBEAM
	db 33, POWER_GEM
	db 37, LIGHT_SCREEN
	db 42, TRI_ATTACK ; COSMIC_POWER
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, SWIFT
	db 37, CONFUSE_RAY
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 16, AMNESIA ; MEDITATE
	db 21, DOUBLESLAP
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 31, ENCORE
	db 36, PSYBEAM
	db 41, BATON_PASS
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, WING_ATTACK
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, LICK
	db 1, SWEET_KISS ; LOVELY_KISS
	db 1, ICY_WIND ; POWDER_SNOW
	db 5, SWEET_KISS ; LOVELY_KISS
	db 8, HYPNOSIS
	db 13, ICY_WIND ; POWDER_SNOW
	db 21, DOUBLESLAP
	db 25, ICE_PUNCH
	db 35, MEAN_LOOK
	db 41, CHARM ; FAKE_TEARS
	db 51, BODY_SLAM
	db 57, PERISH_SONG
	db 67, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, ELECTIVIRE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERPUNCH
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 36, SCREECH
	db 47, THUNDERBOLT
	db 58, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db EVOLVE_ITEM, TRADE_STONE, MAGMORTAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, SMOG
	db 1, FIRE_PUNCH
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 33, SUNNY_DAY
	db 41, FLAMETHROWER
	db 49, CONFUSE_RAY
	db 57, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH ; VICEGRIP
	db 1, FOCUS_ENERGY
	db 7, WRAP
	db 13, SEISMIC_TOSS
	db 19, HARDEN
	db 25, COUNTER ; REVENGE
	db 31, VITAL_THROW ; BRICK_BREAK
	db 37, GUILLOTINE
	db 43, SUBMISSION
	db 49, SWORDS_DANCE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, RAGE
	db 13, HORN_ATTACK
	db 19, SCARY_FACE
	db 26, PURSUIT
	db 34, REST
	db 39, ZEN_HEADBUTT
	db 43, THRASH
	db 53, TAKE_DOWN
	db 60, GIGA_IMPACT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 20, BITE
	db 25, DRAGON_RAGE
	db 30, LEER
	db 35, DRAGONBREATH ; TWISTER
	db 40, HYDRO_PUMP
	db 45, RAIN_DANCE
	db 50, OUTRAGE ; DRAGON_DANCE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 8, SURF
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, RAIN_DANCE
	db 50, SAFEGUARD
	db 57, HYDRO_PUMP
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_ITEM, SHINY_STONE, SYLVEON
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
    db EVOLVE_MAP, GROUP_MT_NAVEL_ICE_ROCK, MAP_MT_NAVEL_ICE_ROCK, GLACEON
;   db EVOLVE_MAP, GROUP_BUTWAL_MOSSY_GROTTO, MAP_BUTWAL_MOSSY_GROTTO, LEAFEON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, GROWL
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, BATON_PASS
	db 42, TAKE_DOWN
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, WATER_GUN
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, AURORA_BEAM
	db 42, HAZE
	db 47, ACID_ARMOR
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, THUNDERSHOCK
	db 23, QUICK_ATTACK
	db 30, DOUBLE_KICK
	db 36, PIN_MISSILE
	db 42, THUNDER_WAVE
	db 47, AGILITY
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, EMBER
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, FIRE_SPIN
	db 42, SMOG
	db 47, LEER
	db 52, FLAMETHROWER
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, GROWTH ; SHARPEN
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, BITE ; CONSTRICT
	db 1, WITHDRAW
	db 13, WRAP
	db 19, WATER_GUN
	db 25, MUD_SLAP ; MUD_SHOT
	db 31, LEER
	db 37, PROTECT
	db 43, AURORA_BEAM ; TICKLE
	db 49, ANCIENTPOWER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE ; CONSTRICT
	db 1, WITHDRAW
	db 1, WRAP
	db 13, WRAP
	db 19, WATER_GUN
	db 25, MUD_SLAP ; MUD_SHOT
	db 31, LEER
	db 37, PROTECT
	db 40, SPIKE_CANNON
	db 46, AURORA_BEAM ; TICKLE
	db 55, ANCIENTPOWER
	db 65, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 13, ABSORB
	db 19, LEER
	db 25, MUD_SLAP ; MUD_SHOT
	db 31, SAND_ATTACK
	db 37, ENDURE
	db 43, SCREECH ; METAL_SOUND
	db 49, GIGA_DRAIN ; MEGA_DRAIN
	db 55, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, ABSORB
	db 13, ABSORB
	db 19, LEER
	db 25, MUD_SLAP ; MUD_SHOT
	db 31, SAND_ATTACK
	db 37, ENDURE
	db 40, SLASH
	db 46, SCREECH ; METAL_SOUND
	db 55, GIGA_DRAIN ; MEGA_DRAIN
	db 65, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
	db 15, BITE
	db 22, SUPERSONIC
	db 29, ANCIENTPOWER
	db 36, SCARY_FACE
	db 43, TAKE_DOWN
	db 47, GIGA_IMPACT
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, AMNESIA
	db 15, DEFENSE_CURL
	db 22, BELLY_DRUM
	db 29, HEADBUTT
	db 36, SLEEP_TALK ; SNORE
	db 36, REST
	db 43, BODY_SLAM
	db 50, ROLLOUT
	db 57, HYPER_BEAM
	db 65, ROCK_SLIDE
	db 73, GIGA_IMPACT
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, ICY_WIND ; POWDER_SNOW
	db 13, MIST
	db 25, AGILITY
	db 37, LOCK_ON ; MIND_READER
	db 49, ICE_BEAM
	db 61, REFLECT
	db 73, SKY_ATTACK ; BLIZZARD
	db 85, BLIZZARD ; SHEER_COLD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, AGILITY
	db 37, PROTECT ; DETECT
	db 49, DRILL_PECK
	db 61, LIGHT_SCREEN ; CHARGE
	db 73, SKY_ATTACK
	db 85, THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 37, ENDURE
	db 49, FLAMETHROWER
	db 61, SAFEGUARD
	db 73, SKY_ATTACK ; HEAT_WAVE
	db 85, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 15, DRAGONBREATH ; TWISTER
	db 21, DRAGON_RAGE
	db 25, SLAM
	db 31, AGILITY
	db 35, DRAGON_TAIL
	db 43, SAFEGUARD
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, DRAGONBREATH ; TWISTER
	db 8, THUNDER_WAVE
	db 15, DRAGONBREATH ; TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 56, OUTRAGE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, DRAGONBREATH ; TWISTER
	db 8, THUNDER_WAVE
	db 15, DRAGONBREATH ; TWISTER
	db 21, DRAGON_RAGE
	db 25, SLAM
	db 31, AGILITY
	db 35, DRAGON_TAIL
	db 47, SAFEGUARD
	db 55, WING_ATTACK
	db 61, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 11, BARRIER
	db 22, SWIFT
	db 33, SAFEGUARD ; PSYCH_UP
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, PSYSTRIKE ; SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 10, TRANSFORM
	db 20, HEADBUTT ; MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, ANCIENTPOWER
	db 0 ; no more level-up moves

TropiusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, LEER
	db 1, GUST
	db 1, VINE_WHIP
	db 6, SWEET_SCENT
	db 10, STOMP
	db 16, RAZOR_LEAF
	db 21, WHIRLWIND
	db 29, WING_ATTACK
	db 36, SLASH
	db 41, BODY_SLAM
	db 50, SYNTHESIS
	db 56, SOLARBEAM
	db 61, SKY_ATTACK
	db 0 ; no more level-up moves

KecleonEvosAttacks:
	db 0 ; no more evolutions
	db 1, THIEF
	db 1, TAIL_WHIP
	db 1, LICK
	db 1, SCRATCH
	db 4, WRAP
	db 7, FAINT_ATTACK
	db 10, FURY_SWIPES
	db 14, MINIMIZE
	db 18, PSYBEAM
	db 22, DOUBLE_TEAM
	db 27, SLASH
	db 32, SHADOW_CLAW
	db 38, SCREECH
	db 42, SUBSTITUTE
	db 48, DOUBLE_KICK
	db 56, ANCIENTPOWER
	db 0 ; no more level-up moves

ChatotEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, GROWL
	db 9, MIRROR_MOVE
	db 13, SING
	db 17, FURY_ATTACK
	db 21, WING_ATTACK
	db 25, SUPERSONIC
	db 33, STEEL_WING
	db 37, DRILL_PECK
	db 41, REST
	db 46, AERIAL_ACE
	db 55, SKY_ATTACK
	db 0 ; no more level-up moves

PikipekEvosAttacks:
	db EVOLVE_LEVEL, 14, TRUMBEAK
	db 0 ; no more evolutions
	db 1, PECK
	db 3, GROWL
	db 7, WING_ATTACK
	db 9, BULLET_SEED
	db 13, SUPERSONIC
	db 21, FURY_ATTACK
	db 25, SCREECH
	db 31, QUICK_ATTACK
	db 37, DRILL_PECK
	db 0 ; no more level-up moves

TrumbeakEvosAttacks:
	db EVOLVE_LEVEL, 28, TOUCANNON
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, ROCK_BLAST
	db 3, GROWL
	db 7, WING_ATTACK
	db 9, BULLET_SEED
	db 13, SUPERSONIC
	db 24, FURY_ATTACK
	db 29, SCREECH
	db 37, QUICK_ATTACK
	db 45, DRILL_PECK
	db 0 ; no more level-up moves

ToucannonEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, ROCK_BLAST
	db 3, GROWL
	db 7, WING_ATTACK
	db 9, BULLET_SEED
	db 13, SUPERSONIC
	db 24, FURY_ATTACK
	db 28, SKY_ATTACK ;BEAK BLAST?
	db 30, SCREECH
	db 40, QUICK_ATTACK
	db 50, DRILL_PECK
	db 0 ; no more level-up moves

MunchlaxEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, AMNESIA
	db 12, DEFENSE_CURL
	db 16, BELLY_DRUM
	db 22, HEADBUTT
	db 26, SLEEP_TALK ; SNORE
	db 29, REST
	db 36, BODY_SLAM
	db 40, ROLLOUT
	db 47, HYPER_BEAM
	db 0 ; no more level-up moves

RockruffEvosAttacks:
	db EVOLVE_LEVEL, 25, LYCANROC
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, LEER
	db 4, SAND_ATTACK
	db 7, BITE
	db 12, MUD_SLAP
	db 15, ROCK_THROW
	db 18, FORESIGHT
	db 23, ROCK_BLAST
	db 26, ROAR
	db 31, ROCK_SLIDE
	db 34, SCARY_FACE
	db 37, CRUNCH
	db 42, EARTH_POWER
	db 45, FISSURE
	db 0 ; no more level-up moves

LycanrocEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, TACKLE ; POUND
	db 1, LEER
	db 4, SAND_ATTACK
	db 7, BITE
	db 12, MUD_SLAP
	db 15, ROCK_THROW
	db 18, FORESIGHT
	db 23, ROCK_BLAST
	db 25, ACCELEROCK
	db 29, ROAR
	db 34, ROCK_SLIDE
	db 37, SCARY_FACE
	db 40, CRUNCH
	db 45, EARTH_POWER
	db 48, FISSURE
	db 0 ; no more level-up moves

WingullEvosAttacks:
	db EVOLVE_LEVEL, 25, PELIPPER
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, WATER_GUN
	db 7, SUPERSONIC
	db 13, WING_ATTACK
	db 21, MIST
	db 31, QUICK_ATTACK
	db 43, PURSUIT
	db 55, AGILITY
	db 0 ; no more level-up moves

PelipperEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, WATER_GUN
	db 1, WING_ATTACK
	db 3, WATER_GUN
	db 7, SUPERSONIC
	db 13, WING_ATTACK
	db 21, MIST
	db 25, PROTECT
	db 42, HYDRO_PUMP
	db 0 ; no more level-up moves

ChinglingEvosAttacks:
	db EVOLVE_HAPPINESS, TR_NITE, CHIMECHO
	db 0 ; no more evolutions
	db 1, WRAP
	db 4, GROWL
	db 7, ASTONISH
	db 10, CONFUSION
	db 13, HYPNOSIS
	db 16, FAIRY_WIND
	db 21, PSYBEAM
	db 29, MOONBLAST
	db 0 ; no more level-up moves

ChimechoEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 4, GROWL
	db 7, ASTONISH
	db 10, CONFUSION
	db 13, HYPNOSIS
	db 19, TAKE_DOWN
	db 25, PSYBEAM
	db 32, MOONBLAST
	db 37, SAFEGUARD
	db 42, DOUBLE_EDGE
	db 52, HEAL_BELL
	db 0 ; no more level-up moves

SalanditEvosAttacks:
	db EVOLVE_FEMALE, 33, SALAZZLE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, POISON_GAS
	db 5, EMBER
	db 8, SWEET_SCENT
	db 13, DRAGON_RAGE
	db 21, DOUBLESLAP
	db 24, FLAME_WHEEL
	db 29, TOXIC
	db 32, NASTY_PLOT
	db 37, VENOSHOCK
	db 40, FLAMETHROWER
	db 45, ACID
	db 48, DRAGON_PULSE
	db 0 ; no more level-up moves

SalazzleEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, DISABLE
	db 5, EMBER
	db 8, SWEET_SCENT
	db 13, DRAGON_RAGE
	db 16, SMOG
	db 21, DOUBLESLAP
	db 24, FLAME_WHEEL
	db 29, TOXIC
	db 32, NASTY_PLOT
	db 39, VENOSHOCK
	db 44, FLAMETHROWER
	db 51, ACID
	db 56, DRAGON_PULSE
	db 0 ; no more level-up moves

FinneonEvosAttacks:
	db EVOLVE_LEVEL, 31, LUMINEON
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 6, WATER_GUN
	db 10, ATTRACT
	db 13, RAIN_DANCE
	db 17, GUST
	db 22, WATER_PULSE
	db 26, CHARM
	db 29, SAFEGUARD
	db 33, BUBBLEBEAM
	db 38, WHIRLPOOL
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

LumineonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 6, WATER_GUN
	db 10, ATTRACT
	db 13, RAIN_DANCE
	db 17, GUST
	db 24, WATER_PULSE
	db 29, CHARM
	db 33, SAFEGUARD
	db 37, BUBBLEBEAM
	db 42, WHIRLPOOL
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, ABSORB
	db 1, SUPERSONIC
	db 1, ASTONISH
	db 6, SUPERSONIC
	db 11, ASTONISH
	db 16, BITE
	db 21, WING_ATTACK
	db 28, CONFUSE_RAY
	db 35, AERIAL_ACE ; AIR_CUTTER
	db 42, MEAN_LOOK
	db 49, LEECH_LIFE
	db 56, HAZE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 5, SUPERSONIC
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 29, CONFUSE_RAY
	db 37, TAKE_DOWN
	db 41, HYDRO_PUMP
	db 49, THUNDERBOLT ; CHARGE
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 1, SUPERSONIC
	db 5, SUPERSONIC
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 32, CONFUSE_RAY
	db 43, TAKE_DOWN
	db 50, HYDRO_PUMP
	db 61, THUNDERBOLT ; CHARGE
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 13, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, TACKLE ; POUND
	db 14, SWEET_KISS
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db EVOLVE_ITEM, SHINY_STONE, TOGEKISS
	db 0
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 21, FAIRY_WIND
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 21, FAIRY_WIND
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 42, SKY_ATTACK
	db 47, EXTREMESPEED
	db 52, MOONBLAST
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, WATER_GUN
	db 2, TAIL_WHIP
	db 7, BUBBLE
	db 10, CHARM
	db 13, BUBBLEBEAM
	db 16, ENCORE
	db 20, SLAM
	db 23, BATON_PASS
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 23, COTTON_SPORE
	db 30, LIGHT_SCREEN
	db 33, POWER_GEM
	db 37, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, COTTON_SPORE
	db 36, LIGHT_SCREEN
	db 40, POWER_GEM
	db 45, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, COTTON_SPORE
	db 30, THUNDERPUNCH
	db 39, SIGNAL_BEAM
	db 49, LIGHT_SCREEN
	db 57, POWER_GEM
	db 67, THUNDER
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, RAZOR_LEAF ; MAGICAL_LEAF
	db 44, PETAL_DANCE
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 24, BUBBLEBEAM
	db 27, PLAY_ROUGH
	db 32, DOUBLE_EDGE
	db 37, RAIN_DANCE
	db 42, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 24, BUBBLEBEAM
	db 27, PLAY_ROUGH
	db 33, DOUBLE_EDGE
	db 40, RAIN_DANCE
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

MimeJrEvosAttacks:
	db EVOLVE_MOVE, MIMIC, MR__MIME
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, CONFUSION
	db 4, MIRROR_MOVE
	db 8, NASTY_PLOT
	db 11, DOUBLESLAP
	db 15, MIMIC
	db 18, ENCORE
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 25, PSYBEAM
	db 29, SUBSTITUTE
	db 32, RECOVER
	db 39, PSYCHIC_M
	db 46, BATON_PASS
	db 50, SAFEGUARD
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 35, PERISH_SONG
	db 51, SWAGGER
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SPLASH
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 11, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, COTTON_SPORE
	db 30, GIGA_DRAIN ; MEGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, TACKLE
	db 1, FAIRY_WIND
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 11, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 29, COTTON_SPORE
	db 36, GIGA_DRAIN ; MEGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, TACKLE
	db 1, FAIRY_WIND
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 11, FAIRY_WIND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 33, COTTON_SPORE
	db 44, GIGA_DRAIN ; MEGA_DRAIN
	db 0 ; no more level-up moves

StunfiskEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 5, ASTONISH ; BIDE
	db 9, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 17, BUBBLE
	db 21, WATER_GUN
	db 25, SPARK
	db 30, ENDURE
	db 40, THUNDERBOLT
	db 55, FLAIL
	db 61, FISSURE
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 6, GROWTH
	db 13, LEECH_SEED
	db 18, MORNING_SUN ; INGRAIN
	db 25, BULLET_SEED ; ENDEAVOR
	db 30, SUNNY_DAY
	db 37, SYNTHESIS
	db 42, GIGA_DRAIN ; MEGA_DRAIN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, TACKLE ; POUND
	db 6, GROWTH
	db 13, RAZOR_LEAF
	db 18, MORNING_SUN ; INGRAIN
	db 25, BULLET_SEED
	db 30, SUNNY_DAY
	db 37, PETAL_DANCE
	db 42, SOLARBEAM
	db 0 ; no more level-up moves

LeafeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAZOR_LEAF
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 9, SWEET_KISS
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, BATON_PASS
	db 25, GIGA_DRAIN
	db 29, SWORDS_DANCE
	db 33, SYNTHESIS
	db 37, SUNNY_DAY
	db 41, RAZOR_LEAF
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

GlaceonEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 9, SWEET_KISS
	db 13, QUICK_ATTACK
	db 17, BITE
	db 20, ICY_WIND
	db 25, ICE_BEAM
	db 29, BATON_PASS
	db 33, MIRROR_COAT
	db 37, HAIL
	db 41, ICY_WIND
	db 45, BLIZZARD
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, SAND_ATTACK
	db 9, SWEET_KISS
	db 13, QUICK_ATTACK
	db 17, SWIFT
	db 20, FAIRY_WIND
	db 25, BITE
	db 29, BATON_PASS
	db 33, LIGHT_SCREEN
	db 37, MOONBLAST
	db 41, FAIRY_WIND
	db 45, DAZZLINGLEAM
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, CONFUSION
	db 23, QUICK_ATTACK
	db 30, SWIFT
	db 36, PSYBEAM
	db 42, NASTY_PLOT ; PSYCH_UP
	db 47, PSYCHIC_M
	db 52, MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, PURSUIT
	db 23, QUICK_ATTACK
	db 30, CONFUSE_RAY
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 47, SCREECH
	db 52, MOONLIGHT
	db 0 ; no more level-up moves

RelicanthEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 8, WATER_GUN
	db 15, ROCK_THROW
	db 22, REST
	db 29, TAKE_DOWN
	db 43, ROCK_SLIDE
	db 50, HYDRO_PUMP
	db 54, ANCIENTPOWER
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, ZEN_HEADBUTT
	db 43, SWAGGER
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

MimikyuEvosAttacks:
	db 0 ; no more evolutions
	db 1, WOOD_HAMMER
	db 1, SCRATCH
	db 1, ASTONISH
	db 1, MIMIC
	db 5, DOUBLE_TEAM
	db 10, SWEET_KISS
	db 14, SHADOW_SNEAK
	db 19, MIMIC
	db 23, FAINT_ATTACK
	db 28, PLAY_ROUGH
	db 32, SLASH
	db 37, SHADOW_CLAW
	db 41, NASTY_PLOT
	db 45, SHADOW_SNEAK
	db 0 ; no more level-up moves

SpindaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, MIMIC
	db 10, FAINT_ATTACK
	db 14, PSYBEAM
	db 19, HYPNOSIS
	db 23, DIZZY_PUNCH
	db 28, COMET_PUNCH
	db 32, SWEET_KISS
	db 37, HEADBUTT
	db 41, ASTONISH
	db 46, DOUBLE_EDGE
	db 50, FLAIL
	db 55, THRASH
	db 0 ; no more level-up moves

SkrelpEvosAttacks:
	db EVOLVE_LEVEL, 48, DRAGALGE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SMOKESCREEN
	db 1, WATER_GUN
	db 5, FAINT_ATTACK
	db 9, TAIL_WHIP
	db 12, BUBBLE
	db 15, ACID
	db 19, MINIMIZE
	db 25, WATER_PULSE
	db 32, TOXIC
	db 35, DRAGON_RAGE
	db 42, HYDRO_PUMP
	db 49, DRAGON_PULSE
	db 0 ; no more level-up moves

DragalgeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SMOKESCREEN
	db 1, WATER_GUN
	db 1, DRAGON_TAIL
	db 5, FAINT_ATTACK
	db 9, TAIL_WHIP
	db 12, BUBBLE
	db 15, ACID
	db 19, MINIMIZE
	db 25, WATER_PULSE
	db 32, TOXIC
	db 35, DRAGON_RAGE
	db 42, HYDRO_PUMP
	db 48, DRAGON_TAIL
	db 53, DRAGON_PULSE
	db 59, OUTRAGE
	db 0 ; no more level-up moves

TrapinchEvosAttacks:
	db EVOLVE_LEVEL, 35, VIBRAVA
	db 0 ; no more evolutions
	db 1, SAND_ATTACK
	db 1, BITE
	db 1, FAINT_ATTACK
	db 5, MUD_SLAP
	db 8, MEAN_LOOK
	db 12, MAGNITUDE
	db 15, ROCK_SLIDE
	db 19, DIG
	db 22, CRUNCH
	db 26, MEAN_LOOK
	db 29, FAINT_ATTACK
	db 33, EARTH_POWER
	db 36, SANDSTORM
	db 40, ANCIENTPOWER
	db 43, HYPER_BEAM
	db 47, FISSURE
	db 0 ; no more level-up moves

VibravaEvosAttacks:
	db EVOLVE_LEVEL, 45, FLYGON
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 1, SAND_ATTACK
	db 1, FAINT_ATTACK
	db 1, DRAGON_RAGE
	db 5, MUD_SLAP
	db 8, ROCK_BLAST
	db 12, MAGNITUDE
	db 15, ROCK_SLIDE
	db 19, SUPERSONIC
	db 22, SCREECH
	db 26, ANCIENTPOWER
	db 29, DRAGONBREATH
	db 33, EARTH_POWER
	db 36, SANDSTORM
	db 43, HYPER_BEAM
	db 45, DRAGON_PULSE
	db 50, EARTHQUAKE
	db 58, FISSURE
	db 0 ; no more level-up moves

FlygonEvosAttacks:
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 1, SAND_ATTACK
	db 1, FAINT_ATTACK
	db 1, DRAGON_RAGE
	db 7, FAINT_ATTACK
	db 10, MAGNITUDE
	db 13, MUD_SLAP
	db 17, ROCK_BLAST
	db 25, ROCK_SLIDE
	db 29, SUPERSONIC
	db 34, SCREECH
	db 35, DRAGONBREATH
	db 39, ANCIENTPOWER
	db 45, DRAGON_TAIL
	db 49, HYPER_BEAM
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

TurtonatorEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TACKLE
	db 1, WITHDRAW
	db 5, SMOG
	db 9, PROTECT
	db 13, SMOKESCREEN
	db 17, FLAIL
	db 21, ENDURE
	db 25, DRAGON_RAGE
	db 29, FLAMETHROWER
	db 33, BODY_SLAM
	db 37, FLAME_WHEEL
	db 41, DRAGON_PULSE
	db 45, SHELL_TRAP
	db 49, FIRE_BLAST
	db 53, EXPLOSION
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 9, WRAP
	db 13, ROCK_THROW
	db 21, HARDEN
	db 25, RAGE
	db 33, SANDSTORM
	db 37, SLAM
	db 45, IRON_TAIL
	db 49, CRUNCH
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

WailmerEvosAttacks:
	db EVOLVE_LEVEL, 40, WAILORD
	db 0 ; no more evolutions
	db 1, SPLASH
	db 4, GROWL
	db 7, WATER_GUN
	db 11, ROLLOUT
	db 17, DEFENSE_CURL
	db 24, MIST
	db 27, REST
	db 32, SLAM
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves

WailordEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 4, GROWL
	db 7, WATER_GUN
	db 11, ROLLOUT
	db 17, DEFENSE_CURL
	db 24, MIST
	db 27, REST
	db 32, SLAM
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 10, HARDEN
	db 10, MINIMIZE
	db 19, WATER_GUN
	db 28, PIN_MISSILE
	db 33, POISON_JAB
	db 37, TAKE_DOWN
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, METAL_CLAW
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLOUT ; CONSTRICT
	db 1, WITHDRAW
	db 9, WRAP
	db 14, ENCORE
	db 23, SAFEGUARD
	db 28, PROTECT
	db 37, REST
	db 0 ; no more level-up moves

MareanieEvosAttacks:
	db EVOLVE_LEVEL, 38, TOXAPEX
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, PECK
	db 9, BITE
	db 13, SPIKES
	db 17, POISON_JAB
	db 21, TOXIC
	db 29, SPIKE_CANNON
	db 33, RECOVER
	db 39, VENOSHOCK
	db 45, PIN_MISSILE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

ToxapexEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 5, PECK
	db 9, BITE
	db 13, SPIKES
	db 17, POISON_JAB
	db 21, TOXIC
	db 29, SPIKE_CANNON
	db 33, RECOVER
	db 38, SLUDGE_BOMB
	db 44, VENOSHOCK
	db 51, PIN_MISSILE
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

SandygastEvosAttacks:
	db EVOLVE_LEVEL, 42, PALOSSAND
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, ABSORB
	db 5, ASTONISH
	db 9, SAND_ATTACK
	db 14, MUD_SLAP
	db 21, MAGNITUDE ; MEGA_DRAIN
	db 27, HYPNOSIS
	db 32, DIG
	db 36, GIGA_DRAIN
	db 41, SHADOW_BALL
	db 49, EARTH_POWER
	db 54, SANDSTORM
	db 0 ; no more level-up moves

PalossandEvosAttacks:
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, ABSORB
	db 5, ASTONISH
	db 9, SAND_ATTACK
	db 14, MUD_SLAP
	db 21, MAGNITUDE ; MEGA_DRAIN
	db 27, HYPNOSIS
	db 32, DIG
	db 36, GIGA_DRAIN
	db 41, SHADOW_BALL
	db 53, EARTH_POWER
	db 60, SANDSTORM
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 43, ROCK_SLIDE
	db 50, BODY_SLAM
	db 56, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 48, ROCK_SLIDE
	db 60, BODY_SLAM
	db 70, EARTH_POWER
	db 0 ; no more level-up moves

CarvanhaEvosAttacks:
	db EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 7, RAGE
	db 13, FOCUS_ENERGY
	db 16, SCARY_FACE
	db 22, CRUNCH
	db 28, SCREECH
	db 31, TAKE_DOWN
	db 37, SWAGGER
	db 43, AGILITY
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

SharpedoEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, RAGE
	db 1, FOCUS_ENERGY
	db 7, RAGE
	db 13, FOCUS_ENERGY
	db 16, SCARY_FACE
	db 22, CRUNCH
	db 28, SCREECH
	db 33, SLASH
	db 38, SWORDS_DANCE
	db 43, SWAGGER
	db 48, AGILITY
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, HARDEN
	db 12, BUBBLE
	db 17, RECOVER
	db 23, BUBBLEBEAM
	db 28, SPIKE_CANNON
	db 34, ROCK_BLAST
	db 39, MIRROR_COAT
	db 45, ANCIENTPOWER
	db 51, POWER_GEM
	db 60, EARTH_POWER
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, LOCK_ON
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 33, FOCUS_ENERGY
	db 44, ICE_BEAM
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, WRAP ; CONSTRICT
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 25, OCTAZOOKA
	db 38, FOCUS_ENERGY
	db 54, ICE_BEAM
	db 70, HYPER_BEAM
	db 0 ; no more level-up moves

MantykeEvosAttacks:
	db EVOLVE_ALONGSIDE, REMORAID, MANTINE
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, BUBBLE
	db 3, SUPERSONIC
	db 7, BUBBLEBEAM
	db 11, CONFUSE_RAY
	db 14, WING_ATTACK
	db 16, HEADBUTT
	db 19, WATER_GUN
	db 23, DEFENSE_CURL
	db 27, TAKE_DOWN
	db 32, AGILITY
	db 37, ROLLOUT
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 10, SUPERSONIC
	db 18, BUBBLEBEAM
	db 25, TAKE_DOWN
	db 32, AGILITY
	db 40, WING_ATTACK
	db 49, CONFUSE_RAY
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 10, SAND_ATTACK
	db 13, SWIFT
	db 16, AGILITY
	db 26, FURY_ATTACK
	db 29, AERIAL_ACE ; AIR_CUTTER
	db 32, STEEL_WING
	db 42, SPIKES
	db 49, DRILL_PECK ; METAL_SOUND
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 1, SMOG
	db 1, LEER
	db 5, EMBER
	db 8, SMOKESCREEN
	db 12, FAINT_ATTACK
	db 15, FIRE_SPIN
	db 22, FLAME_WHEEL
	db 26, CONFUSE_RAY
	db 29, FIRE_PUNCH
	db 42, SUNNY_DAY
	db 49, FLAMETHROWER
	db 55, FIRE_BLAST
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 5, THUNDERSHOCK
	db 8, LOW_KICK
	db 12, SWIFT
	db 15, SPARK
	db 19, THUNDER_WAVE
	db 26, LIGHT_SCREEN
	db 29, THUNDERPUNCH
	db 36, RAIN_DANCE
	db 42, SCREECH
	db 49, THUNDERBOLT
	db 52, GIGA_IMPACT
	db 55, THUNDER
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 1, WATER_GUN
	db 8, SMOKESCREEN
	db 15, LEER
	db 22, WATER_GUN
	db 29, DRAGONBREATH ; TWISTER
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 62, OUTRAGE ; DRAGON_DANCE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, FLAIL
	db 25, TAKE_DOWN
	db 33, ROLLOUT
	db 41, ENDURE
	db 49, DOUBLE_EDGE
	db 53, GIGA_IMPACT
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, FLAIL
	db 25, FURY_ATTACK
	db 33, ROLLOUT
	db 41, RAPID_SPIN
	db 49, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db EVOLVE_ITEM, DUBIOUS_DISC, PORYGON_Z
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

PorygonZEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 5, ZAP_CANNON
	db 7, PSYBEAM
	db 12, AGILITY
	db 18, RECOVER
	db 23, NASTY_PLOT
	db 29, SIGNAL_BEAM
	db 34, ASTONISH
	db 40, SPARK
	db 45, LOCK_ON
	db 50, TRI_ATTACK
	db 56, MIRROR_COAT
	db 62, ZAP_CANNON
	db 67, HYPER_BEAM
	db 0 ; no more level-up moves

LickilickyEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 5, SUPERSONIC
	db 9, DEFENSE_CURL
	db 17, WRAP
	db 21, STOMP
	db 25, DISABLE
	db 29, SLAM
	db 33, ROLLOUT
	db 37, BODY_SLAM
	db 45, RECOVER
	db 49, SCREECH
	db 55, BELLY_DRUM
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK ; ROLLING_KICK
	db 7, FOCUS_ENERGY
	db 13, PURSUIT
	db 19, QUICK_ATTACK
	db 20, TRIPLE_KICK
	db 25, RAPID_SPIN
	db 31, COUNTER
	db 37, AGILITY
	db 43, PROTECT ; DETECT
	db 49, MIRROR_COAT ; ENDEAVOR
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, LICK
	db 9, SWEET_KISS
	db 13, ICY_WIND ; POWDER_SNOW
	db 21, CONFUSION
	db 25, SING
	db 33, MEAN_LOOK
	db 37, CHARM ; FAKE_TEARS
	db 45, PSYCHIC_M
	db 49, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 33, SCREECH
	db 41, THUNDERBOLT
	db 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

HappinyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_MORNDAY, CHANSEY
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 1, CHARM
	db 5, MIMIC
	db 9, RECOVER
	db 12, SWEET_KISS
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE ; POUND
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, SOFTBOILED
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 23, SING
	db 28, EGG_BOMB
	db 33, DEFENSE_CURL
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

CutieflyEvosAttacks:
	db EVOLVE_LEVEL, 25, RIBOMBEE
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, FAIRY_WIND
	db 7, STUN_SPORE
	db 10, BUG_BITE
	db 13, CHARM
	db 16, SWEET_KISS
	db 21, SWEET_SCENT
	db 26, DAZZLINGLEAM
	db 31, GIGA_DRAIN ; MEGA_DRAIN
	db 36, LEECH_LIFE
	db 41, SWORDS_DANCE
	db 0 ; no more level-up moves

RibombeeEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, FAIRY_WIND
	db 7, STUN_SPORE
	db 10, BUG_BITE
	db 13, CHARM
	db 16, SWEET_KISS
	db 21, SWEET_SCENT
	db 25, COTTON_SPORE
	db 28, DAZZLINGLEAM
	db 35, GIGA_DRAIN ; MEGA_DRAIN
	db 42, LEECH_LIFE
	db 45, COTTON_SPORE
	db 49, SWORDS_DANCE
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP ; CONSTRICT
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, GROWTH
	db 19, POISONPOWDER
	db 22, VINE_WHIP
	db 28, WRAP
	db 31, STUN_SPORE
	db 37, GIGA_DRAIN
	db 40, ANCIENTPOWER
	db 46, SLAM
	db 49, BULLET_SEED
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, STOMP
	db 1, SANDSTORM
	db 10, STOMP
	db 15, SANDSTORM
	db 24, SCREECH
	db 29, THRASH
	db 38, DOUBLE_EDGE
	db 46, ROCK_SLIDE
	db 58, EARTHQUAKE
	db 66, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 1, SUPERSONIC
	db 1, SONICBOOM
	db 6, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 26, SPARK
	db 30, TRI_ATTACK
	db 35, LOCK_ON
	db 44, FLASH_CANNON
	db 49, MIRROR_COAT
	db 53, SCREECH
	db 57, FISSURE
	db 62, ZAP_CANNON
	db 0 ; no more level-up moves

MarshadowEvosAttacks:
	db 0 ; no more evolutions
	db 1, DYNAMICPUNCH
	db 1, SHADOW_SNEAK
	db 1, PURSUIT
	db 1, COUNTER
	db 5, LOW_KICK
	db 11, ASTONISH
	db 15, HI_JUMP_KICK
	db 20, MIRROR_COAT
	db 26, SHADOW_BALL
	db 30, THIEF
	db 35, DIZZY_PUNCH
	db 41, NASTY_PLOT
	db 45, SPECTRATHIEF
	db 50, CROSS_CHOP
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 66, SWIFT
	db 77, AEROBLAST
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, FIRE_BLAST
	db 55, SUNNY_DAY
	db 66, SWIFT
	db 77, SACRED_FIRE
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 20, ANCIENTPOWER
	db 30, FUTURE_SIGHT
	db 40, BATON_PASS
	db 50, PERISH_SONG
	db 0 ; no more level-up moves

LatiasEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 1, SAFEGUARD
	db 1, NASTY_PLOT
	db 4, PROTECT
	db 7, CHARM
	db 10, CONFUSION
	db 16, HEAL_BELL
	db 20, DRAGONBREATH
	db 24, MIST_BALL
	db 32, RECOVER
	db 38, HEADBUTT
	db 46, DRAGON_RAGE
	db 51, PSYCHIC
	db 56, DRAGON_PULSE
	db 61, HEAL_BELL
	db 0 ; no more level-up moves

LatiosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 1, SAFEGUARD
	db 1, NASTY_PLOT
	db 4, PROTECT
	db 7, AGILITY
	db 10, CONFUSION
	db 16, HEAL_BELL
	db 20, DRAGONBREATH
	db 24, LUSTER_PURGE
	db 32, RECOVER
	db 38, HEADBUTT
	db 46, DRAGON_RAGE
	db 51, PSYCHIC
	db 56, DRAGON_PULSE
	db 61, NASTY_PLOT
	db 0 ; no more level-up moves
