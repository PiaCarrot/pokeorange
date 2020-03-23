_PokeFlute: ; f50c
	ld a, [wBattleMode]
	and a
	jr z, .not_in_battle
	xor a
	ld [wd002], a

	ld b, $ff ^ SLP

	ld hl, PartyMon1Status
	call .CureSleep

	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr z, .skip_otrainer
	ld hl, OTPartyMon1Status
	call .CureSleep
.skip_otrainer

	ld hl, BattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, EnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	
	ld hl, .PlayedTheFlute
	call PrintText
	push de
	ld de, SFX_POKEFLUTE2
	call WaitPlaySFX
	call WaitSFX
	pop de
	ld a, [wd002]
	and a
	jp nz, .sleeping

	ld hl, .CatchyTune
	jp PrintText

.sleeping
	ld hl, .AllSleepingMonWokeUp
	jp PrintText

.CureSleep:
	ld de, PARTYMON_STRUCT_LENGTH
	ld c, PARTY_LENGTH

.loop
	ld a, [hl]
	push af
	and SLP
	jr z, .not_asleep
	ld a, 1
	ld [wd002], a
.not_asleep
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret
; f56c

.not_in_battle:
ld hl, .PokefluteScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.PokefluteScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUsePokeflute
	iffalse .NothingHappenedScript
	farjump GrapefruitsSnorlax

.NothingHappenedScript:
	opentext
	writetext PokefluteOWText1
	playsound SFX_POKEFLUTE2
	waitsfx
	buttonsound
	writetext PokefluteOWText2
	waitbutton
	closetext
	end

.CheckCanUsePokeflute:
	farcall GetFacingObject
	jr c, .nope

	ld a, d
	cp SPRITEMOVEDATA_SNORLAX
	jr nz, .nope

	ld a, 1
	ld [ScriptVar], a
	ret

.nope
	xor a
	ld [ScriptVar], a
	ret


.CatchyTune: ; 0xf56c
	; Played the # FLUTE. Now, that's a catchy tune!
	text_jump UnknownText_0x1c5bf9
	db "@"
; 0xf571

.AllSleepingMonWokeUp: ; 0xf571
	; All sleeping #MON woke up.
	text_jump UnknownText_0x1c5c28
	db "@"
; 0xf576

.PlayedTheFlute: ; 0xf576
	; played the # FLUTE.@ @
	text_jump UnknownText_0x1c5c44
	start_asm
	ld a, [wBattleMode]
	and a
	jr nz, .battle

	push de
	ld de, SFX_POKEFLUTE2
	call WaitPlaySFX
	call WaitSFX
	pop de
	
.battle
	jp PokeFluteTerminatorCharacter
; f58f

PokefluteOWText1:
	text "<PLAYER> played the"
	line "# FLUTE."
	done
	
PokefluteOWText2:
	text "Now, that's a"
	line "catchy tune!"
	done