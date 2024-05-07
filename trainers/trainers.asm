Trainers:

; All trainers follow a basic structure:
	; Name
		; String in format "TEXT@"
	; Type
		; TRAINERTYPE_NORMAL:      level, species
		; TRAINERTYPE_ITEM:        item
		; TRAINERTYPE_DVS:         dvs
		; TRAINERTYPE_PERSONALITY: personality
		; TRAINERTYPE_MOVES:       moves
	; Party
		; Up to six monsters following the data type
	; $ff

CissyGroup:
; ================================
; ================

	; CISSY (1)
	db "CISSY@"
	db TRAINERTYPE_MOVES

	; party

	db 15, HORSEA
		db BUBBLE
		db SMOKESCREEN
		db NO_MOVE
		db NO_MOVE

	db 18, WARTORTLE
		db RAPID_SPIN
		db WATER_GUN
		db BUBBLEBEAM
		db WITHDRAW

	db 13, TENTACOOL
		db POISON_STING
		db SURF
		db ACID
		db WRAP

	db $ff ; end

; ================

	; CISSY (2)
	db "CISSY@"
	db TRAINERTYPE_MOVES

	; party

	db 70, KINGDRA
		db WATER_PULSE
		db OUTRAGE
		db DRAGON_PULSE
		db SLUDGE_BOMB

	db 70, BLASTOISE
		db RAPID_SPIN
		db BUBBLEBEAM
		db EARTHQUAKE
		db FISSURE

	db 70, TOXAPEX
		db VENOSHOCK
		db WATERFALL
		db DIVE
		db TOXIC

	db 70, GOLDUCK
		db PSYCHIC_M
		db WATERFALL
		db DISABLE
		db HYPER_BEAM

	db 70, GYARADOS
		db DRAGON_PULSE
		db THRASH
		db HYPER_BEAM
		db WATER_PULSE

	db 70, LANTURN
		db THUNDER
		db RAIN_DANCE
		db LOCK_ON
		db HYDRO_PUMP

	db $ff ; end

; ================
; ================================


DannyGroup:
; ================================
; ================

	; DANNY (1)
	db "DANNY@"
	db TRAINERTYPE_MOVES

	; party

	db 28, NIDOQUEEN
		db ICE_BEAM
		db BODY_SLAM
		db SLAM
		db POISON_STING

	db 30, MACHOKE
		db SEISMIC_TOSS
		db KARATE_CHOP
		db THUNDERPUNCH
		db FIRE_PUNCH

	db 27, SCIZOR
		db CUT
		db QUICK_ATTACK
		db METAL_CLAW
		db AGILITY

	db 29, ELECTRODE
		db THUNDERBOLT
		db EXPLOSION
		db NO_MOVE
		db NO_MOVE

	db $ff ; end

	; ================

	; DANNY (2)
	db "DANNY@"
	db TRAINERTYPE_MOVES

	; party

	db 75, NIDOQUEEN
		db BLIZZARD
		db HAIL
		db DOUBLE_KICK
		db BATON_PASS

	db 75, MACHAMP
		db DYNAMICPUNCH
		db POWERUPPUNCH
		db FISSURE
		db FOCUS_ENERGY

	db 75, SCIZOR
		db SIGNAL_BEAM
		db SWORDS_DANCE
		db HYPER_BEAM
		db AERIAL_ACE

	db 75, ELECTRODE
		db THUNDER
		db NASTY_PLOT
		db RAIN_DANCE
		db EXPLOSION

	db 75, RHYPERIOR
		db ROCK_CLIMB
		db HORN_DRILL
		db LOCK_ON
		db SURF

	db 75, NINETALES
		db DAZZLINGLEAM
		db BLIZZARD
		db EXTREMESPEED
		db NASTY_PLOT

	db $ff ; end

; ================================

RudyGroup:
; ================================
; ================

	; RUDY (1)
	db "RUDY@"
	db TRAINERTYPE_MOVES

	; party

	db 40, ELECTABUZZ
		db QUICK_ATTACK
		db THUNDERPUNCH
		db ROCK_SMASH
		db AGILITY

	db 42, EXEGGUTOR
		db EGG_BOMB
		db DRAGON_PULSE
		db DOUBLE_TEAM
		db STOMP

	db 41, STARMIE
		db RAPID_SPIN
		db DOUBLE_TEAM
		db SURF
		db PSYBEAM

	db 40, HITMONCHAN
		db MACH_PUNCH
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH

	db 39, GOLEM
		db DEFENSE_CURL
		db ROLLOUT
		db DOUBLE_TEAM
		db ROCK_SMASH

	db $ff ; end

; ================

	; RUDY (2)
	db "RUDY@"
	db TRAINERTYPE_MOVES

	; party

	db 80, ELECTIVIRE
		db SUNNY_DAY
		db NASTY_PLOT
		db THUNDERBOLT
		db COMET_PUNCH

	db 80, EXEGGUTOR
		db DRAGON_PULSE
		db NASTY_PLOT
		db SOLARBEAM
		db GIGA_DRAIN

	db 80, SHARPEDO
		db CRUNCH
		db DIVE
		db MEAN_LOOK
		db FOCUS_ENERGY

	db 80, HITMONTOP
		db TRIPLE_KICK
		db FOCUS_ENERGY
		db SWORDS_DANCE
		db POWERUPPUNCH

	db 80, GOLEM
		db DEFENSE_CURL
		db ROLLOUT
		db FISSURE
		db LOCK_ON

	db 80, CLEFABLE
		db ENCORE
		db DAZZLINGLEAM
		db DOUBLE_EDGE
		db BATON_PASS

	db $ff ; end

; ================================



LuanaGroup:
; ================================
; ================

	; LUANA (1)
	db "LUANA@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 56, ALAKAZAM, MALE_MASK
		db PSYCHIC_M
		db NASTY_PLOT
		db SAFEGUARD
		db RECOVER

	db 54, MAROWAK, FEMALE_MASK | MAROWAK_KANTONESE_FORM
		db BONEMERANG
		db ROCK_SLIDE
		db EARTHQUAKE
		db PROTECT

	db 54, TURTONATOR, MALE_MASK
		db SHELL_TRAP
		db DRAGON_PULSE
		db FIRE_BLAST
		db SUNNY_DAY

	db 54, TROPIUS, MALE_MASK
		db FLY
		db AERIAL_ACE
		db SYNTHESIS
		db SOLARBEAM

	db $ff ; end

; ================

	; LUANA (2)
	db "LUANA@"
	db TRAINERTYPE_MOVES

	; party

	db 80, MAROWAK
		db SHADOW_BONE
		db SUNNY_DAY
		db FIRE_BLAST
		db PROTECT

	db 80, TURTONATOR
		db SHELL_TRAP
		db DRAGON_PULSE
		db FIRE_BLAST
		db NASTY_PLOT

	db 80, ALAKAZAM
		db PSYCHIC_M
		db NASTY_PLOT
		db SUNNY_DAY
		db SAFEGUARD

	db 80, TROPIUS
		db AERIAL_ACE
		db FLY
		db SOLARBEAM
		db SYNTHESIS

	db 80, LICKILICKY
		db DEFENSE_CURL
		db ROLLOUT
		db DOUBLE_EDGE
		db HYPER_BEAM

	db 80, AZUMARILL
		db DAZZLINGLEAM
		db WATERFALL
		db BATON_PASS
		db DOUBLE_EDGE

	db $ff ; end

; ================================


DrakeGroup:
; ================================
; ================

	; DRAKE (1)
	db "DRAKE@"
	db TRAINERTYPE_MOVES

	; party

	db 60, DITTO
		db TRANSFORM
		db NO_MOVE
		db NO_MOVE
		db NO_MOVE

	db 62, STEELIX
		db DIG
		db IRON_TAIL
		db ROCK_BLAST
		db EARTHQUAKE

	db 62, GENGAR
		db CONFUSE_RAY
		db HYPNOSIS
		db SHADOW_BALL
		db NASTY_PLOT

	db 63, VENUSAUR
		db SUNNY_DAY
		db SOLARBEAM
		db VENOSHOCK
		db TOXIC

	db 62, ELECTIVIRE
		db THUNDERPUNCH
		db BODY_SLAM
		db POWERUPPUNCH
		db AGILITY

	db 65, DRAGONITE
		db DRAGON_TAIL
		db DRAGON_PULSE
		db HYPER_BEAM
		db ICE_BEAM

	db $ff ; end

; ================

	; DRAKE (2)
	db "DRAKE@"
	db TRAINERTYPE_MOVES

	; party

	db 85, MR__MIME
		db PSYCHIC_M
		db NASTY_PLOT
		db BARRIER
		db BATON_PASS

	db 85, STEELIX
		db DOUBLE_EDGE
		db IRON_TAIL
		db ANCIENTPOWER
		db EARTHQUAKE

	db 85, PORYGON_Z
		db CONVERSION
		db CONVERSION2
		db TRI_ATTACK
		db HYPER_BEAM

	db 85, VENUSAUR
		db SUNNY_DAY
		db SOLARBEAM
		db NASTY_PLOT
		db PETAL_DANCE

	db 85, DRAGALGE
		db TOXIC
		db DRAGON_PULSE
		db VENOSHOCK
		db WATERFALL

	db 85, DRAGONITE
		db THUNDER
		db DRAGON_PULSE
		db HYPER_BEAM
		db ICE_BEAM

	db $ff ; end

; ================================


TraceyGroup:
; ================================
; ================

	; TRACEY (1)
	db "TRACEY@"
	db TRAINERTYPE_MOVES

	; party

	db 12, VENONAT
		db TACKLE
		db NO_MOVE
		db NO_MOVE
		db NO_MOVE

	db 9, MARILL
		db BUBBLE
		db GROWL
		db TAIL_WHIP
		db NO_MOVE

	db $ff ; end

; ================

	; TRACEY (2)
	db "TRACEY@"
	db TRAINERTYPE_MOVES

	; party

	db 23, VENONAT
		db TACKLE
		db DISABLE
		db CONFUSION
		db POISONPOWDER

	db 24, MARILL
		db WATER_GUN
		db DEFENSE_CURL
		db TAIL_WHIP
		db BUBBLEBEAM

	db 23, DODUO
		db PECK
		db AGILITY
		db NO_MOVE
		db NO_MOVE

	db 22, FLAAFFY
		db THUNDERBOLT
		db THUNDER_WAVE
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db $ff ; end

; ================

	; TRACEY (3)
	db "TRACEY@"
	db TRAINERTYPE_MOVES

	; party

	db 33, VENOMOTH
		db SIGNAL_BEAM
		db WING_ATTACK
		db HYPNOSIS
		db POISONPOWDER

	db 34, AZUMARILL
		db BUBBLEBEAM
		db FAIRY_WIND
		db SLAM
		db SURF

	db 31, DODRIO
		db FLY
		db AGILITY
		db TRI_ATTACK
		db AERIAL_ACE

	db 30, AMPHAROS
		db THUNDERPUNCH
		db THUNDER_WAVE
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db 32, SCYTHER
		db SLASH
		db SWORDS_DANCE
		db SIGNAL_BEAM
		db FOCUS_ENERGY

	db $ff ; end
	
; ================


	
Tracey2Group:
; ================================
; ================
	; TRACEY_2 (1)
	db "TRACEY@"
	db TRAINERTYPE_MOVES

	; party

	db 56, VENOMOTH
		db SIGNAL_BEAM
		db AGILITY
		db HYPNOSIS
		db SLUDGE_BOMB

	db 57, AZUMARILL
		db HYDRO_PUMP
		db MOONBLAST
		db DOUBLE_EDGE
		db RAIN_DANCE

	db 56, DODRIO
		db FLY
		db AGILITY
		db TRI_ATTACK
		db DRILL_PECK

	db 57, AMPHAROS
		db THUNDER
		db POWER_GEM
		db SUBSTITUTE
		db DOUBLE_TEAM

	db 55, SCIZOR
		db FLASH_CANNON
		db SWORDS_DANCE
		db SLASH
		db FOCUS_ENERGY

	db $ff ; end
; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "BROCK@"
	db TRAINERTYPE_PERSONALITY + TRAINERTYPE_MOVES

	; party

	db 19, GEODUDE, MALE_MASK | GEODUDE_KANTONESE_FORM
		db TACKLE
		db ROCK_THROW
		db DEFENSE_CURL
		db NO_MOVE

	db 22, ROCKRUFF, MALE_MASK
		db ROCK_THROW
		db GROWL
		db ROAR
		db TACKLE

	db 22, ONIX, MALE_MASK | ONIX_NORMAL_FORM
		db TACKLE
		db ROCK_THROW
		db SCREECH
		db DIG

	db 18, CORSOLA, FEMALE_MASK
		db BUBBLE
		db HARDEN
		db NO_MOVE
		db NO_MOVE

	db $ff ; end
	
; ================================
; ================

	; BROCK (2) World Tournament
	db "BROCK@"
	db TRAINERTYPE_PERSONALITY + TRAINERTYPE_ITEM + TRAINERTYPE_MOVES

	; party

	db 100, STEELIX, LEFTOVERS, MALE_MASK | ONIX_NORMAL_FORM
		db IRON_TAIL
		db GIGA_IMPACT
		db DIG
		db EARTHQUAKE

	db 100, LYCANROC, HARD_STONE, MALE_MASK | LYCANROC_DUSK_FORM
		db ACCELEROCK
		db ROAR
		db EXTREMESPEED
		db CRUNCH

	db 100, AERODACTYL, GOLD_BERRY, MALE_MASK
		db FLY
		db ANCIENTPOWER
		db STEEL_WING
		db ROCK_SLIDE

	db 100, GOLEM, MAGNET, MALE_MASK
		db THUNDER
		db FISSURE
		db LOCK_ON
		db EARTHQUAKE
		
	db 100, RHYPERIOR, QUICK_CLAW, MALE_MASK
		db HORN_DRILL
		db EARTHQUAKE
		db ROCK_SLIDE
		db ROCK_CLIMB
		
	db 100, RELICANTH, MYSTIC_WATER, MALE_MASK
		db HYDRO_PUMP
		db RAIN_DANCE
		db WHIRLPOOL
		db PROTECT

	db $ff ; end

; ================
; ================================


MistyGroup:
; ================================
; ================

	; MISTY (1)
	db "MISTY@"
	db TRAINERTYPE_MOVES

	; party

	db 62, STARMIE
		db HYDRO_PUMP
		db PSYCHIC_M
		db LOCK_ON
		db RECOVER
		
	db 64, GYARADOS
		db DRAGON_TAIL
		db RAIN_DANCE
		db HYPER_BEAM
		db OUTRAGE
		
	db 61, TENTACRUEL
		db POISON_JAB
		db SWAGGER
		db REST
		db WATER_PULSE
		
	db 60, STUNFISK
		db THUNDER
		db DIG
		db EARTHQUAKE
		db DIVE
		
	db 63, LUMINEON
		db AERIAL_ACE
		db WATER_PULSE
		db REST
		db SLEEP_TALK
		
	db 65, SEAKING
		db HORN_DRILL
		db LOCK_ON
		db SPLASH
		db NO_MOVE

	db $ff ; end
; ================================


LtSurgeGroup:
; ================================
; ================

	; LT.SURGE (3)
	db "LT.SURGE@"
	db TRAINERTYPE_MOVES

	; party

	db 60, ELECTRODE
		db EXPLOSION
		db ENDURE
		db NASTY_PLOT
		db NO_MOVE

	db 62, RAICHU
		db VOLT_TACKLE
		db AGILITY
		db IRON_TAIL
		db PSYCHIC_M

	db 61, JOLTEON
		db AGILITY
		db PIN_MISSILE
		db THUNDERBOLT
		db BATON_PASS

	db 60, AMPHAROS
		db THUNDER
		db THUNDERPUNCH
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db $ff ; end
; ================================


ErikaGroup:
; ================================
; ================
; ================================


KogaGroup:
; ================================
; ================
; ================================


SabrinaGroup:
; ================================
; ================
; ================================


BlaineGroup:
; ================================
; ================

	; BLAINE (1)
	db "BLAINE@"
	db TRAINERTYPE_MOVES

	db 64, ARCANINE
		db EXTREMESPEED
		db FIRE_BLAST
		db AGILITY
		db ROAR

	db 65, MAGMORTAR
		db FLAMETHROWER
		db SLUDGE_BOMB
		db SUNNY_DAY
		db FIRE_BLAST

	db 64, RAPIDASH
		db HORN_DRILL
		db LOCK_ON
		db FOCUS_ENERGY
		db HYPER_BEAM

	db 63, MAGCARGO
		db DIG
		db FIRE_BLAST
		db ROCK_SLIDE
		db AMNESIA

	db 62, FLAREON
		db BATON_PASS
		db NASTY_PLOT
		db FLAME_WHEEL
		db QUICK_ATTACK

	db 63, CHARIZARD
		db FLY
		db SEISMIC_TOSS
		db FIRE_PUNCH
		db DRAGONBREATH

	db $ff

; ================================


GiovanniGroup:
; ================================
; ================
; ================================


LoreleiGroup:
; ================================
; ================

	; LORELEI (1)
	db "LORELEI@"
	db TRAINERTYPE_MOVES

	; party

	db 40, DEWGONG
		db ICE_BEAM
		db LOCK_ON
		db SIGNAL_BEAM
		db WATERFALL

	db 41, CLOYSTER
		db SPIKES
		db DIVE
		db HAIL
		db PROTECT

	db 41, NINETALES
		db DAZZLINGLEAM
		db ICE_BEAM
		db CONFUSE_RAY
		db PSYCHIC_M

	db 39, LAPRAS
		db BODY_SLAM
		db CONFUSE_RAY
		db SURF
		db ICE_BEAM

	db 37, JYNX
		db DOUBLESLAP
		db ICE_PUNCH
		db SWEET_KISS
		db ATTRACT

	db $ff ; end

; ================

	; LORELEI (2)
	db "LORELEI@"
	db TRAINERTYPE_MOVES

	db 64, DEWGONG
		db LOCK_ON
		db HORN_DRILL
		db BLIZZARD
		db HAIL

	db 65, CLOYSTER
		db SPIKE_CANNON
		db DIVE
		db MIRROR_COAT
		db SPIKES

	db 63, NINETALES
		db MOONBLAST
		db ICE_BEAM
		db CONFUSE_RAY
		db PSYCHIC_M

	db 61, LAPRAS
		db PERISH_SONG
		db BATON_PASS
		db SURF
		db ENDURE

	db 62, JYNX
		db SWEET_KISS
		db ICE_PUNCH
		db ATTRACT
		db FISSURE

	db 60, GLACEON
		db NASTY_PLOT
		db BATON_PASS
		db ICE_BEAM
		db BITE

	db $ff
; ================================


BrunoGroup:
; ================================
; ================
; ================================


AgathaGroup:
; ================================
; ================

	; AGATHA (1)
	db "AGATHA@"
	db TRAINERTYPE_MOVES

	; party

	db 65, GENGAR
		db CONFUSE_RAY
		db SHADOW_BALL
		db HYPNOSIS
		db DREAM_EATER

	db 64, CROBAT
		db CONFUSE_RAY
		db FLY
		db HAZE
		db AERIAL_ACE

	db 64, MAROWAK
		db SHADOW_BONE
		db EARTHQUAKE
		db FIRE_BLAST
		db BATON_PASS

	db 65, PALOSSAND
		db EARTHQUAKE
		db SHADOW_BALL
		db HYPNOSIS
		db MEAN_LOOK

	db 62, ARBOK
		db CRUNCH
		db GLARE
		db TOXIC
		db VENOSHOCK

	db 63, MIMIKYU
		db SHADOW_SNEAK
		db MIMIC
		db SHADOW_BALL
		db DOUBLE_TEAM

	db $ff ; end
; ================================


LanceGroup:
; ================================
; ================

	; LANCE (1)
	db "LANCE@"
	db TRAINERTYPE_MOVES

	db 70, DRAGONITE
		db HYPER_BEAM
		db DRAGON_PULSE
		db THUNDER
		db ICE_BEAM

	db 69, DRAGALGE
		db TOXIC
		db VENOSHOCK
		db SPIKES
		db RECOVER

	db 69, KINGDRA
		db WHIRLPOOL
		db DRAGON_PULSE
		db DRAGONBREATH
		db OUTRAGE

	db 71, TURTONATOR
		db SHELL_TRAP
		db SUNNY_DAY
		db SOLARBEAM
		db RAPID_SPIN

	db 70, EXEGGUTOR
		db EGG_BOMB
		db DRAGON_PULSE ;DRAGON_HAMMER
		db PETAL_DANCE
		db SYNTHESIS

	db 69, FLYGON
		db DRAGON_PULSE
		db SANDSTORM
		db EARTHQUAKE
		db FLY

	db $ff ; end

; ================================


RedGroup:
; ================================
; ================

	; RED (1)
	db "RED@"
	db  TRAINERTYPE_NICKNAME_F + TRAINERTYPE_ITEM + TRAINERTYPE_MOVES

	db 88, PIKACHU, "PIKACHU@", LIGHT_BALL
		db THUNDERBOLT
		db AGILITY
		db IRON_TAIL
		db VOLT_TACKLE

	db 86, VENUSAUR, "VENUSAUR@", POISON_BARB
		db SLUDGE_BOMB
		db BODY_SLAM
		db GIGA_DRAIN
		db NASTY_PLOT

	db 86, CHARIZARD, "CHARIZARD@", MIRACLEBERRY
		db FIRE_BLAST
		db EARTHQUAKE
		db DRAGON_PULSE
		db ROCK_SLIDE

	db 86, BLASTOISE, "BLASTOISE@", NEVERMELTICE
		db SURF
		db ZAP_CANNON
		db ICE_BEAM
		db ROCK_CLIMB

	db 90, MACHAMP, "RICKY@", BLACKBELT
		db DOUBLE_EDGE
		db DYNAMICPUNCH
		db POISON_JAB
		db CROSS_CHOP
		
	db 92, SNORLAX, "SNORLAX@", LEFTOVERS
		db REST
		db PSYCHIC_M
		db SLEEP_TALK
		db DOUBLE_EDGE

	db $ff ; end

; ================================


BlueGroup:
; ================================
; ================
; ================================


GreenGroup:
; ================================
; ================
; ================================


YellowGroup:
; ================================
; ================
; ================================


CalGroup:
; ================================
; ================
; ================================


ButchGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "BUTCH@"
	db TRAINERTYPE_NORMAL

	; party

	db 21, SHELLDER
	db 21, MANKEY

	db $ff ; end

; ================

	; EXECUTIVEM (2)
	db "BOTCH@"
	db TRAINERTYPE_MOVES

	; party

	db 40, CLOYSTER
		db ICE_BEAM
		db CLAMP
		db HAIL
		db SURF

	db 41, PRIMEAPE
		db DYNAMICPUNCH
		db ROCK_SMASH
		db LOCK_ON
		db DOUBLE_KICK

	db 39, SHUCKLE
		db TOXIC
		db WRAP
		db REST
		db ENCORE

	db 41, HITMONTOP
		db TRIPLE_KICK
		db RAPID_SPIN
		db DOUBLE_KICK
		db FOCUS_ENERGY

	db $ff ; end

; ================
; ================================


CassidyGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "CASSIDY@"
	db TRAINERTYPE_MOVES

	; party

	db 21, TENTACOOL
		db ACID
		db WATER_GUN
		db POISON_STING
		db NO_MOVE

	db 20, DROWZEE
		db HYPNOSIS
		db DISABLE
		db CONFUSION
		db DREAM_EATER

	db 20, RATICATE
		db BITE
		db TAIL_WHIP
		db QUICK_ATTACK
		db NO_MOVE

	db $ff ; end

; ================

	; EXECUTIVEF (2)
	db "CASSIDY@"
	db TRAINERTYPE_MOVES

	; party

	db 40, TENTACRUEL
		db TOXIC
		db WHIRLPOOL
		db RAIN_DANCE
		db WATERFALL

	db 41, HYPNO
		db HYPNOSIS
		db PSYCHIC_M
		db NASTY_PLOT
		db REST

	db 39, MIMIKYU
		db SHADOW_SNEAK
		db ASTONISH
		db SHADOW_BALL
		db ENDURE

	db 41, RATICATE
		db HYPER_FANG
		db FOCUS_ENERGY
		db REST
		db SLEEP_TALK

	db $ff ; end
; ================================


CassidyButchGroup:
; ================================
; ================
	; C&B (2)
	db "AND BUTCH@"
	db TRAINERTYPE_MOVES

	db 40, CLOYSTER
		db ICE_BEAM
		db CLAMP
		db HAIL
		db SURF

	db 41, PRIMEAPE
		db DYNAMICPUNCH
		db ROCK_SMASH
		db LOCK_ON
		db DOUBLE_KICK

	db 41, HITMONTOP
		db TRIPLE_KICK
		db RAPID_SPIN
		db DOUBLE_KICK
		db FOCUS_ENERGY

	db 41, HYPNO
		db HYPNOSIS
		db PSYCHIC_M
		db NASTY_PLOT
		db REST

	db 39, MIMIKYU
		db SHADOW_SNEAK
		db ASTONISH
		db SHADOW_BALL
		db ENDURE

	db 41, RATICATE
		db HYPER_FANG
		db FOCUS_ENERGY
		db REST
		db SLEEP_TALK

	db $ff
; ================================


JamesGroup:
; ================================
; ================

	; James (1)
	db "JAMES@"
	db TRAINERTYPE_MOVES

	db 38, WEEZING
		db SLUDGE_BOMB
		db TOXIC
		db BODY_SLAM
		db VENOSHOCK

	db 37, VICTREEBEL
		db VINE_WHIP
		db COTTON_SPORE
		db SLUDGE_BOMB
		db BITE

	db $ff
; ================================


JessieGroup:
; ================================
; ================

	; Jessie (1)
	db "JESSIE@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 38, ARBOK, FEMALE_MASK
		db CRUNCH
		db POISON_STING
		db MEAN_LOOK
		db WRAP

	db 37, LICKITUNG, FEMALE_MASK
		db ROLLOUT
		db DEFENSE_CURL
		db LICK
		db TAKE_DOWN

	db 35, MEOWTH, MALE_MASK | MEOWTH_ROCKET_FORM
		db FURY_SWIPES
		db AGILITY
		db TAIL_WHIP
		db SLASH

	db $ff
; ================================



JessieJamesGroup:
; ================================
	; J&J (1)
	db "AND JAMES@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 32, WEEZING, MALE_MASK
		db POISON_GAS
		db BODY_SLAM
		db TOXIC
		db SLUDGE_BOMB

	db 32, ARBOK, FEMALE_MASK
		db POISON_STING
		db WRAP
		db CRUNCH
		db SWAGGER

	db 33, MEOWTH, MALE_MASK | MEOWTH_ROCKET_FORM
		db FURY_SWIPES
		db AGILITY
		db TAIL_WHIP
		db SLASH

	db 31, VICTREEBEL, MALE_MASK
		db VINE_WHIP
		db RAZOR_LEAF
		db SLEEP_POWDER
		db ACID

	db $ff ; end
; ================

	; J&J (2)
	db "AND JAMES@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 38, WEEZING, MALE_MASK
		db SLUDGE_BOMB
		db TOXIC
		db BODY_SLAM
		db VENOSHOCK

	db 37, VICTREEBEL, MALE_MASK
		db VINE_WHIP
		db COTTON_SPORE
		db SLUDGE_BOMB
		db BITE

	db 38, ARBOK, FEMALE_MASK
		db CRUNCH
		db POISON_STING
		db MEAN_LOOK
		db WRAP

	db 37, LICKITUNG, FEMALE_MASK
		db ROLLOUT
		db DEFENSE_CURL
		db LICK
		db TAKE_DOWN

	db 35, MEOWTH, MALE_MASK | MEOWTH_ROCKET_FORM
		db FURY_SWIPES
		db AGILITY
		db TAIL_WHIP
		db SLASH

	db $ff ; end
; ================================


MomGroup:
; ================================
; ================

	; MOM (1)
	db TRAINERTYPE_MOVES

	db 95, EXEGGUTOR
		db OUTRAGE
		db DRAGON_PULSE
		db SUNNY_DAY
		db SOLARBEAM

	db 99, CLEFABLE
		db DAZZLINGLEAM
		db HEAL_BELL
		db HYPER_BEAM
		db ATTRACT

	db 97, TOUCANNON
		db AERIAL_ACE
		db FIRE_BLAST
		db STEEL_WING
		db GLARE

	db 94, KINGDRA
		db HYDRO_PUMP
		db DRAGON_PULSE
		db SUBSTITUTE
		db LOCK_ON

	db 96, SALAZZLE
		db FLAMETHROWER
		db TOXIC
		db VENOSHOCK
		db AGILITY

	db 98, RAICHU
		db VOLT_TACKLE
		db DOUBLE_TEAM
		db ENCORE
		db NASTY_PLOT

	db $ff ; end
; ================
; ================================


BillGroup:
; ================================
; ================
; ================
; ================================


ImakuniGroup:
; ================================
; ================
	; Imakuni? (1)
	db "IMAKUNI?@"
	db  TRAINERTYPE_ITEM + TRAINERTYPE_MOVES

	db 60, FARFETCH_D, BERSERK_GENE
		db SWAGGER
		db SLASH
		db AERIAL_ACE
		db SPLASH

	db 69, MAGIKARP, BERSERK_GENE
		db HYPER_BEAM
		db NO_MOVE
		db NO_MOVE
		db NO_MOVE

	db 62, DODRIO, BERSERK_GENE
		db TRI_ATTACK
		db SLAM
		db DRILL_PECK
		db FLAIL

	db 63, GOLDUCK, BERSERK_GENE
		db SURF
		db AMNESIA
		db SWEET_KISS
		db SCREECH

	db 60, SLOWPOKE, BERSERK_GENE
		db REST
		db TAIL_WHIP
		db EXPLOSION
		db NO_MOVE

	db $ff ; end
; ================
; ================================


LawrenceGroup:
; ================================
; ================

	; LAWRENCE (1)
	db "LAWRENCE@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 65, MOLTRES, MALE_MASK
		db FIRE_BLAST
		db FLAMETHROWER
		db DRILL_PECK
		db STEEL_WING

	db 62, KINGDRA, MALE_MASK
		db HYDRO_PUMP
		db SMOKESCREEN
		db DRAGONBREATH
		db WATERFALL

	db 63, FLYGON, MALE_MASK
		db SANDSTORM
		db DRAGON_PULSE
		db EARTHQUAKE
		db DIG

	db 64, LYCANROC, MALE_MASK | LYCANROC_DUSK_FORM
		db ACCELEROCK
		db POWER_GEM
		db CRUNCH
		db ROCK_SLIDE
		

	db $ff ; end

; ================================
; ================

	; LAWRENCE (2)
	db "LAWRENCE@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 65, MOLTRES, MALE_MASK
		db FIRE_BLAST
		db FLAMETHROWER
		db DRILL_PECK
		db STEEL_WING
		
	db 65, ARTICUNO, MALE_MASK
		db BLIZZARD
		db ICE_BEAM
		db DRILL_PECK
		db LOCK_ON
		
	db 65, ZAPDOS, MALE_MASK
		db THUNDER
		db THUNDERBOLT
		db DRILL_PECK
		db REST
		
	db 64, KINGDRA, MALE_MASK
		db HYDRO_PUMP
		db SMOKESCREEN
		db DRAGONBREATH
		db WATERFALL

	db 63, FLYGON, MALE_MASK
		db SANDSTORM
		db DRAGON_PULSE
		db EARTHQUAKE
		db DIG

	db 64, LYCANROC, MALE_MASK | LYCANROC_DUSK_FORM
		db ACCELEROCK
		db POWER_GEM
		db CRUNCH
		db ROCK_SLIDE

	db $ff ; end
; ================================
; ================
	
; ================
; ================================


ProfOakGroup:
; ================================
; ================
; ================
; ================================


ProfIvyGroup:
; ================================
; ================
; ================
; ================================


ProfAideGroup:
; ================================
; ================

	; PROF_AIDE (1)
	db "CHARITY@"
	db TRAINERTYPE_NORMAL

	; party
	db 5, AZURILL
	db 5, IGGLYBUFF
	db 5, CLEFFA

	db $ff ; end

; ================
; ================================


NurseGroup:
; ================================
; ================
; ================================


OfficerGroup:
; ================================
; ================

	; OFFICER(1) Mikan Island
	db "JENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 14, GROWLITHE

	db $ff ; end

; ================================

	; OFFICER(2) Kinnow Island
	db "JENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, GROWLITHE
	db 24, SKIPLOOM

	db $ff ; end

; ================================

	; OFFICER(3) Moro Island
	db "JENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, ARCANINE
	db 30, JUMPLUFF

	db $ff ; end

; ================================

	; OFFICER(4) Murcott Island
	db "JENNY@"
	db TRAINERTYPE_NORMAL

	; party
	db 33, ARCANINE

	db $ff ; end

; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "MOE@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, SPEAROW
	db 7, EKANS

	db $ff ; end

; ================

	; YOUNGSTER (2)
	db "JERRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, POLIWAG
	db 8, PIDGEY

	db $ff ; end

; ================

	; YOUNGSTER (3)
	db "RYAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, TANGELA
	db 9, RATTATA

	db $ff ; end

; ================

; YOUNGSTER (4)
	db "NESS@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, WINGULL
	db 9, RATTATA
	db 9, PIKACHU

	db $ff ; end

; ================

; YOUNGSTER (5)
	db "CRAIG@"
	db TRAINERTYPE_NORMAL

	; party
	db 29, IVYSAUR
	db 29, RATICATE
	db 29, POLITOED

	db $ff ; end

; ================

; YOUNGSTER (6)
	db "LENI@"
	db TRAINERTYPE_NORMAL

	; party
	db 41, CHANSEY
	db 42, MUNCHLAX
	db 43, FARFETCH_D

	db $ff ; end

; ================

; YOUNGSTER (7)
	db "E.V.E@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, VENUSAUR
	db 44, SALANDIT
	db 44, STUNFISK
	db 44, CLOYSTER

	db $ff ; end
; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "NICOLE@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, MARILL
	db 11, STARYU

	db $ff ; end

; ================

	; LASS (2)
	db "RITA@"
	db TRAINERTYPE_NORMAL

	; party
	db 31, JUMPLUFF
	db 29, HORSEA

	db $ff ; end
	
; ================

	; LASS (3)
	db "RILEY@"
	db TRAINERTYPE_MOVES

	db 44, CLEFABLE
		db TAKE_DOWN
		db SWEET_KISS
		db ATTRACT
		db METRONOME
		
	db 44, WIGGLYTUFF
		db TAKE_DOWN
		db DEFENSE_CURL
		db ROLLOUT
		db BOUNCE

	db $ff
	
; ================

	; LASS (4)
	db "LOLA@"
	db TRAINERTYPE_NORMAL

	; party
	db 41, MARILL
	db 42, AZUMARILL

	db $ff ; end
	
; ================

	; LASS (5)
	db "TORI@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, TOGETIC
	db 44, TOGEPI
	db 44, CLEFFA
	db 44, CLEFAIRY

	db $ff ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================
; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "BO@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (2)
	db "SAM@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, BEEDRILL

	db $ff ; end

; ================

	; BUG_CATCHER (3)
	db "MIKE@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, CATERPIE
	db 10, PARAS

	db $ff ; end

; ================

	; BUG_CATCHER (4)
	db "ALAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 11, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (5)
	db "ALEX@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, CATERPIE
	db 8, VENONAT
	db 8, WEEDLE
	db 8, PARAS

	db $ff ; end

; ================
; ================================


BugCatcherFGroup:
; ================================
; ================

	; BUGCATCHERF (1)
	db "ALIA@"
	db TRAINERTYPE_NORMAL

	db 26, BUTTERFREE
	db 25, VENONAT

	db $ff ;end
; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "ZACH@"
	db TRAINERTYPE_NORMAL

	db 14, POLIWAG
	db 14, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (2)
	db "MARK@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, SHELLDER

	db $ff ; end

; ================

	; SWIMMERM (3)
	db "CLYDE@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, MAREANIE
	db 16, GOLDEEN

	db $ff ; end

; ================

	; SWIMMERM (4)
	db "MATT@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERM (5)
	db "GERALD@"
	db TRAINERTYPE_NORMAL

	; party
	db 15, CORSOLA
	db 15, SQUIRTLE
	db 16, SLOWPOKE

	db $ff ; end

; ================

	; SWIMMERM (6)
	db "ABE@"
	db TRAINERTYPE_NORMAL

	; party
	db 21, MAREANIE
	db 20, WAILMER

	db $ff ; end

; ================

	; SWIMMERM (7)
	db "CORY@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (8)
	db "ATECAIN@"
	db TRAINERTYPE_DVS

	db 6, MAGIKARP, MAGIKARP_CALICO3_DVS
	db 6, SLOWPOKE, $98, $88
	db 6, MAGIKARP, MAGIKARP_MASK_DVS
	db 6, CARVANHA, $98, $88
	db 6, MAGIKARP, MAGIKARP_TIGER_DVS

	db $ff

; ================

	; SWIMMERM (9)
	db "THEO@"
	db TRAINERTYPE_NORMAL

	db 10, STARYU

	db $ff

; ===========

	; SWIMMERM (10)
	db "LLOYD@"
	db 1

	db 27, NIDOKING
		db SURF
		db STOMP
		db DOUBLE_KICK
		db POISON_STING

	db 27, STARMIE
		db BUBBLE
		db AGILITY
		db WATER_GUN
		db RAPID_SPIN

	db $ff

; ================

	; SWIMMERM (11)
	db "TERRY@"
	db TRAINERTYPE_NORMAL

	db 28, STARMIE
	db 26, STUNFISK

	db $ff
; =================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "MARIA@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, CORSOLA

	db $ff ; end

; ================

	; SWIMMERF (2)
	db "HALEY@"
	db TRAINERTYPE_NORMAL

	; party
	db 18, STARYU

	db $ff ; end

; ================

	; SWIMMERF (3)
	db "ALISON@"
	db TRAINERTYPE_NORMAL

	; party
	db 16, SKRELP
	db 16, GOLDEEN
	db 16, QWILFISH

	db $ff ; end

; ================

	; SWIMMERF (4)
	db "STACY@"
	db TRAINERTYPE_NORMAL

	db 21, CORSOLA
	db 21, SQUIRTLE
	db 21, POLIWAG

	db $ff ; end

; ================

	; SWIMMERF (5)
	db "AMANDA@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, CHINCHOU
	db 22, STARYU
	db 22, STUNFISK
	db 22, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERF (6)
	db "TARYN@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, HORSEA
	db 24, SKRELP

	db $ff ; end

; ================

	; SWIMMERF (7)
	db "ASIA@"
	db TRAINERTYPE_NORMAL

	; party
	db 9, WAILMER
	db 9, PSYDUCK

	db $ff ; end
	
; ================

	; SWIMMERF (8)
	db "MARINA@"
	db TRAINERTYPE_MOVES

	db 44, GOLDUCK
		db ZEN_HEADBUTT
		db SURF
		db RAIN_DANCE
		db SCREECH

	db 44, WAILORD
		db WATER_PULSE
		db TAKE_DOWN
		db MIST
		db DEFENSE_CURL
		
	db 44, STARMIE
		db POWER_GEM
		db CONFUSE_RAY
		db TRI_ATTACK
		db RAPID_SPIN

	db $ff ; end
	
; ================

	; SWIMMERF (9)
	db "LULU@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, LUMINEON
	db 44, DRAGALGE
	db 44, STARMIE

	db $ff ; end
	
; ================

	; SWIMMERF (10)
	db "MELLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, DEWGONG
	db 44, SEAKING

	db $ff ; end
	
; ================

	; SWIMMERF (11)
	db "SALLY@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, LUMINEON
	db 44, STUNFISK

	db $ff ; end
	
; ================

	; SWIMMERF (12)
	db "RUE@"
	db TRAINERTYPE_NORMAL

	; party
	db 42, BLASTOISE
	db 41, WARTORTLE
	db 40, SQUIRTLE

	db $ff ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "SAMM@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, MANKEY

	db $ff ; end
	
; ================

	; CAMPER (2)
	db "NEB@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, TOXAPEX
	db 44, MAROWAK
	db 44, TOGETIC

	db $ff ; end
	
; ================

	; CAMPER (3)
	db "SNYD@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, PORYGON2
	db 44, TANGELA
	db 44, ARCANINE

	db $ff ; end

; ================
; ================================


PinkManiacGroup:
; ================================
; ================

	; PINK_MANIAC (1)
	db "SHAWN@"
	db TRAINERTYPE_MOVES

	db 19, RAICHU
		db CONFUSION
		db THUNDERSHOCK
		db NO_MOVE
		db NO_MOVE

	db 22, RHYHORN
		db TACKLE
		db SCARY_FACE
		db ROCK_THROW
		db NO_MOVE

	db $ff ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "SID@"
	db TRAINERTYPE_NORMAL

	; party
	db 34, SALAZZLE
	db 31, MUK
	db 28, SKRELP

	db $ff ; end

; ================

	; POKEMANIAC (2)
	db "TOM@"
	db TRAINERTYPE_NORMAL

	; party
	db 43, SALAZZLE
	db 44, MUK

	db $ff ; end
; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "POPS@"
	db TRAINERTYPE_NORMAL

	; party
	db 7, CHINCHOU
	db 7, TENTACOOL
	db 7, CORSOLA

	db $ff ; end

; ================

	; FISHER (2)
	db "DOC@"
	db TRAINERTYPE_NORMAL

	; party
	db 10, QWILFISH

	db $ff ; end

; ================

	; FISHER (3)
	db "NAT PAGLE@"
	db TRAINERTYPE_DVS

	; party
	db 14, TENTACOOL, $98, $88
	db 14, MAGIKARP, MAGIKARP_ORCA_DVS
	db 14, CHINCHOU, $98, $88

	db $ff ; end

; ================

	; FISHER (4)
	db "STAN@"
	db TRAINERTYPE_NORMAL

	; party
	db 8, POLIWAG
	db 9, REMORAID

	db $ff ; end

; ================

	; FISHER (5)
	db "JOE@"
	db TRAINERTYPE_NORMAL

	; party
	db 22, QWILFISH
	db 21, FINNEON
	db 22, CHINCHOU

	db $ff ; end

; =================

	; FISHER (6)
	db "TIM@"
	db TRAINERTYPE_NORMAL

	db 28, OCTILLERY

	db $ff

; =================

	; FISHER (7)
	db "JOHN@"
	db TRAINERTYPE_MOVES

	db 36, SEAKING
		db PECK
		db WHIRLPOOL
		db WATER_PULSE
		db AGILITY

	db 36, SHARPEDO
		db CRUNCH
		db SCARY_FACE
		db SURF
		db SWAGGER
		
	db 36, STARMIE
		db PSYBEAM
		db RECOVER
		db BUBBLEBEAM
		db RAPID_SPIN

	db $ff

; =================

	; FISHER (8)
	db "ROY@"
	db TRAINERTYPE_MOVES

	db 42, TOXAPEX
		db SPIKES
		db POISON_JAB
		db WATER_PULSE
		db PROTECT

	db 37, GYARADOS
		db THRASH
		db DRAGONBREATH
		db WHIRLPOOL
		db SCARY_FACE

	db $ff

; =================

	; FISHER (9)
	db "GUY@"
	db TRAINERTYPE_MOVES

	db 40, LANTURN
		db THUNDERBOLT
		db SURF
		db FLASH
		db SLAM
		
	db 40, MANTINE
		db BUBBLEBEAM
		db AERIAL_ACE
		db DOUBLE_TEAM
		db SWAGGER

	db $ff

; =================

	; FISHER (10)
	db "BUDDY@"
	db TRAINERTYPE_MOVES

	db 40, RELICANTH
		db ROCK_THROW
		db DIVE
		db BUBBLEBEAM
		db 0
		
	db 42, LUMINEON
		db BUBBLEBEAM
		db ATTRACT
		db GUST
		db WATER_PULSE

	db $ff
; =================

	; FISHER (11)
	db "SHO@"
	db TRAINERTYPE_NORMAL

	db 43, OCTILLERY
	db 41, MANTINE

	db $ff
	
; =================

	; FISHER (12)
	db "GIN@"
	db TRAINERTYPE_PERSONALITY

	db 44, MAGIKARP, MALE_MASK
	db 45, GYARADOS, MALE_MASK | SHINY_MASK
	db 44, GYARADOS, MALE_MASK

	db $ff
	
; =================

	; FISHER (13)
	db "STEPHEN@"
	db TRAINERTYPE_NORMAL

	db 44, EXEGGUTOR
	db 44, PELIPPER
	db 44, PALOSSAND
	db 44, SCYTHER

	db $ff
; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "BRADY@"
	db TRAINERTYPE_NORMAL

	; party
	db 26, KABUTO

	db $ff ; end


	; HIKER (2)
	db "SOUR@"
	db TRAINERTYPE_PERSONALITY

	; party
	db 44, EXEGGUTOR, MALE_MASK | EXEGGUTOR_KANTONESE_FORM
	db 44, MAGNETON, MALE_MASK
	db 44, PORYGON, MALE_MASK
	db 44, MAGMAR, MALE_MASK

	db $ff ; end

; ================
; ================================


AthleteGroup:
; ================================
; ================

	; ATHLETE (1)
	db "PAUL@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, DODUO
	db 18, LICKITUNG
	db 18, PONYTA

	db $ff ; end

; ================

	; ATHLETE (2)
	db "JARED@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, DODUO
	db 24, JOLTEON

	db $ff ; end
	
; ================

	; ATHLETE (3)
	db "BARNEY@"
	db TRAINERTYPE_NORMAL

	db 42, RAPIDASH

	db $ff
	
; ================

	; ATHLETE (4)
	db "BRUCE@"
	db TRAINERTYPE_NORMAL

	db 40, DODUO
	db 40, DODUO
	db 40, DODRIO

	db $ff
	
; ================

	; ATHLETE (5)
	db "LARS@"
	db TRAINERTYPE_NORMAL

	db 40, TYROGUE
	db 40, HITMONCHAN
	db 40, HITMONLEE
	db 40, HITMONTOP

	db $ff
	
; ================

	; ATHLETE (6)
	db "ED@"
	db TRAINERTYPE_NORMAL

	db 40, PIKACHU
	db 40, RAICHU

	db $ff	
	
; ================

	; ATHLETE (7)
	db "SHELDON@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 44, ARCANINE, MALE_MASK
		db EXTREMESPEED
		db FLAMETHROWER
		db QUICK_ATTACK
		db ROAR

	db 42, POLIWRATH, MALE_MASK | POLIWRATH_NORMAL_FORM
		db RAIN_DANCE
		db ICE_PUNCH
		db WHIRLPOOL
		db MACH_PUNCH
		
	db 41, JUMPLUFF, MALE_MASK
		db RAZOR_LEAF
		db SYNTHESIS
		db GIGA_DRAIN
		db FAIRY_WIND

	db $ff
; ================
; ================================


SightseerMGroup:
; ================================
; ================

	; SIGHTSEERM (1)
	db "MITCH@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, KADABRA
	db 24, MACHOP

	db $ff ; end

; ================

	; SIGHTSEERM (2)
	db "LARRY@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 38, SALAZZLE, FEMALE_MASK
		db POISON_JAB
		db VENOSHOCK
		db AGILITY
		db FIRE_PUNCH

	db 39, BELLOSSOM, FEMALE_MASK
		db PETAL_DANCE
		db SLEEP_POWDER
		db LEECH_SEED
		db RAIN_DANCE

	db $ff

; ================

	; SIGHTSEERM (3)
	db "HANK@"
	db TRAINERTYPE_MOVES

	db 39, MAGMAR
		db FIRE_PUNCH
		db POISON_GAS
		db POISON_JAB
		db VENOSHOCK

	db 40, ELECTABUZZ
		db RAIN_DANCE
		db THUNDER
		db THUNDER_WAVE
		db QUICK_ATTACK
		
	db 41, JYNX
		db ICE_PUNCH
		db SWEET_KISS
		db PSYBEAM
		db ATTRACT

	db $ff

; ================

	; SIGHTSEERM (4)
	db "CORAL@"
	db TRAINERTYPE_MOVES + TRAINERTYPE_PERSONALITY

	db 44, CORSOLA, FEMALE_MASK
		db TOXIC
		db DIVE
		db SUBSTITUTE
		db REST

	db 44, CLEFABLE, MALE_MASK
		db METRONOME
		db MOONBLAST
		db DOUBLESLAP
		db ATTRACT
		
	db 44, RAICHU, MALE_MASK
		db PSYCHIC_M
		db THUNDERBOLT
		db SURF
		db SPARK

	db $ff

; ================
; ================================


SightseerFGroup:
; ================================
; ================

	; SIGHTSEERF (1)
	db "CONNIE@"
	db TRAINERTYPE_DVS

	; party
	db 25, JIGGLYPUFF, $98, $88
	db 25, SPINDA, SPINDA_J_DVS
	db 24, SKIPLOOM, $98, $88

	db $ff ; end
	
; ================

	; SIGHTSEERF (2)
	db "KELLY@"
	db TRAINERTYPE_MOVES

	; party
	db 38, WIGGLYTUFF
		db DAZZLINGLEAM
		db TAKE_DOWN
		db ENCORE
		db DOUBLESLAP
		
	db 38, GOLDUCK
		db PSYBEAM
		db SURF
		db REST
		db SLEEP_TALK

	db $ff ; end	

; ================

	; SIGHTSEERF (3)
	db "LANA@"
	db TRAINERTYPE_MOVES

	; party
	db 39, SYLVEON
		db DAZZLINGLEAM
		db SAND_ATTACK
		db ENCORE
		db QUICK_ATTACK

	db $ff ; end
; ================

	; SIGHTSEERF (4)
	db "FLORA@"
	db TRAINERTYPE_DVS

	; party
	db 36, DRATINI, $98, $88
	db 36, SPINDA, SPINDA_B_DVS
	db 36, EXEGGCUTE, $98, $88

	db $ff ; end

; ================
; ================================


WaitressGroup:
; ================================
; ================

	; WAITRESS (1)
	db "PAIGE@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, CLEFAIRY
	db 24, IVYSAUR
	db 24, POLIWHIRL

	db $ff ; end

; ================

	; WAITRESS (2)
	db "MISSY@"
	db TRAINERTYPE_NORMAL

	; party
	db 24, JIGGLYPUFF
	db 24, CHARMELEON
	db 24, PIKACHU

	db $ff ; end

; ================

	; WAITRESS (3)
	db "MARIN@"
	db TRAINERTYPE_PERSONALITY

	; party
	db 24, SMOOCHUM, FEMALE_MASK
	db 24, VULPIX, FEMALE_MASK
	db 24, VULPIX, MALE_MASK | VULPIX_KANTONESE_FORM

	db $ff ; end

; ================

	; WAITRESS (4)
	db "JUNE@"
	db TRAINERTYPE_NORMAL

	; party
	db 23, EEVEE
	db 23, MAGBY
	db 23, ELEKID
	db 23, MUNCHLAX

	db $ff ; end

; ================
; ================================


CooltrainerMGroup:
; ================================
; ================

	; COOLTRAINERM (1)
	db "AKIRA@"
	db TRAINERTYPE_NORMAL

	db 26, JYNX
	db 25, SEEL

	db $ff

; ================

	; COOLTRAINERM (2)
	db "JAKE@"
	db TRAINERTYPE_NORMAL

	db 34, GRAVELER
	db 33, HYPNO

	db $ff

; ================

	; COOLTRAINERM (3)
	db "LOGAN@"
	db TRAINERTYPE_NORMAL

	db 33, STEELIX
	db 34, MAGMAR

	db $ff

; ================

	; COOLTRAINERM (4)
	db "TAD@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 40, HITMONTOP, MALE_MASK
		db PROTECT
		db PURSUIT
		db TRIPLE_KICK
		db COUNTER

	db 40, POLIWRATH, MALE_MASK | POLIWRATH_TAD_FORM
		db DOUBLE_TEAM
		db HYPNOSIS
		db BODY_SLAM
		db ICE_BEAM

	db $ff
	

; ================

	; COOLTRAINERM (5)
	db "JEFF@"
	db TRAINERTYPE_NORMAL

	db 30, MR__MIME
	db 30, EXEGGCUTE
	db 31, RATICATE
	db 31, MACHOKE
	db 32, FEAROW
	db 32, TENTACRUEL

	db $ff
	

; ================

	; COOLTRAINERM (6)
	db "HUEY@"
	db TRAINERTYPE_MOVES

	db 38, DITTO
		db TRANSFORM
		db 0
		db 0
		db 0
		
	db 36, RAPIDASH
		db STOMP
		db FIRE_SPIN
		db AERIAL_ACE
		db FLAME_WHEEL

	db $ff
	
; ================

	; COOLTRAINERM (7)
	db "JACK@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 40, PERSIAN, MALE_MASK | PERSIAN_ALOLAN_FORM
		db AGILITY
		db PURSUIT
		db CRUNCH
		db ROAR
		
	 db 40, WIGGLYTUFF, FEMALE_MASK
		db SING
		db FACADE
		db REST
		db SLEEP_TALK

	db $ff
	
; ================

	; COOLTRAINERM (8)
	db "BRAD@"
	db TRAINERTYPE_MOVES | TRAINERTYPE_PERSONALITY

	db 40, PERSIAN, MALE_MASK | PERSIAN_NORMAL_FORM
		db AGILITY
		db PURSUIT
		db BODY_SLAM
		db ROAR
		
	db 40, EXEGGCUTE, MALE_MASK
		db SELFDESTRUCT
		db EGG_BOMB
		db LEECH_SEED
		db PROTECT
		
	 db 40, PINSIR, MALE_MASK
		db SLASH
		db SWORDS_DANCE
		db LEECH_LIFE
		db DOUBLE_TEAM

	db $ff
	
; ================

	; COOLTRAINERM (9)
	db "TRAD@"
	db TRAINERTYPE_MOVES

	 db 44, SNORLAX
		db HYPER_BEAM
		db REST
		db SURF
		db SLEEP_TALK

	db $ff
	
; ================

	; COOLTRAINERM (10)
	db "DAVID@"
	db TRAINERTYPE_NORMAL

	db 39, GOLBAT
	db 39, SKRELP

	db $ff
	
; ================

	; COOLTRAINERM (11)
	db "FABIO@"
	db TRAINERTYPE_NORMAL

	db 42, CHARIZARD
	db 41, CHARMELEON
	db 38, CHARMANDER

	db $ff

; ================

	; COOLTRAINERM (12)
	db "MIKE@"
	db TRAINERTYPE_NORMAL

	db 44, SCIZOR
	db 45, TRUMBEAK
	db 46, SHARPEDO
	db 45, RAICHU

	db $ff
	

; ================

	; COOLTRAINERM (13)
	db "MAKO@"
	db TRAINERTYPE_NORMAL

	db 44, UMBREON
	db 45, ESPEON
	db 46, POLIWHIRL
	db 45, SEADRA

	db $ff
	

; ================
; ================================


CooltrainerFGroup:
; ================================
; ================

	; COOLTRAINERF (1)
	db "KAREN@"
	db TRAINERTYPE_NORMAL

	db 26, SKIPLOOM
	db 26, ESPEON

	db $ff

; ================

	; COOLTRAINERF (2)
	db "PAULA@"
	db TRAINERTYPE_NORMAL

	db 35, DEWGONG

	db $ff

; ================

	; COOLTRAINERF (3)
	db "MAYA@"
	db TRAINERTYPE_NORMAL

	db 34, VILEPLUME
	db 34, SEADRA
	db 34, LYCANROC
	db 34, SALANDIT
	db 34, CHARMELEON

	db $ff
	

; ================

	; COOLTRAINERF (4)
	db "FREY@"
	db TRAINERTYPE_NORMAL

	db 40, VENUSAUR
	db 41, CLEFABLE

	db $ff
	
; ================

	; COOLTRAINERF (5)
	db "MARY@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 42, OMASTAR, FEMALE_MASK
		db SPIKE_CANNON
		db PROTECT
		db WATER_GUN
		db ANCIENTPOWER
	db 41, SANDSLASH, FEMALE_MASK | SANDSHREW_ALOLAN_FORM
		db ICE_BEAM
		db ICE_PUNCH
		db SWORDS_DANCE
		db SLASH
	db 40, NIDORINA, FEMALE_MASK
		db POISON_JAB
		db CRUNCH
		db SUPERSONIC
		db DOUBLE_KICK
	db 37, JYNX, FEMALE_MASK
		db ICE_BEAM
		db HYPNOSIS
		db ICE_PUNCH
		db PSYCHIC_M

	db $ff
	
; ================

	; COOLTRAINERF (6)
	db "LIZ@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	db 44, MAGCARGO, MALE_MASK
		db FLAMETHROWER
		db ROCK_SLIDE
		db SMOG
		db AMNESIA
	db 45, LANTURN, FEMALE_MASK
		db SPARK
		db WATER_GUN
		db CONFUSE_RAY
		db THUNDER_WAVE
	db 46, EXEGGUTOR, MALE_MASK | EXEGGUTOR_KANTONESE_FORM
		db EGG_BOMB
		db PSYCHIC_M
		db HYPNOSIS
		db SEED_BOMB

	db $ff
	
; =================

	; COOLTRAINERF (7)
	db "GRANNY@" ;FIRE
	db TRAINERTYPE_NORMAL

	db 44, VAPOREON
	db 44, LEAFEON
	db 44, SYLVEON
	db 44, EEVEE

	db $ff
	
; =================

	; COOLTRAINERF (8)
	db "GRANNY@" ;WATER
	db TRAINERTYPE_NORMAL

	db 44, JOLTEON
	db 44, FLAREON
	db 44, SYLVEON
	db 44, EEVEE

	db $ff
	
; =================

	; COOLTRAINERF (9)
	db "GRANNY@" ;GRASS
	db TRAINERTYPE_NORMAL

	db 44, GLACEON
	db 44, VAPOREON
	db 44, SYLVEON
	db 44, EEVEE

	db $ff
	
; =================

	; COOLTRAINERF (10)
	db "NUUK@"
	db TRAINERTYPE_MOVES
	
	db 46, TOGETIC
		db DAZZLINGLEAM
		db FAIRY_WIND
		db ATTRACT
		db SOFTBOILED

	db 46, CHIMECHO
		db PSYCHIC_M
		db FAIRY_WIND
		db DOUBLE_EDGE
		db HYPNOSIS

	db 46, VIBRAVA
		db DRAGON_TAIL
		db FLY
		db ROCK_BLAST
		db FAINT_ATTACK

	db $ff

; ================
; ================================


CatmanGroup:
; ================================
; ================

	; CATMAN (1)
	db "FRED@"
	db TRAINERTYPE_PERSONALITY

	db 42, ONIX, MALE_MASK | ONIX_NORMAL_FORM
	db 42, NIDOKING, MALE_MASK

	db $ff

	; CATMAN (2)
	db "KENT@"
	db TRAINERTYPE_NORMAL

	db 41, SCYTHER
	db 41, HAUNTER
	db 41, LICKITUNG

	db $ff

	; CATMAN (3)
	db "NATE@"
	db TRAINERTYPE_NORMAL

	db 40, GOLBAT
	db 40, GOLDUCK
	db 40, SANDSHREW
	db 40, FEAROW

	db $ff

	; CATMAN (4)
	db "NOAH@"
	db TRAINERTYPE_DVS

	db 42, KINGLER, $98, $88
	db 41, GRAVELER, $98, $88
	db 40, SPINDA, SPINDA_C_DVS

	db $ff

	; CATMAN (5)
	db "GRANT@"
	db TRAINERTYPE_PERSONALITY

	db 45, MUK, MALE_MASK | MUK_KANTONESE_FORM

	db $ff

	; CATMAN (6)
	db "MAYO@"
	db TRAINERTYPE_PERSONALITY

	db 44, NINETALES, MALE_MASK
	db 45, VAPOREON, MALE_MASK
	db 46, LYCANROC, FEMALE_MASK | LYCANROC_MIDNIGHT_FORM
	db 47, VIBRAVA, MALE_MASK

	db $ff
; ================
; ================================


BirdkeeperGroup:
; ================================
; ================
	; BIRDKEEPER (1)
	db "FLOYD@"
	db TRAINERTYPE_NORMAL

	db 29, PIDGEOTTO
	db 28, TRUMBEAK
	db 27, CHATOT
	db 26, PELIPPER

	db $ff
	
; ================
	; BIRDKEEPER (2)
	db "DWIGHT@"
	db TRAINERTYPE_NORMAL

	db 42, PIDGEOTTO
	db 41, TOUCANNON

	db $ff
	
; ================
	; BIRDKEEPER (3)
	db "CID@"
	db TRAINERTYPE_NORMAL

	db 42, PIDGEOT

	db $ff

; ================
; ================================

CrossGroup:
; ================================
; ================ TANGELO JUNGLE (PICK CHARMANDER)

	; CROSS (1)
	db "CROSS@"
	db TRAINERTYPE_MOVES

	; party

	db 14, SQUIRTLE
		db WITHDRAW
		db WATER_GUN
		db TACKLE
		db BUBBLE

	db 13, ROCKRUFF
		db ROCK_THROW
		db TACKLE
		db GROWL
		db NO_MOVE

	db 12, EEVEE
		db TACKLE
		db SAND_ATTACK
		db GROWL
		db NO_MOVE

	db $ff ; end
; ================ (PICK SQUIRTLE)

	; CROSS (2)
	db "CROSS@"
	db TRAINERTYPE_MOVES

	; party

	db 14, BULBASAUR
		db TACKLE
		db VINE_WHIP
		db LEECH_SEED
		db GROWL

	db 13, ROCKRUFF
		db ROCK_THROW
		db TACKLE
		db GROWL
		db NO_MOVE
	
	db 12, EEVEE
		db TACKLE
		db SAND_ATTACK
		db GROWL
		db NO_MOVE

	db $ff ; end
; ================ TANGELO JUNGLE(PICK BULBASAUR)

	; CROSS (3)
	db "CROSS@"
	db TRAINERTYPE_MOVES

	; party

	db 14, CHARMANDER
		db METAL_CLAW
		db EMBER
		db SMOKESCREEN
		db SCRATCH

	db 13, ROCKRUFF
		db ROCK_THROW
		db TACKLE
		db GROWL
		db NO_MOVE
		
	db 12, EEVEE
		db TACKLE
		db SAND_ATTACK
		db GROWL
		db NO_MOVE

	db $ff ; end

; ================ MT NAVEL (PICK CHARMANDER)

	; CROSS (4)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 27, WARTORTLE, MALE_MASK
		db BUBBLEBEAM
		db BITE
		db SURF
		db NASTY_PLOT

	db 27, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db BITE
		db FORESIGHT
		db MUD_SLAP

	db 26, FLAREON, MALE_MASK
		db FLAMETHROWER
		db BITE
		db QUICK_ATTACK
		db SUNNY_DAY

	db $ff ; end

; ================ MT NAVEL (PICK SQUIRTLE)

	; CROSS (5)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 27, IVYSAUR, MALE_MASK
		db RAZOR_LEAF
		db LEECH_SEED
		db SLEEP_POWDER
		db NASTY_PLOT

	db 27, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db BITE
		db FORESIGHT
		db MUD_SLAP

	db 26, VAPOREON, MALE_MASK
		db BUBBLEBEAM
		db BITE
		db QUICK_ATTACK
		db RAIN_DANCE

	db $ff ; end

; ================ MT NAVEL (PICK BULBASAUR)

	; CROSS (6)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 27, CHARMELEON, MALE_MASK
		db FLAMETHROWER
		db SLASH
		db SMOKESCREEN
		db NASTY_PLOT

	db 27, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db BITE
		db FORESIGHT
		db MUD_SLAP

	db 26, LEAFEON, MALE_MASK
		db RAZOR_LEAF
		db BITE
		db QUICK_ATTACK
		db GROWTH

	db $ff ; end

; ================ MURCOTT (PICK CHARMANDER)

	; CROSS (7)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 33, BLASTOISE, MALE_MASK
		db BUBBLEBEAM
		db BITE
		db SURF
		db NASTY_PLOT

	db 34, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db ROCK_SMASH

	db 33, FLAREON, MALE_MASK
		db FLAMETHROWER
		db BITE
		db QUICK_ATTACK
		db SUNNY_DAY

	db 31, SKARMORY, MALE_MASK
		db STEEL_WING
		db AERIAL_ACE
		db SWORDS_DANCE
		db WHIRLWIND

	db $ff ; end

; ================ MURCOTT (PICK SQUIRTLE)

	; CROSS (8)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 33, VENUSAUR, MALE_MASK
		db GIGA_DRAIN
		db LEECH_SEED
		db PETAL_DANCE
		db NASTY_PLOT

	db 34, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db ROCK_SMASH

	db 33, VAPOREON, MALE_MASK
		db BUBBLEBEAM
		db BITE
		db QUICK_ATTACK
		db RAIN_DANCE

	db 31, SKARMORY, MALE_MASK
		db STEEL_WING
		db AERIAL_ACE
		db SWORDS_DANCE
		db WHIRLWIND

	db $ff ; end

; ================ MURCOTT (PICK BULBASAUR)

	; CROSS (9)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 33, CHARIZARD, MALE_MASK
		db FLAMETHROWER
		db DRAGON_TAIL
		db SLASH
		db SMOKESCREEN

	db 34, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db ROCK_SMASH

	db 33, LEAFEON, MALE_MASK
		db RAZOR_LEAF
		db BITE
		db QUICK_ATTACK
		db GROWTH

	db 31, SKARMORY, MALE_MASK
		db STEEL_WING
		db AERIAL_ACE
		db SWORDS_DANCE
		db WHIRLWIND

	db $ff ; end
	
; ================ BUTWAL (PICK CHARMANDER)

	; CROSS (10)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 44, BLASTOISE, MALE_MASK
		db DIVE
		db CRUNCH
		db RAPID_SPIN
		db NASTY_PLOT

	db 45, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 42, FLAREON, MALE_MASK
		db FLAMETHROWER
		db BITE
		db QUICK_ATTACK
		db SUNNY_DAY

	db 44, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 42, TANGELA, MALE_MASK
		db ANCIENTPOWER
		db LEECH_SEED
		db GIGA_DRAIN
		db GROWTH

	db $ff ; end

; ================ BUTWAL (PICK SQUIRTLE)

	; CROSS (11)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 44, VENUSAUR, MALE_MASK
		db GIGA_DRAIN
		db LEECH_SEED
		db PETAL_DANCE
		db NASTY_PLOT

	db 45, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 42, VAPOREON, MALE_MASK
		db DIVE
		db BITE
		db SURF
		db RAIN_DANCE

	db 44, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 42, PONYTA, MALE_MASK
		db STOMP
		db FLAME_WHEEL
		db AGILITY
		db SUNNY_DAY

	db $ff ; end

; ================ BUTWAL (PICK BULBASAUR)

	; CROSS (12)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 44, CHARIZARD, MALE_MASK
		db FLAMETHROWER
		db DRAGON_TAIL
		db SLASH
		db STRENGTH

	db 45, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 42, LEAFEON, MALE_MASK
		db RAZOR_LEAF
		db BITE
		db AGILITY
		db GROWTH

	db 44, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 42, SLOWBRO, MALE_MASK
		db DIVE
		db SURF
		db REST
		db AMNESIA

	db $ff ; end
	
; ================ PUMMELO (PICK CHARMANDER)

	; CROSS (13)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 59, BLASTOISE, MALE_MASK
		db DIVE
		db CRUNCH
		db RAPID_SPIN
		db NASTY_PLOT

	db 57, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 56, FLAREON, MALE_MASK
		db FLAMETHROWER
		db BITE
		db QUICK_ATTACK
		db SUNNY_DAY

	db 58, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 59, TANGROWTH, MALE_MASK
		db ANCIENTPOWER
		db LEECH_SEED
		db GIGA_DRAIN
		db SOLARBEAM
		
	db 55, MAGMORTAR, MALE_MASK
		db FIRE_PUNCH
		db SMOKESCREEN
		db POISON_GAS
		db FLAMETHROWER

	db $ff ; end

; ================ PUMMELO (PICK SQUIRTLE)

	; CROSS (14)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 59, VENUSAUR, MALE_MASK
		db GIGA_DRAIN
		db LEECH_SEED
		db PETAL_DANCE
		db NASTY_PLOT

	db 57, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 56, VAPOREON, MALE_MASK
		db DIVE
		db BITE
		db SURF
		db RAIN_DANCE

	db 58, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 59, RAPIDASH, MALE_MASK
		db STOMP
		db FLAME_WHEEL
		db AGILITY
		db SUNNY_DAY
		
	db 55, ELECTIVIRE, MALE_MASK
		db THUNDERPUNCH
		db THUNDER_WAVE
		db DYNAMICPUNCH
		db THUNDERBOLT

	db $ff ; end

; ================ PUMMELO (PICK BULBASAUR)

	; CROSS (15)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 59, CHARIZARD, MALE_MASK
		db FLAMETHROWER
		db DRAGON_TAIL
		db SLASH
		db STRENGTH

	db 57, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 56, LEAFEON, MALE_MASK
		db RAZOR_LEAF
		db BITE
		db AGILITY
		db GROWTH

	db 58, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 59, SLOWBRO, MALE_MASK
		db DIVE
		db SURF
		db REST
		db AMNESIA
		
	db 55, JYNX, FEMALE_MASK
		db ICE_PUNCH
		db SING
		db SWEET_KISS
		db BLIZZARD

	db $ff ; end

; ================ ROUTE 51 (PICK CHARMANDER)

	; CROSS (16)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 74, BLASTOISE, MALE_MASK
		db DIVE
		db CRUNCH
		db RAPID_SPIN
		db NASTY_PLOT

	db 72, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 73, FLAREON, MALE_MASK
		db FLAMETHROWER
		db BITE
		db QUICK_ATTACK
		db SUNNY_DAY

	db 73, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 72, MAGMORTAR, MALE_MASK
		db FIRE_PUNCH
		db SMOKESCREEN
		db POISON_GAS
		db FLAMETHROWER

	db 75, MARSHADOW
		db SHADOW_BALL
		db DIZZY_PUNCH
		db NASTY_PLOT
		db SPECTRATHIEF

	db $ff ; end

; ================ ROUTE 51 (PICK SQUIRTLE)

	; CROSS (17)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 74, VENUSAUR, MALE_MASK
		db GIGA_DRAIN
		db LEECH_SEED
		db PETAL_DANCE
		db NASTY_PLOT

	db 72, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 73, VAPOREON, MALE_MASK
		db DIVE
		db BITE
		db SURF
		db RAIN_DANCE

	db 73, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 72, ELECTIVIRE, MALE_MASK
		db THUNDERPUNCH
		db THUNDER_WAVE
		db DYNAMICPUNCH
		db THUNDERBOLT

	db 75, MARSHADOW
		db SHADOW_BALL
		db DIZZY_PUNCH
		db NASTY_PLOT
		db SPECTRATHIEF

	db $ff ; end

; ================ ROUTE 51 (PICK BULBASAUR)

	; CROSS (18)
	db "CROSS@"
	db TRAINERTYPE_PERSONALITY | TRAINERTYPE_MOVES

	; party

	db 74, CHARIZARD, MALE_MASK
		db FLAMETHROWER
		db DRAGON_TAIL
		db SLASH
		db STRENGTH

	db 72, LYCANROC, MALE_MASK | LYCANROC_MIDNIGHT_FORM
		db ACCELEROCK
		db CRUNCH
		db FORESIGHT
		db EARTH_POWER

	db 73, LEAFEON, MALE_MASK
		db RAZOR_LEAF
		db BITE
		db AGILITY
		db GROWTH

	db 73, SKARMORY, MALE_MASK
		db DRILL_PECK
		db AERIAL_ACE
		db SWORDS_DANCE
		db FLY
		
	db 72, SLOWBRO, MALE_MASK
		db DIVE
		db SURF
		db REST
		db AMNESIA
		
	db 75, MARSHADOW
		db SHADOW_BALL
		db DIZZY_PUNCH
		db NASTY_PLOT
		db SPECTRATHIEF

	db $ff ; end

; ================
; ================================

OtakuGroup:
; ================
;=================================

; =================

	; OTAKU (1)
	db "CHRIS@"
	db TRAINERTYPE_MOVES

	db 39, PORYGON
		db CONVERSION
		db CONVERSION2
		db TRI_ATTACK
		db PROTECT
		
	db 39, PORYGON2
		db TRI_ATTACK
		db NASTY_PLOT
		db SWAGGER
		db THUNDERBOLT

	db $ff	

; =================

	; OTAKU (2)
	db "RALPH@"
	db TRAINERTYPE_MOVES

	db 40, MAGNEZONE
		db HYPER_BEAM
		db SWAGGER
		db LOCK_ON
		db FLASH_CANNON

	db $ff	
	
; =================

	; OTAKU (3)
	db "SEAN@"
	db TRAINERTYPE_MOVES

	db 40, JUMPLUFF
		db GIGA_DRAIN
		db SLEEP_POWDER
		db LEECH_SEED
		db SPLASH
		
	db 40, SANDSLASH
		db DIG
		db METAL_CLAW
		db DEFENSE_CURL
		db ROLLOUT

	db $ff	
	
; =================

	; OTAKU (4)
	db "DOC@"
	db TRAINERTYPE_MOVES

	db 40, GOLDUCK
		db PSYBEAM
		db ICE_BEAM
		db SURF
		db REST
		
	db 40, MAGNETON
		db TRI_ATTACK
		db THUNDERBOLT
		db THUNDER_WAVE
		db STEEL_WING

	db $ff	
	
; =================

	; OTAKU (4)
	db "ABE@"
	db TRAINERTYPE_MOVES

	db 41, DUGTRIO
		db TRI_ATTACK
		db DIG
		db MAGNITUDE
		db SAND_ATTACK
		
	db 42, MAGNETON
		db TRI_ATTACK
		db THUNDERBOLT
		db THUNDER_WAVE
		db FLASH

	db $ff
	
; =================

	; OTAKU (5)
	db "RWNE@"
	db TRAINERTYPE_MOVES

	db 44, SCYTHER
		db SLASH
		db WING_ATTACK
		db SWORDS_DANCE
		db PURSUIT
		
	db 44, SEADRA
		db WATER_PULSE
		db BUBBLEBEAM
		db SMOKESCREEN
		db DIVE
		
	db 44, MAGNETON
		db ZAP_CANNON
		db FLASH_CANNON
		db SUPERSONIC
		db THUNDER_WAVE
		
	db 44, NIDOKING
		db SURF
		db DOUBLE_KICK
		db POISON_JAB
		db EARTHQUAKE

	db $ff

JaceGroup:
; ================================
; ================

	; JACE (1)
	db "JACE@"
	db TRAINERTYPE_MOVES + TRAINERTYPE_ITEM + TRAINERTYPE_DVS + TRAINERTYPE_PERSONALITY

	; party

	db 24, ROCKRUFF, HARD_STONE, 00, 00, MALE_MASK
		db ROCK_THROW
		db ROAR
		db BITE
		db DIG

	db 25, CORSOLA, GOLD_BERRY, 00, 00, FEMALE_MASK
		db RAPID_SPIN
		db WATERFALL
		db ROCK_THROW
		db PROTECT

	db 26, SCIZOR, QUICK_CLAW, 00, 00, MALE_MASK
		db METAL_CLAW
		db FLY
		db BUG_BITE
		db SLASH
		
	db 27, TOGEKISS, LEFTOVERS, 00, 00, FEMALE_MASK
		db REST
		db SLEEP_TALK
		db PROTECT
		db DAZZLINGLEAM
		
	db 28, PORYGON_Z, MAGNET, 00, 00, MALE_MASK
		db TRI_ATTACK
		db CONVERSION
		db PROTECT
		db THUNDERBOLT
		
	db 29, MIMIKYU, SPELL_TAG, 00, 00, MALE_MASK
		db PLAY_ROUGH
		db SHADOW_BALL
		db SUBSTITUTE
		db WOOD_HAMMER

	db $ff ; end

KurtGroup:
; ================================
; ================

	; KURT (1)
	db "KURT@"
	db TRAINERTYPE_MOVES + TRAINERTYPE_ITEM + TRAINERTYPE_DVS + TRAINERTYPE_PERSONALITY

	; party
	
	db 34, RAICHU, TWISTEDSPOON, 00, 00, MALE_MASK
		db PSYCHIC
		db THUNDERBOLT
		db DOUBLE_TEAM
		db SURF
		
	db 35, NIDOKING, SCOPE_LENS, 00, 00, MALE_MASK
		db POISON_JAB
		db AMNESIA
		db PROTECT
		db FIRE_PUNCH
		
	db 36, PIDGEOT, BERSERK_GENE, 00, 00, MALE_MASK
		db FLY
		db FAINT_ATTACK
		db ENDURE
		db PURSUIT
		
	db 37, BLASTOISE, LEFTOVERS, 00, 00, MALE_MASK
		db HYDRO_PUMP
		db ZAP_CANNON
		db BODY_SLAM
		db AMNESIA
		
	db 38, VENUSAUR, BRIGHTPOWDER, 00, 00, MALE_MASK
		db DOUBLE_TEAM
		db SEED_BOMB
		db LEECH_SEED
		db TOXIC
		
	db 39, CHARIZARD, BLACKGLASSES, 00, 00, MALE_MASK
		db FLAMETHROWER
		db CRUNCH
		db LOCK_ON
		db FISSURE
		
	db $ff

KatGroup:
; ================================
; ================

	; KAT (1)
	db "KAT@"
	db TRAINERTYPE_MOVES + TRAINERTYPE_ITEM + TRAINERTYPE_DVS + TRAINERTYPE_PERSONALITY

	; party
	
	db 44, MIMIKYU, LEFTOVERS, 00, 00, FEMALE_MASK
		db ATTRACT
		db PLAY_ROUGH
		db SHADOW_CLAW
		db WOOD_HAMMER
		
	db 45, AMPHAROS, MAGNET, 00, 00, MALE_MASK
		db THUNDER_WAVE
		db THUNDERBOLT
		db POWER_GEM
		db SIGNAL_BEAM
		
	db 46, TANGROWTH, LEFTOVERS, 00, 00, MALE_MASK | PINK_MASK
		db EARTHQUAKE
		db POISON_JAB
		db WOOD_HAMMER
		db SLEEP_POWDER
		
	db 47, SALAZZLE, POISON_BARB, 00, 00, FEMALE_MASK
		db NASTY_PLOT
		db FIRE_BLAST
		db SLUDGE_BOMB
		db DRAGON_PULSE
		
	db 48, CLEFABLE, LEFTOVERS, 00, 00, FEMALE_MASK
		db ATTRACT
		db MOONBLAST
		db TOXIC
		db FIRE_BLAST
		
	db 49, OMASTAR, MYSTIC_WATER, 00, 00, MALE_MASK
		db WATER_PULSE
		db ICE_BEAM
		db ANCIENTPOWER
		db EARTH_POWER
		
	db $ff

AliceGroup:
; ================================
; ================

	; ALICE (1)
	db "ALICE@"
	db TRAINERTYPE_MOVES + TRAINERTYPE_ITEM + TRAINERTYPE_DVS + TRAINERTYPE_PERSONALITY

	; party
	
	db 54, BLISSEY, LEFTOVERS, 00, 00, FEMALE_MASK
		db SOFTBOILED
		db ICE_BEAM
		db FLAMETHROWER
		db TOXIC
		
	db 55, UMBREON, LEFTOVERS, 00, 00, FEMALE_MASK
		db CHARM
		db PURSUIT
		db REST
		db TOXIC
		
	db 56, SNORLAX, LEFTOVERS, 00, 00, MALE_MASK
		db DOUBLE_EDGE
		db REST
		db CURSE
		db SLEEP_TALK
		
	db 57, SKARMORY, LEFTOVERS, 00, 00, MALE_MASK
		db WHIRLWIND
		db REST
		db DRILL_PECK
		db CURSE
		
	db 58, MAROWAK, THICK_CLUB, 00, 00, MALE_MASK
		db FIRE_PUNCH
		db SHADOW_BONE
		db SWORDS_DANCE
		db TOXIC
		
	db 59, SYLVEON, POLKADOT_BOW, 00, 00, FEMALE_MASK | SHINY_MASK
		db MOONBLAST
		db PROTECT
		db SHADOW_BALL
		db ATTRACT
		
	db $ff

;GentlemanGroup:
; ================================
; ================
; ================
; ================================


;TeacherGroup:
; ================================
; ================
; ================
; ================================


SailorGroup:
; ================================
; ================
; ================
; ================================


;SuperNerdGroup:
; ================================
; ================
; ================
; ================================


;GuitaristGroup:
; ================================
; ================
; ================
; ================================


;BikerGroup:
; ================================
; ================
; ================
; ================================


;FirebreatherGroup:
; ================================
; ================
; ================
; ================================


;JugglerGroup:
; ================================
; ================
; ================
; ================================


BlackbeltGroup:
; ================================
; ================

; =================

	; BLACKBELT (1)
	db "KEN@"
	db TRAINERTYPE_MOVES

	db 40, MACHOKE
		db SUBMISSION
		db FIRE_PUNCH
		db KARATE_CHOP
		db NO_MOVE
		
	db 40, MACHOKE
		db THUNDERPUNCH
		db LOW_KICK
		db SUBMISSION
		db NO_MOVE
		
	db 40, MACHOKE
		db ICE_PUNCH
		db SUBMISSION
		db SEISMIC_TOSS
		db NO_MOVE

	db $ff	
	
; =================

	; BLACKBELT (2)
	db "STEPPO@"
	db TRAINERTYPE_MOVES

	db 44, STEELIX
		db IRON_TAIL
		db ROCK_SLIDE
		db DIG
		db EARTH_POWER
		
	db 44, SHARPEDO
		db WATERFALL
		db CRUNCH
		db GLARE
		db MEAN_LOOK
		
	db 44, ELECTABUZZ
		db THUNDER_WAVE
		db THUNDERBOLT
		db AGILITY
		db THUNDERPUNCH
		
	db 50, MAGCARGO
		db FLAMETHROWER
		db ROLLOUT
		db ROCK_SMASH
		db DEFENSE_CURL

	db $ff	
; ================
; ================================


;PsychicGroup:
; ================================
; ================
; ================
; ================================


;PicnickerGroup:
; ================================
; ================
; ================
; ================================


;SageGroup:
; ================================
; ================
; ================
; ================================


;MediumGroup:
; ================================
; ================
; ================
; ================================


;PokefanMGroup:
; ================================
; ================
; ================
; ================================


;PokefanFGroup:
; ================================
; ================
; ================
; ================================

DiverMaleGroup:
; ================================
; ================

	; DIVER_M (1)
	db "VICTOR@"
	db TRAINERTYPE_NORMAL

	; party
	db 40, SEADRA
	db 42, HORSEA
	db 40, SEAKING

	db $ff ; end

; ================

	; DIVER_M (2)
	db "PHIL@"
	db TRAINERTYPE_NORMAL

	; party
	db 40, STUNFISK
	db 38, GYARADOS

	db $ff ; end

; ================

	; DIVER_M (3)
	db "CAOS@"
	db TRAINERTYPE_NORMAL

	; party
	db 44, MAREANIE
	db 44, MANTINE
	db 44, SEADRA

	db $ff ; end

; ================

	; DIVER_M (4)
	db "ORION@"
	db TRAINERTYPE_NORMAL | TRAINERTYPE_MOVES

	; party
	db 44, GLACEON
		db BLIZZARD
		db ICE_BEAM
		db BITE
		db HAIL
	db 44, AMPHAROS
		db THUNDER
		db THUNDER_WAVE
		db COTTON_SPORE
		db DIZZY_PUNCH
	db 44, SUNFLORA
		db SUNNY_DAY
		db SOLARBEAM
		db GIGA_DRAIN
		db PETAL_DANCE
	db 44, AZUMARILL
		db ROLLOUT
		db DIVE
		db DOUBLE_EDGE
		db RAIN_DANCE

	db $ff ; end

; ================

DiverFemaleGroup:
; ================================
; ================

	; DIVER_F (1)
	db "ELLEN@"
	db TRAINERTYPE_NORMAL

	; party
	db 39, STARYU
	db 40, STARMIE
	db 39, CORSOLA
	db 40, DRATINI

	db $ff ; end
	
; ================

	; DIVER_F (2)
	db "HEIDI@"
	db TRAINERTYPE_NORMAL

	; party
	db 42, TOXAPEX

	db $ff ; end

; ================

EngineerGroup:
; ================================
; ================

	; ENGINEER (1)
	db "NICK@"
	db TRAINERTYPE_NORMAL

	; party
	db 17, MAGNEMITE
	db 16, VOLTORB
	db 15, PIKACHU

	db $ff ; end
; ================

	; ENGINEER (2)
	db "HENRY@"
	db TRAINERTYPE_NORMAL

	; party
	db 19, ELEKID

	db $ff ; end
; ================

	; ENGINEER (3)
	db "STEVE@"
	db TRAINERTYPE_NORMAL

	; party
	db 13, VOLTORB
	db 14, VOLTORB
	db 15, VOLTORB
	db 16, VOLTORB

	db $ff ; end
	
; =================

	; ENGINEER (4)
	db "KALARIE@"
	db TRAINERTYPE_MOVES

	db 44, LAPRAS
		db WATERFALL
		db SING
		db PERISH_SONG
		db ICE_BEAM

	db 44, MUNCHLAX
		db REST
		db SLEEP_TALK
		db BODY_SLAM
		db HYPER_BEAM

	db 44, CHARIZARD
		db FLAMETHROWER
		db FLY
		db SLASH
		db METAL_CLAW

	db $ff
; ================

RaymondGroup:
; ================================
; ================

	; RAYMOND (1)
	db "RAYMOND@"
	db TRAINERTYPE_MOVES

	db 60, DONPHAN
		db ROLLOUT
		db DEFENSE_CURL
		db EARTHQUAKE
		db ROCK_SMASH

	db 60, MACHAMP
		db SUBMISSION
		db THUNDERPUNCH
		db ICE_PUNCH
		db FIRE_PUNCH

	db 60, VENOMOTH
		db SIGNAL_BEAM
		db LEECH_LIFE
		db SLEEP_POWDER
		db PSYCHIC_M

	db 60, PINSIR
		db GUILLOTINE
		db VITAL_THROW
		db SWORDS_DANCE
		db COUNTER

	db 60, GOLEM
		db EXPLOSION
		db EARTHQUAKE
		db ROCK_SLIDE
		db MAGNITUDE

	db 60, HYPNO
		db FUTURE_SIGHT
		db HYPNOSIS
		db DREAM_EATER
		db ZEN_HEADBUTT

	db $ff

; ================
; ================================

CrookGroup:
; ================================
; ================
; ================
; ================================

ScuzGroup:
; ================================
; ================
	; LACKEY (1)
	db "LACKEY@"
	db TRAINERTYPE_MOVES

	db 56, PELIPPER
		db WING_ATTACK
		db WATER_PULSE
		db DIVE
		db STEEL_WING

	db 56, TENTACRUEL
		db POISON_JAB
		db WHIRLPOOL
		db CONFUSE_RAY
		db VENOSHOCK

	db $ff
; ================
; ================================
