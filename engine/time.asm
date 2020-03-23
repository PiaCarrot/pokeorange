_InitializeStartDay: ; 113d6
	jp InitializeStartDay
; 113da

ClearDailyTimers: ; 113da
	xor a
	ld [wLuckyNumberDayBuffer], a
	ld [wDailyResetTimer], a
	ret
; 113e5

InitOneDayCountdown: ; 11413
	ld a, 1

InitNDaysCountdown: ; 11415
	ld [hl], a
	push hl
	call UpdateTime
	pop hl
	inc hl
	jp CopyDayToHL
; 11420

CheckDayDependentEventHL: ; 11420
	inc hl
	push hl
	call CalcDaysSince
	call GetDaysSince
	pop hl
	dec hl
	jp UpdateTimeRemaining
; 1142e

RestartDailyResetTimer: ; 1144c
	ld hl, wDailyResetTimer
	jp InitOneDayCountdown
; 11452

CheckDailyResetTimer:: ; 11452
	ld hl, wDailyResetTimer
	call CheckDayDependentEventHL
	ret nc
	xor a
	ld hl, DailyFlags
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wDailyRematchFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneItemFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneTimeOfDayFlags
rept 4
	ld [hli], a
endr
	jr RestartDailyResetTimer
; 11485

StartBugContestTimer: ; 11490
	ld a, 20
	ld [wBugContestMinsRemaining], a
	ld a, 0
	ld [wBugContestSecsRemaining], a
	call UpdateTime
	ld hl, wBugContestStartTime
	jp CopyDayHourMinSecToHL
; 114a4


CheckBugContestTimer:: ; 114a4 (4:54a4)
	ld hl, wBugContestStartTime
	call CalcSecsMinsHoursDaysSince
	ld a, [wDaysSince]
	and a
	jr nz, .timed_out
	ld a, [wHoursSince]
	and a
	jr nz, .timed_out
	ld a, [wSecondsSince]
	ld b, a
	ld a, [wBugContestSecsRemaining]
	sub b
	jr nc, .okay
	add 60

.okay
	ld [wBugContestSecsRemaining], a
	ld a, [wMinutesSince]
	ld b, a
	ld a, [wBugContestMinsRemaining]
	sbc b
	ld [wBugContestMinsRemaining], a
	jr c, .timed_out
	and a
	ret

.timed_out
	xor a
	ld [wBugContestMinsRemaining], a
	ld [wBugContestSecsRemaining], a
	scf
	ret


InitializeStartDay: ; 114dd
	call UpdateTime
	ld hl, wStartDay
	jp CopyDayToHL
; 114e7

CheckPokerusTick:: ; 114e7
	ld hl, wStartDay
	call CalcDaysSince
	call GetDaysSince
	and a
	jr z, .done ; not even a day has passed since game start
	ld b, a
	farcall ApplyPokerusTick
.done
	xor a
	ret
; 114fc

RestartLuckyNumberCountdown: ; 1152b
	call .GetDaysUntilNextFriday
	ld hl, wLuckyNumberDayBuffer
	jp InitNDaysCountdown
; 11534

.GetDaysUntilNextFriday: ; 11534
	call GetWeekday
	; a = FRIDAY - a
	cpl
	add FRIDAY + 1
	jr z, .friday_saturday
	ret nc

.friday_saturday
	add 7
	ret
; 11542

CheckLuckyNumberShowFlag: ; 11542
	ld hl, wLuckyNumberDayBuffer
	jp CheckDayDependentEventHL
; 11548

UpdateTimeRemaining: ; 11586
; If the amount of time elapsed exceeds the capacity of its
; unit, skip this part.
	cp -1
	jr z, .set_carry
	ld c, a
	ld a, [hl] ; time remaining
	sub c
	jr nc, .ok
	xor a

.ok
	ld [hl], a
	jr z, .set_carry
	xor a
	ret

.set_carry
	xor a
	ld [hl], a
	scf
	ret
; 11599

GetDaysSince: ; 115c8
	ld a, [wDaysSince]
	ret
; 115cc

CalcDaysSince: ; 115cf
	xor a
	jr _CalcDaysSince
; 115d2

CalcSecsMinsHoursDaysSince: ; 115db
	inc hl
	inc hl
	inc hl
	ld a, [hSeconds]
	ld c, a
	sub [hl]
	jr nc, .skip1
	add 60
.skip1
	ld [hl], c ; current seconds
	dec hl
	ld [wSecondsSince], a ; seconds since

;_CalcMinsHoursDaysSince: ; 115eb
	ld a, [hMinutes]
	ld c, a
	sbc [hl]
	jr nc, .skip2
	add 60
.skip2
	ld [hl], c ; current minutes
	dec hl
	ld [wMinutesSince], a ; minutes since

;_CalcHoursDaysSince: ; 115f8
	ld a, [hHours]
	ld c, a
	sbc [hl]
	jr nc, .skip3
	add 24
.skip3
	ld [hl], c ; current hours
	dec hl
	ld [wHoursSince], a ; hours since

_CalcDaysSince:
	ld a, [CurDay]
	ld c, a
	sbc [hl]
	jr nc, .skip4
	add 20 * 7
.skip4
	ld [hl], c ; current days
	ld [wDaysSince], a ; days since
	ret
; 11613

CopyDayHourMinSecToHL: ; 11613
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ld a, [hSeconds]
	ld [hli], a
	ret
; 11621

CopyDayToHL: ; 11621
	ld a, [CurDay]
	ld [hl], a
	ret
; 11626

CopyDayHourMinToHL: ; 1162e
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ret
; 11639
