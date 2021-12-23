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
	and a
	jr nz, .invalid

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

	engine_flag PlayerGender, 0 ; player is female

	engine_flag wIsDST, 7 ; dst

	engine_flag BikeFlags, 0 ; strength active
	engine_flag BikeFlags, 1 ; always on bike (cant surf)
	engine_flag BikeFlags, 2 ; downhill (cycling road)

	engine_flag StatusFlags, 0 ; pokedex
	engine_flag StatusFlags, 3 ; pokerus
	engine_flag StatusFlags, 4 ; exp all
	engine_flag StatusFlags, 6 ; credits skip
	engine_flag StatusFlags, 7 ; bug contest on

	engine_flag StatusFlags2, 2 ; bug contest timer

	engine_flag Badges, 0 ; coral-eye badge
	engine_flag Badges, 1 ; sea ruby badge
	engine_flag Badges, 2 ; spike shell badge
	engine_flag Badges, 3 ; jade star badge

	; flypoints
	engine_flag VisitedSpawns + 0, 0 ; your house
	engine_flag VisitedSpawns + 0, 1 ; valencia
	engine_flag VisitedSpawns + 0, 2 ; tangelo
	engine_flag VisitedSpawns + 0, 3 ; mikan
									 ; route 52
	engine_flag VisitedSpawns + 0, 5 ; mandarin north
	engine_flag VisitedSpawns + 0, 6 ; sunburst
									 ; route 56 west
	engine_flag VisitedSpawns + 1, 0 ; kinnow
	engine_flag VisitedSpawns + 1, 1 ; navel
	engine_flag VisitedSpawns + 1, 2 ; moro
	engine_flag VisitedSpawns + 1, 3 ; murcott
	engine_flag VisitedSpawns + 1, 4 ; trovitopolis
	engine_flag VisitedSpawns + 1, 5 ; trovita
	engine_flag VisitedSpawns + 1, 6 ; ascorbia
	engine_flag VisitedSpawns + 1, 7 ; kumquat
	engine_flag VisitedSpawns + 2, 0 ; pummelo
	engine_flag VisitedSpawns + 2, 1 ; hamlin
	engine_flag VisitedSpawns + 2, 2 ; shamouti
	engine_flag VisitedSpawns + 2, 3 ; vermilion

	; wDaycareMan, 7 ; daycare 1 on
	engine_flag wDaycareMan, 6 ; egg is ready
	; wDaycareMan, 5 ; monster 1 and 2 are compatible
	engine_flag wDaycareMan, 0 ; monster 1 in daycare
	;   wDaycareLady, 7 = daycare 2 on
	engine_flag wDaycareLady, 0 ; monster 2 in daycare

	engine_flag DailyFlags, 0 ; daily bug contest
	engine_flag DailyFlags, 1 ; bargained today

	engine_flag WeeklyFlags, 0 ; tea in blues house
	engine_flag WeeklyFlags, 1 ; got haircut

	engine_flag SwarmFlags, 1 ; goldenrod dept store sale is on

	engine_flag wLuckyNumberShowFlag, 0 ; lucky number show

	engine_flag wPlayerSpriteSetupFlags, 2 ; female player has been transformed into male

	engine_flag SwarmFlags, 2 ; yanma swarm
