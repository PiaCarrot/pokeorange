_Squirtbottle: ; 50730
	ld hl, .SquirtbottleScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.SquirtbottleScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUseSquirtbottle
	iffalse .NothingHappenedScript

.NothingHappenedScript:
	jumptext .NothingHappenedText

.NothingHappenedText:
	; sprinkled water. But nothing happened…
	text_jump UnknownText_0x1c0b3b
	db "@"

.CheckCanUseSquirtbottle:
	ld a, [MapGroup]
	jr nz, .nope

	ld a, [MapNumber]
	jr nz, .nope

	farcall GetFacingObject
	jr c, .nope

	ld a, d
	cp SPRITEMOVEDATA_MIME__JR
	jr nz, .nope

	ld a, 1
	ld [ScriptVar], a
	ret

.nope
	xor a
	ld [ScriptVar], a
	ret
; 50779
