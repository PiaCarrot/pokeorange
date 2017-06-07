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
	call PlayMusic
	ret
; e9027

TrainerEncounterMusic: ; e9027
	db MUSIC_HIKER_ENCOUNTER
	db MUSIC_LASS_ENCOUNTER			; cissy
	db MUSIC_YOUNGSTER_ENCOUNTER	; danny
	db MUSIC_YOUNGSTER_ENCOUNTER	; rudy
	db MUSIC_LASS_ENCOUNTER			; luana
	db MUSIC_YOUNGSTER_ENCOUNTER	; drake
	db MUSIC_MYSTICALMAN_ENCOUNTER	; tracey
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
	db MUSIC_BEAUTY_ENCOUNTER		; prof_ivy
	db MUSIC_LASS_ENCOUNTER			; prof_aide
	db MUSIC_OFFICER_ENCOUNTER		; nurse
	db MUSIC_OFFICER_ENCOUNTER		; officer
	db MUSIC_YOUNGSTER_ENCOUNTER	; youngster
	db MUSIC_LASS_ENCOUNTER			; lass
	db MUSIC_BEAUTY_ENCOUNTER		; beauty
	db MUSIC_YOUNGSTER_ENCOUNTER	; bug_catcher
	db MUSIC_LASS_ENCOUNTER			; bug_catcher_f
	db MUSIC_HIKER_ENCOUNTER		; swimmerm
	db MUSIC_BEAUTY_ENCOUNTER		; swimmerf
	db MUSIC_YOUNGSTER_ENCOUNTER	; camper
	db MUSIC_POKEMANIAC_ENCOUNTER	; pokemaniac
	db MUSIC_HIKER_ENCOUNTER		; fisher
	db MUSIC_HIKER_ENCOUNTER		; hiker
	db MUSIC_HIKER_ENCOUNTER		; athlete
	db MUSIC_HIKER_ENCOUNTER		; sightseerm
	db MUSIC_BEAUTY_ENCOUNTER		; sightseerf
	db MUSIC_YOUNGSTER_ENCOUNTER	; schoolboy
	db MUSIC_YOUNGSTER_ENCOUNTER	; bird_keeper
	db MUSIC_HIKER_ENCOUNTER		; cooltrainerm
	db MUSIC_BEAUTY_ENCOUNTER		; cooltrainerf
	db MUSIC_HIKER_ENCOUNTER		; gentleman
	db MUSIC_BEAUTY_ENCOUNTER		; teacher
	db MUSIC_HIKER_ENCOUNTER		; sailor
	db MUSIC_POKEMANIAC_ENCOUNTER	; super_nerd
	db MUSIC_HIKER_ENCOUNTER		; guitarist
	db MUSIC_HIKER_ENCOUNTER		; biker
	db MUSIC_HIKER_ENCOUNTER		; firebreather
	db MUSIC_POKEMANIAC_ENCOUNTER	; juggler
	db MUSIC_HIKER_ENCOUNTER		; blackbelt_t
	db MUSIC_YOUNGSTER_ENCOUNTER	; psychic_t
	db MUSIC_LASS_ENCOUNTER			; picnicker
	db MUSIC_SAGE_ENCOUNTER			; sage
	db MUSIC_SAGE_ENCOUNTER			; medium
	db MUSIC_HIKER_ENCOUNTER		; boarder
	db MUSIC_HIKER_ENCOUNTER		; pokefanm
	db MUSIC_BEAUTY_ENCOUNTER		; pokefanf
; e906e
