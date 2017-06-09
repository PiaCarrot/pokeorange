EngineFlagAction:: ; 80430
; Do action b on engine flag de
;
;   b = 0: reset flag
;     = 1: set flag
;     > 1: check flag, result in c
;
; Setting/resetting does not return a result.


; 16-bit flag ids are considered invalid, but it's nice
; to know that the infrastructure is there.

	ld a, d
	cp 0
	jr z, .ceiling
	jr c, .read ; cp 0 can't set carry!
	jr .invalid

; There are only $a2 engine flags, so
; anything beyond that is invalid too.

.ceiling
	ld a, e
	cp NUM_ENGINE_FLAGS
	jr c, .read

; Invalid flags are treated as flag 00.

.invalid
	xor a
	ld e, a
	ld d, a

; Get this flag's location.

.read
	ld hl, EngineFlags
; location
	add hl, de
	add hl, de
; bit
	add hl, de

; location
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; bit
	ld c, [hl]

; What are we doing with this flag?

	ld a, b
	cp 1
	jr c, .reset ; b = 0
	jr z, .set   ; b = 1

; Return the given flag in c.
.check
	ld a, [de]
	and c
	ld c, a
	ret

; Set the given flag.
.set
	ld a, [de]
	or c
	ld [de], a
	ret

; Reset the given flag.
.reset
	ld a, c
	cpl ; AND all bits except the one in question
	ld c, a
	ld a, [de]
	and c
	ld [de], a
	ret
; 80462


EngineFlags: ; 80462
; All locations are in WRAM bank 1.
engine_flag: MACRO
	dwb \1, 1 << \2
ENDM
	; location, bit

	; pokegear
	engine_flag wPokegearFlags, 1 ; radio card
	engine_flag wPokegearFlags, 0 ; map card
	engine_flag wPokegearFlags, 2 ; phone card
	engine_flag wPokegearFlags, 3 ; expn card
	engine_flag wPokegearFlags, 7 ; on/off

	;   wDaycareMan, 7 ; daycare 1 on
	engine_flag wDaycareMan, 6 ; egg is ready
	;   wDaycareMan, 5 ; monster 1 and 2 are compatible
	engine_flag wDaycareMan, 0 ; monster 1 in daycare

	;   wDaycareLady, 7 = daycare 2 on
	engine_flag wDaycareLady, 0 ; monster 2 in daycare

	engine_flag wMomSavingMoney, 0 ; mom saving money
	engine_flag wMomSavingMoney, 7 ; dst

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused, possibly related to a 2-day timer

	engine_flag StatusFlags, 0 ; pokedex
	engine_flag StatusFlags, 3 ; pokerus
	engine_flag StatusFlags, 4 ; rocket signal on ch20
	engine_flag StatusFlags, 6 ; credits skip
	engine_flag StatusFlags, 7 ; bug contest on
	engine_flag StatusFlags2, 2 ; bug contest timer
	engine_flag StatusFlags2, 1 ; safari zone?
	engine_flag StatusFlags2, 0 ; rockets in radio tower
	engine_flag StatusFlags2, 4 ; bike shop call enabled (1024 bike steps reqd)
	engine_flag StatusFlags2, 5 ; give pokerus
	engine_flag StatusFlags2, 6 ; berry -> berry juice when trading?
	engine_flag StatusFlags2, 7 ; rockets in mahogany

	engine_flag BikeFlags, 0 ; strength active
	engine_flag BikeFlags, 1 ; always on bike (cant surf)
	engine_flag BikeFlags, 2 ; downhill (cycling road)

	engine_flag JohtoBadges, 0 ; zephyrbadge
	engine_flag JohtoBadges, 1 ; hivebadge
	engine_flag JohtoBadges, 2 ; plainbadge
	engine_flag JohtoBadges, 3 ; fogbadge
	engine_flag JohtoBadges, 4 ; mineralbadge
	engine_flag JohtoBadges, 5 ; stormbadge
	engine_flag JohtoBadges, 6 ; glacierbadge
	engine_flag JohtoBadges, 7 ; risingbadge

	engine_flag KantoBadges, 0 ; boulderbadge
	engine_flag KantoBadges, 1 ; cascadebadge
	engine_flag KantoBadges, 2 ; thunderbadge
	engine_flag KantoBadges, 3 ; rainbowbadge
	engine_flag KantoBadges, 4 ; soulbadge
	engine_flag KantoBadges, 5 ; marshbadge
	engine_flag KantoBadges, 6 ; volcanobadge
	engine_flag KantoBadges, 7 ; earthbadge

	; fly
	engine_flag VisitedSpawns, 0     ; your house
	engine_flag VisitedSpawns, 1     ; viridian pokecenter
	engine_flag VisitedSpawns, 2     ; pallet
	engine_flag VisitedSpawns, 3     ; viridian
	engine_flag VisitedSpawns, 4     ; pewter
	engine_flag VisitedSpawns, 5     ; cerulean
	engine_flag VisitedSpawns, 6     ; rock tunnel
	engine_flag VisitedSpawns, 7     ; vermilion
	engine_flag VisitedSpawns + 1, 0 ; lavender
	engine_flag VisitedSpawns + 1, 1 ; saffron
	engine_flag VisitedSpawns + 1, 2 ; celadon
	engine_flag VisitedSpawns + 1, 3 ; fuchsia
	engine_flag VisitedSpawns + 1, 4 ; cinnabar
	engine_flag VisitedSpawns + 1, 5 ; indigo plateau
	engine_flag VisitedSpawns + 1, 6 ; new bark
	engine_flag VisitedSpawns + 1, 7 ; tangelo
	engine_flag VisitedSpawns + 2, 0 ; mikan
	                                 ; union cave
	engine_flag VisitedSpawns + 2, 2 ; mandarin north
	engine_flag VisitedSpawns + 2, 3 ; cianwood
	engine_flag VisitedSpawns + 2, 4 ; goldenrod
	engine_flag VisitedSpawns + 2, 5 ; olivine
	engine_flag VisitedSpawns + 2, 6 ; ecruteak
	engine_flag VisitedSpawns + 2, 7 ; mahogany
	engine_flag VisitedSpawns + 3, 0 ; lake of rage
	engine_flag VisitedSpawns + 3, 1 ; blackthorn
	engine_flag VisitedSpawns + 3, 2 ; silver cave
	                                 ; fast ship
	engine_flag VisitedSpawns + 3, 4 ; unused

	engine_flag wLuckyNumberShowFlag, 0 ; lucky number show
	engine_flag StatusFlags2, 3 ; ????

	engine_flag DailyFlags, 0 ; kurt making balls
	engine_flag DailyFlags, 1 ; ????
	engine_flag DailyFlags, 2 ; special wilddata?
	engine_flag DailyFlags, 3 ; time capsule (24h wait)
	engine_flag DailyFlags, 4 ; all fruit trees
	engine_flag DailyFlags, 5 ; shuckle given
	engine_flag DailyFlags, 6 ; goldenrod underground merchant closed
	engine_flag DailyFlags, 7 ; fought in trainer hall today

	engine_flag WeeklyFlags, 0 ; mt moon square clefairy
	engine_flag WeeklyFlags, 1 ; union cave lapras
	engine_flag WeeklyFlags, 2 ; goldenrod underground haircut used
	engine_flag WeeklyFlags, 3 ; goldenrod mall happiness event floor05 person07
	engine_flag WeeklyFlags, 4 ; tea in blues house
	engine_flag WeeklyFlags, 5 ; indigo plateau rival fight
	engine_flag WeeklyFlags, 6 ; move tutor
	engine_flag WeeklyFlags, 7 ; buenas password

	engine_flag SwarmFlags, 0 ; ????
	engine_flag SwarmFlags, 1 ; goldenrod dept store sale is on

	engine_flag GameTimerPause, 7

	engine_flag PlayerGender, 0 ; player is female

	engine_flag wPlayerSpriteSetupFlags, 2 ; female player has been transformed into male

	engine_flag SwarmFlags, 2 ; dunsparce swarm   ; $a0
	engine_flag SwarmFlags, 3 ; yanma swarm

	engine_flag wCelebiEvent, 2 ; have gs ball after kurt examined it
