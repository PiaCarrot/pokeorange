; Audio interfaces.

MapSetup_Sound_Off:: ; 3b4e

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
	rst Bankswitch

	call _MapSetup_Sound_Off

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b6a


UpdateSound:: ; 3b6a

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	rst Bankswitch

	call _UpdateSound

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b86


_LoadMusicByte:: ; 3b86
; CurMusicByte = [a:de]
EXPORT LoadMusicByte

	rst Bankswitch

	ld a, [de]
	ld [CurMusicByte], a
	ld a, BANK(LoadMusicByte)

	rst Bankswitch
	ret
; 3b97


PlayMusic:: ; 3b97
; Play music de.

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; and BANK(_MapSetup_Sound_Off)
	rst Bankswitch

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
	pop af
	rst Bankswitch
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3bbc


PlayMusic2:: ; 3bbc
; Stop playing music, then play music de.

	push hl
	push de
	push bc
	push af

	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic)
	rst Bankswitch

	push de
	ld de, MUSIC_NONE
	call _PlayMusic
	call DelayFrame
	pop de
	call _PlayMusic

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret

; 3be3


PlayCryHeader:: ; 3be3
; Play cry header at hl.

	ld a, [hROMBank]
	push af

	; Cry headers are stuck in one bank.
	ld a, BANK(CryHeaders)
	rst Bankswitch
	
	ld a, [hli]
	cp $ff
	jr z, .ded
	ld e, a
	ld d, 0

	ld a, [hli]
	ld [CryPitch], a
	ld a, [hli]
	ld [CryPitch + 1], a
	ld a, [hli]
	ld [CryLength], a
	ld a, [hl]
	ld [CryLength + 1], a

	farcall _PlayCryHeader
	jr .done
.ded
	ld e, 0
	call LoadDEDCryHeader
	call PlayDEDCry

.done
	pop af
	rst Bankswitch
	ret
; 3c23

WaitPlaySFX::
	call WaitSFX

PlaySFX:: ; 3c23
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
	call CheckSFX
	jr nc, .play

	; Does it have priority?
	ld a, [CurSFX]
	cp e
	jr c, .done

.play
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
	rst Bankswitch

	ld a, e
	ld [CurSFX], a
	call _PlaySFX

	pop af
	rst Bankswitch

.done
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3c4e

WaitSFX:: ; 3c55
; infinite loop until sfx is done playing

	push hl
	jr .handleLoop
.wait
	call DelayFrame
.handleLoop
	ld hl, Channel5Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, Channel6Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, Channel7Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, Channel8Flags
	bit 0, [hl]
	jr nz, .wait

	pop hl
	ret
; 3c74

IsSFXPlaying:: ; 3c74
; Return carry if no sound effect is playing.
; The inverse of CheckSFX.
	push hl

	ld hl, Channel5Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, Channel6Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, Channel7Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, Channel8Flags
	bit 0, [hl]
	jr nz, .playing

	pop hl
	scf
	ret

.playing
	pop hl
	and a
	ret
; 3c97

MaxVolume:: ; 3c97
	ld a, $77 ; max
	ld [Volume], a
	ret
; 3c9d

LowVolume:: ; 3c9d
	ld a, $33 ; 40%
	ld [Volume], a
	ret
; 3ca3

VolumeOff:: ; 3ca3
	xor a
	ld [Volume], a
	ret
; 3ca8

FadeInMusic:: ; 3cae
	ld a, 4 | 1 << 7
	ld [MusicFade], a
	ret
; 3cb4

SkipMusic:: ; 3cb4
; Skip a frames of music.
.loop
	and a
	ret z
	dec a
	call UpdateSound
	jr .loop
; 3cbc

FadeToMapMusic:: ; 3cbc
	push hl
	push de
	push bc
	push af

	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	jr z, .done

	ld a, 8
	ld [MusicFade], a
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a
	ld a, e
	ld [wMapMusic], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3cdf

PlayMapMusic:: ; 3cdf
	push hl
	push de
	push bc
	push af

	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	jr z, .done

	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic

.done
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3d03

EnterMapMusic:: ; 3d03
	push hl
	push de
	push bc
	push af

	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld de, MUSIC_SKATEBOARD
	ld a, [PlayerState]
	cp PLAYER_BIKE
	jr z, .play
	call GetMapMusic
.play
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de

	ld a, e
	ld [wMapMusic], a
	call PlayMusic

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3d2f

TryRestartMapMusic:: ; 3d2f
	ld a, [wDontPlayMapMusicOnReload]
	and a
	jr z, RestartMapMusic
	xor a
	ld [wMapMusic], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ret
; 3d47

RestartMapMusic:: ; 3d47
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	call PlayMusic
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3d62

SpecialMapMusic:: ; 3d62
	ld a, [PlayerState]
	; cp PLAYER_SURF
	; jr z, .surf
	; cp PLAYER_SURF_PIKA
	; jr z, .surf

	; ld a, [StatusFlags2]
	; bit 2, a
	; jr nz, .contest

.no
	and a
	ret

.bike
	ld de, MUSIC_SKATEBOARD
	scf
	ret

; .surf
	; ld de, MUSIC_SURF
	; scf
	; ret

; .contest
	; ld a, [MapGroup]
	; cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
	; jr nz, .no
	; ld a, [MapNumber]
	; cp MAP_ROUTE_35_NATIONAL_PARK_GATE
	; jr z, .ranking
	; cp MAP_ROUTE_36_NATIONAL_PARK_GATE
	; jr nz, .no

; .ranking
	; ld de, MUSIC_BUG_CATCHING_CONTEST_RANKING
	; scf
	; ret
;3d97

GetMapMusic:: ; 3d97
	call SpecialMapMusic
	ret c
	jp GetMapHeaderMusic
; 3d9f

CheckSFX:: ; 3dde
; Return carry if any SFX channels are active.
	ld a, [Channel5Flags]
	bit 0, a
	jr nz, .playing
	ld a, [Channel6Flags]
	bit 0, a
	jr nz, .playing
	ld a, [Channel7Flags]
	bit 0, a
	jr nz, .playing
	ld a, [Channel8Flags]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret
; 3dfe

TerminateExpBarSound:: ; 3dfe
	xor a
	ld [Channel5Flags], a
	ld [SoundInput], a
	ld [rNR10], a
	ld [rNR11], a
	ld [rNR12], a
	ld [rNR13], a
	ld [rNR14], a
	ret
; 3e10


ChannelsOff:: ; 3e10
; Quickly turn off music channels
	xor a
	ld [Channel1Flags], a
	ld [Channel2Flags], a
	ld [Channel3Flags], a
	ld [Channel4Flags], a
	ld [SoundInput], a
	ret
; 3e21

SFXChannelsOff:: ; 3e21
; Quickly turn off sound effect channels
	xor a
	ld [Channel5Flags], a
	ld [Channel6Flags], a
	ld [Channel7Flags], a
	ld [Channel8Flags], a
	ld [SoundInput], a
	ret
; 3e32
