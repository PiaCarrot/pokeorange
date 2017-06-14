ExitRadio_HandleMusic: ; 91492
	ld a, [wRadioMusicPlaying]
	cp $fe
	jr z, .restart_map_music
	cp $ff
	call z, EnterMapMusic
	xor a
	ld [wRadioMusicPlaying], a
	ret

.restart_map_music
	call RestartMapMusic
	xor a
	ld [wRadioMusicPlaying], a
	ret

; 914ab

LoadStation_OaksPokemonTalk: ; 91753 (24:5753)
	xor a ; OAKS_POKEMON_TALK
	ld [wd002], a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPkmnTalkName
	ret

LoadStation_PokedexShow: ; 91766 (24:5766)
	ld a, POKEDEX_SHOW
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokedexShowName
	ret

LoadStation_PokemonMusic: ; 9177b (24:577b)
	ld a, POKEMON_MUSIC
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel: ; 91790 (24:5790)
	ld a, LUCKY_CHANNEL
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_PlacesAndPeople: ; 917ea (24:57ea)
	ld a, PLACES_AND_PEOPLE
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing: ; 917ff (24:57ff)
	ld a, LETS_ALL_SING
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret

; 91814 (24:5814)

LoadStation_PokeFluteRadio: ; 91829 (24:5829)
	ld a, POKE_FLUTE_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

RadioMusicRestartDE: ; 91854 (24:5854)
	push de
	ld a, e
	ld [wRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	jp PlayMusic

RadioMusicRestartPokemonChannel: ; 91868 (24:5868)
	push de
	ld a, $fe
	ld [wRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	jp PlayMusic

Radio_BackUpFarCallParams: ; 9187c (24:587c)
	ld [wRadioChannelBank], a
	ld a, l
	ld [wRadioChannelAddr], a
	ld a, h
	ld [wRadioChannelAddr + 1], a
	ret

; 918bf

OaksPkmnTalkName:     db "OAK's <PK><MN> Talk@"
PokedexShowName:      db "#DEX Show@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"
; 9191c

PlayRadio: ; 91a53
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wRadioChannelAddr]
	ld l, a
	ld a, [wRadioChannelAddr + 1]
	ld h, a
	ld a, [wRadioChannelBank]
	and a
	jr z, .zero
	rst FarCall
.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [Options], a
	jp ExitRadio_HandleMusic

; 91a87

.PlayStation: ; 91a87
	ld a, -1
	ld [EnemyTurnsTaken], a
	ld hl, .StationPointers
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp hl

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld [hl], $72
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], $73
	jp WaitBGMap

; 91ab9

.StationPointers: ; 91ab9
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokedexShow
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_PokeFluteRadio

; 91acb

.OakOrPnP: ; 91acb
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople

; 91ae1
