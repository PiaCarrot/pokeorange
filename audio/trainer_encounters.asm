; Currently, must be in the same bank as the sound engine.

PlayTrainerEncounterMusic:: ; e900a
; input: e = trainer type
	; turn fade off
	xor a
	ld [MusicFade], a
	; play nothing for one frame
	push de
	ld de, 0 ; id: Music_Nothing
	call PlayMusic
	call DelayFrame
	; play new song
	call MaxVolume
	pop de
	ld d, $00
	ld hl, TrainerEncounterMusic
	add hl, de
	ld e, [hl]
	jp PlayMusic
; e9027

TrainerEncounterMusic: ; e9027
	db MUSIC_HIKER_ENCOUNTER
	db MUSIC_LASS_ENCOUNTER			; cissy
	db MUSIC_YOUNGSTER_ENCOUNTER	; danny
	db MUSIC_YOUNGSTER_ENCOUNTER	; rudy
	db MUSIC_LASS_ENCOUNTER			; luana
	db MUSIC_YOUNGSTER_ENCOUNTER	; drake
	db MUSIC_TRACEY_ENCOUNTER		; tracey
	db MUSIC_TRACEY_ENCOUNTER		; tracey2
	db MUSIC_YOUNGSTER_ENCOUNTER	; brock
	db MUSIC_LASS_ENCOUNTER			; misty
	db MUSIC_YOUNGSTER_ENCOUNTER	; lt_surge
	db MUSIC_LASS_ENCOUNTER			; erika
	db MUSIC_YOUNGSTER_ENCOUNTER	; koga
	db MUSIC_LASS_ENCOUNTER			; sabrina
	db MUSIC_YOUNGSTER_ENCOUNTER	; blaine
	db MUSIC_ROCKET_ENCOUNTER		; giovanni
	db MUSIC_LASS_ENCOUNTER			; lorelei
	db MUSIC_YOUNGSTER_ENCOUNTER	; bruno
	db MUSIC_LASS_ENCOUNTER			; agatha
	db MUSIC_YOUNGSTER_ENCOUNTER	; lance
	db MUSIC_YOUNGSTER_ENCOUNTER	; red
	db MUSIC_YOUNGSTER_ENCOUNTER	; blue
	db MUSIC_LASS_ENCOUNTER			; green
	db MUSIC_LASS_ENCOUNTER			; yellow
	db MUSIC_HIKER_ENCOUNTER		; cal
	db MUSIC_ROCKET_ENCOUNTER		; butch
	db MUSIC_ROCKET_ENCOUNTER		; cassidy
	db MUSIC_ROCKET_ENCOUNTER		; cassidy&butch
	db MUSIC_ROCKET_ENCOUNTER		; james
	db MUSIC_ROCKET_ENCOUNTER		; jessie
	db MUSIC_ROCKET_ENCOUNTER		; jessie&james
	db MUSIC_BEAUTY_ENCOUNTER		; mom
	db MUSIC_HIKER_ENCOUNTER		; bill
	db MUSIC_HIKER_ENCOUNTER		; imakuni
	db MUSIC_HIKER_ENCOUNTER		; lawrence
	db MUSIC_HIKER_ENCOUNTER		; prof_oak
	db MUSIC_ORANGE_ENCOUNTER		; prof_ivy
	db MUSIC_ORANGE_ENCOUNTER			; prof_aide
	db MUSIC_ORANGE_ENCOUNTER		; nurse
	db MUSIC_ORANGE_ENCOUNTER		; officer
	db MUSIC_ORANGE_ENCOUNTER	; youngster
	db MUSIC_ORANGE_ENCOUNTER			; lass
	db MUSIC_ORANGE_ENCOUNTER		; beauty
	db MUSIC_ORANGE_ENCOUNTER	; bug_catcher
	db MUSIC_ORANGE_ENCOUNTER			; bug_catcher_f
	db MUSIC_ORANGE_ENCOUNTER		; swimmerm
	db MUSIC_ORANGE_ENCOUNTER		; swimmerf
	db MUSIC_ORANGE_ENCOUNTER	; camper
	db MUSIC_ORANGE_ENCOUNTER	; pink_maniac
	db MUSIC_ORANGE_ENCOUNTER	; pokemaniac
	db MUSIC_ORANGE_ENCOUNTER		; fisher
	db MUSIC_ORANGE_ENCOUNTER		; hiker
	db MUSIC_ORANGE_ENCOUNTER		; athlete
	db MUSIC_ORANGE_ENCOUNTER		; sightseerm
	db MUSIC_ORANGE_ENCOUNTER		; sightseerf
	db MUSIC_ORANGE_ENCOUNTER		; waitress
	db MUSIC_ORANGE_ENCOUNTER		; cooltrainerm
	db MUSIC_ORANGE_ENCOUNTER		; cooltrainerf
	db MUSIC_ORANGE_ENCOUNTER	; catman
	db MUSIC_ORANGE_ENCOUNTER	; bird_keeper
	db MUSIC_LOOK_GLADION           ; cross
	db MUSIC_ORANGE_ENCOUNTER   ; otaku
	db MUSIC_LASS_ENCOUNTER ;jace
	db MUSIC_LASS_ENCOUNTER ;kurt
	db MUSIC_LASS_ENCOUNTER ;kat
	db MUSIC_LASS_ENCOUNTER ;alice
;	db MUSIC_ORANGE_ENCOUNTER		; gentleman
;	db MUSIC_ORANGE_ENCOUNTER		; teacher
	db MUSIC_ORANGE_ENCOUNTER		; sailor
;	db MUSIC_ORANGE_ENCOUNTER	; super_nerd
;	db MUSIC_ORANGE_ENCOUNTER		; guitarist
;	db MUSIC_ORANGE_ENCOUNTER		; biker
;	db MUSIC_ORANGE_ENCOUNTER		; firebreather
;	db MUSIC_ORANGE_ENCOUNTER	; juggler
	db MUSIC_ORANGE_ENCOUNTER		; blackbelt_t
;	db MUSIC_ORANGE_ENCOUNTER	; psychic_t
;	db MUSIC_ORANGE_ENCOUNTER			; picnicker
;	db MUSIC_ORANGE_ENCOUNTER			; sage
;	db MUSIC_ORANGE_ENCOUNTER			; medium
;	db MUSIC_ORANGE_ENCOUNTER		; pokefanm
;	db MUSIC_ORANGE_ENCOUNTER		; pokefanf
	db MUSIC_ORANGE_ENCOUNTER		;diverm
	db MUSIC_ORANGE_ENCOUNTER		;diverf
	db MUSIC_ORANGE_ENCOUNTER		;raymond
	db MUSIC_ORANGE_ENCOUNTER		;crook
	db MUSIC_ORANGE_ENCOUNTER		;scuz
; e906e
