PlayRadioShow:
; Jump to the currently loaded station.  The index to which we need to jump is in wCurrentRadioLine.
	ld a, [wCurrentRadioLine]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

RadioJumptable:
	dw OaksPkmnTalk1  ; $00
	dw PokedexShow1 ; $01
	dw BenMonMusic1  ; $02
	dw LuckyNumberShow1 ; $03
	dw PeoplePlaces1 ; $05
	dw FernMonMusic1 ; $06
	dw PokeFluteRadio ; $08
; OaksPkmnTalk
	dw OaksPkmnTalk2  ; $0b
	dw OaksPkmnTalk3  ; $0c
	dw OaksPkmnTalk4  ; $0d
	dw OaksPkmnTalk5  ; $0e
	dw OaksPkmnTalk6  ; $0f
	dw OaksPkmnTalk7  ; $10
	dw OaksPkmnTalk8  ; $11
	dw OaksPkmnTalk9  ; $12
	dw PokedexShow2 ; $13
	dw PokedexShow3 ; $14
	dw PokedexShow4 ; $15
	dw PokedexShow5 ; $16
; Ben Music
	dw BenMonMusic2  ; $17
	dw BenMonMusic3  ; $18
	dw BenFernMusic4 ; $19
	dw BenFernMusic5 ; $1a
	dw BenFernMusic6 ; $1b
	dw BenFernMusic7 ; $1c
	dw FernMonMusic2 ; $1d
; Lucky Number Show
	dw LuckyNumberShow2 ; $1e
	dw LuckyNumberShow3 ; $1f
	dw LuckyNumberShow4 ; $20
	dw LuckyNumberShow5 ; $21
	dw LuckyNumberShow6 ; $22
	dw LuckyNumberShow7 ; $23
	dw LuckyNumberShow8 ; $24
	dw LuckyNumberShow9 ; $25
	dw LuckyNumberShow10 ; $26
	dw LuckyNumberShow11 ; $27
	dw LuckyNumberShow12 ; $28
	dw LuckyNumberShow13 ; $29
	dw LuckyNumberShow14 ; $2a
	dw LuckyNumberShow15 ; $2b
; People & Places
	dw PeoplePlaces2 ; $2c
	dw PeoplePlaces3 ; $2d
	dw PeoplePlaces4 ; $2e
	dw PeoplePlaces5 ; $2f
	dw PeoplePlaces6 ; $30
	dw PeoplePlaces7 ; $31
; More Pokemon Channel stuff
	dw OaksPkmnTalk10 ; $3b
	dw OaksPkmnTalk11 ; $3c
	dw OaksPkmnTalk12 ; $3d
	dw OaksPkmnTalk13 ; $3e
	dw OaksPkmnTalk14 ; $3f
	dw RadioScroll ; $54
; More Pokemon Channel stuff
	dw PokedexShow6 ; $55
	dw PokedexShow7 ; $56
	dw PokedexShow8 ; $57


PrintRadioLine:
	ld [wNextRadioLine], a
	ld hl, wRadioText
	ld a, [wNumRadioLinesPrinted]
	cp 2
	jr nc, .print
	inc hl
	ld [hl], "<START>"
	inc a
	ld [wNumRadioLinesPrinted], a
	cp 2
	jr nz, .print
	bccoord 1, 16
	call PlaceHLTextAtBC
	jr .skip
.print
	call PrintTextBoxText
.skip
	ld a, RADIO_SCROLL
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

RadioScroll:
	ld hl, wRadioTextDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wNextRadioLine]
	ld [wCurrentRadioLine], a
	ld a, [wNumRadioLinesPrinted]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPkmnTalk1:
	ld a, 5
	ld [wOaksPkmnTalkSegmentCounter], a
	call StartRadioStation
	ld hl, OPT_IntroText1
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine

OaksPkmnTalk2:
	ld hl, OPT_IntroText2
	ld a, OAKS_POKEMON_TALK_3
	jp NextRadioLine

OaksPkmnTalk3:
	ld hl, OPT_IntroText3
	ld a, OAKS_POKEMON_TALK_4
	jp NextRadioLine

OaksPkmnTalk4:
; Choose a random route, and a random Pokemon from that route.
	call Random
	and %11
	; We now have a number between 0 and 3.
	ld hl, .routes
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	; bc now contains the chosen map's group and number indices.
	push bc

	; Search the JohtoGrassWildMons array for the chosen map.
	ld hl, JohtoGrassWildMons
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .overflow
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, WILDMON_GRASS_STRUCTURE_LENGTH
	add hl, de
	jr .loop

.done
rept 4
	inc hl
endr
	; Generate a number, either 0, 1, or 2, to choose a time of day.
.loop2
	call Random
	and 3
	cp 3
	jr z, .loop2

	ld bc, 2 * NUM_WILDMONS_PER_AREA_TIME_OF_DAY
	call AddNTimes
.loop3
	; Choose one of the middle three Pokemon.
	call Random
	and NUM_WILDMONS_PER_AREA_TIME_OF_DAY
	cp 2
	jr c, .loop3
	cp 5
	jr nc, .loop3
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	inc hl ; skip level
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	ld [CurPartySpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	; Now that we've chosen our wild Pokemon,
	; let's recover the map index info and get its name.
	pop bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, OPT_OakText1
	call CopyRadioTextToRAM
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

.overflow
	pop bc
	ld a, OAKS_POKEMON_TALK
	jp PrintRadioLine

.routes
	map ROUTE_49
	map ROUTE_50
	map ROUTE_52
	map ROUTE_51

OaksPkmnTalk5:
	ld hl, OPT_OakText2
	ld a, OAKS_POKEMON_TALK_6
	jp NextRadioLine

OaksPkmnTalk6:
	ld hl, OPT_OakText3
	ld a, OAKS_POKEMON_TALK_7
	jp NextRadioLine

OPT_IntroText1:
	; MARY: PROF.OAK'S
	text_jump _OPT_IntroText1
	db "@"

OPT_IntroText2:
	; #MON TALK!
	text_jump _OPT_IntroText2
	db "@"

OPT_IntroText3:
	; With me, MARY!
	text_jump _OPT_IntroText3
	db "@"

OPT_OakText1:
	; OAK: @ @
	text_jump _OPT_OakText1
	db "@"

OPT_OakText2:
	; may be seen around
	text_jump _OPT_OakText2
	db "@"

OPT_OakText3:
	; @ .
	text_jump _OPT_OakText3
	db "@"

OaksPkmnTalk7:
	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jp NextRadioLine

OPT_MaryText1:
	; MARY: @ 's
	text_jump _OPT_MaryText1
	db "@"

OaksPkmnTalk8:
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine

.Descriptors:
	dw .sweetadorably
	dw .wigglyslickly
	dw .aptlynamed
	dw .undeniablykindof
	dw .unbearably
	dw .wowimpressively
	dw .almostpoisonously
	dw .sensually
	dw .mischievously
	dw .topically
	dw .addictively
	dw .looksinwater
	dw .evolutionmustbe
	dw .provocatively
	dw .flippedout
	dw .heartmeltingly

.sweetadorably
	; sweet and adorably
	text_jump OPT_SweetAdorably
	db "@"

.wigglyslickly
	; wiggly and slickly
	text_jump OPT_WigglySlickly
	db "@"

.aptlynamed
	; aptly named and
	text_jump OPT_AptlyNamed
	db "@"

.undeniablykindof
	; undeniably kind of
	text_jump OPT_UndeniablyKindOf
	db "@"

.unbearably
	; so, so unbearably
	text_jump OPT_Unbearably
	db "@"

.wowimpressively
	; wow, impressively
	text_jump OPT_WowImpressively
	db "@"

.almostpoisonously
	; almost poisonously
	text_jump OPT_AlmostPoisonously
	db "@"

.sensually
	; ooh, so sensually
	text_jump OPT_Sensually
	db "@"

.mischievously
	; so mischievously
	text_jump OPT_Mischievously
	db "@"

.topically
	; so very topically
	text_jump OPT_Topically
	db "@"

.addictively
	; sure addictively
	text_jump OPT_Addictively
	db "@"

.looksinwater
	; looks in water is
	text_jump OPT_LooksInWater
	db "@"

.evolutionmustbe
	; evolution must be
	text_jump OPT_EvolutionMustBe
	db "@"

.provocatively
	; provocatively
	text_jump OPT_Provocatively
	db "@"

.flippedout
	; so flipped out and
	text_jump OPT_FlippedOut
	db "@"

.heartmeltingly
	; heart-meltingly
	text_jump OPT_HeartMeltingly
	db "@"

OaksPkmnTalk9:
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOaksPkmnTalkSegmentCounter]
	dec a
	ld [wOaksPkmnTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_4
	jr nz, .ok
	ld a, 5
	ld [wOaksPkmnTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_10
.ok
	jp NextRadioLine

.Descriptors:
	dw .cute
	dw .weird
	dw .pleasant
	dw .boldsortof
	dw .frightening
	dw .suavedebonair
	dw .powerful
	dw .exciting
	dw .groovy
	dw .inspiring
	dw .friendly
	dw .hothothot
	dw .stimulating
	dw .guarded
	dw .lovely
	dw .speedy

.cute
	; cute.
	text_jump OPT_Cute
	db "@"

.weird
	; weird.
	text_jump OPT_Weird
	db "@"

.pleasant
	; pleasant.
	text_jump OPT_Pleasant
	db "@"

.boldsortof
	; bold, sort of.
	text_jump OPT_BoldSortOf
	db "@"

.frightening
	; frightening.
	text_jump OPT_Frightening
	db "@"

.suavedebonair
	; suave & debonair!
	text_jump OPT_SuaveDebonair
	db "@"

.powerful
	; powerful.
	text_jump OPT_Powerful
	db "@"

.exciting
	; exciting.
	text_jump OPT_Exciting
	db "@"

.groovy
	; groovy!
	text_jump OPT_Groovy
	db "@"

.inspiring
	; inspiring.
	text_jump OPT_Inspiring
	db "@"

.friendly
	; friendly.
	text_jump OPT_Friendly
	db "@"

.hothothot
	; hot, hot, hot!
	text_jump OPT_HotHotHot
	db "@"

.stimulating
	; stimulating.
	text_jump OPT_Stimulating
	db "@"

.guarded
	; guarded.
	text_jump OPT_Guarded
	db "@"

.lovely
	; lovely.
	text_jump OPT_Lovely
	db "@"

.speedy
	; speedy.
	text_jump OPT_Speedy
	db "@"

OaksPkmnTalk10:
	farcall RadioMusicRestartPokemonChannel
	ld hl, OPT_RestartText
	call PrintText
	call WaitBGMap
	ld hl, OPT_PokemonChannelText
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

OPT_PokemonChannelText:
	; #MON
	text_jump _OPT_PokemonChannelText
	db "@"

OPT_RestartText:
	db "@"

OaksPkmnTalk11:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jp PlaceRadioString

.pokemon_string
	db "#MON@"

OaksPkmnTalk12:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
	jp PlaceRadioString

.pokemon_channel_string
	db "#MON Channel@"

OaksPkmnTalk13:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, .terminator
	ld a, OAKS_POKEMON_TALK_14
	jp PlaceRadioString

.terminator
	db "@"

OaksPkmnTalk14:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	ld de, $1d
	farcall RadioMusicRestartDE
	ld hl, .terminator
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wNextRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, RADIO_SCROLL
	ld [wCurrentRadioLine], a
	ld a, 10
	ld [wRadioTextDelay], a
	ret

.terminator
	db "@"

PlaceRadioString:
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	jp PlaceString

CopyBottomLineToTopLine:
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine:
	hlcoord 1, 15
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	jp ByteFill

PokedexShow_GetDexEntryBank:
	push hl
	push de
	ld a, [CurPartySpecies]
	dec a
	rlca
	rlca
	and 3
	ld hl, .pokedexbanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.pokedexbanks
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)

PokedexShow1:
	call StartRadioStation
.loop
	call Random
	cp NUM_POKEMON
	jr nc, .loop
	ld c, a
	push bc
	ld a, c
	call CheckCaughtMon
	pop bc
	jr z, .loop
	inc c
	ld a, c
	ld [CurPartySpecies], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, PokedexShowText
	ld a, POKEDEX_SHOW_2
	jp NextRadioLine

PokedexShow2:
	ld a, [CurPartySpecies]
	dec a
	ld hl, PokedexDataPointerTable
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
	call PokedexShow_GetDexEntryBank
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
rept 4
	inc hl
endr
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, POKEDEX_SHOW_3
	jp PrintRadioLine

PokedexShow3:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_4
	jp PrintRadioLine

PokedexShow4:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_5
	jp PrintRadioLine

PokedexShow5:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_6
	jp PrintRadioLine

PokedexShow6:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_7
	jp PrintRadioLine

PokedexShow7:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_8
	jp PrintRadioLine

PokedexShow8:
	call CopyDexEntry
	ld a, POKEDEX_SHOW
	jp PrintRadioLine

CopyDexEntry:
	ld a, [wPokedexShowPointerAddr]
	ld l, a
	ld a, [wPokedexShowPointerAddr + 1]
	ld h, a
	ld a, [wPokedexShowPointerBank]
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	jp CopyDexEntryPart2

CopyDexEntryPart1:
	ld de, wPokedexShowPointerBank
	ld bc, SCREEN_WIDTH - 1
	call FarCopyBytes
	ld hl, wPokedexShowPointerAddr
	ld [hl], "<START>"
	inc hl
	ld [hl], "<LINE>"
	inc hl
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp "<NEXT>"
	ret z
	jr .loop

CopyDexEntryPart2:
	ld d, a
.loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr z, .okay
	cp "<NEXT>"
	jr nz, .loop
.okay
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, d
	ld [wPokedexShowPointerBank], a
	ret

PokedexShowText:
	; @ @
	text_jump _PokedexShowText
	db "@"

BenMonMusic1:
	call StartPokemonMusicChannel
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

BenMonMusic2:
	ld hl, BenIntroText2
	ld a, POKEMON_MUSIC_3
	jp NextRadioLine

BenMonMusic3:
	ld hl, BenIntroText3
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

FernMonMusic1:
	call StartPokemonMusicChannel
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

FernMonMusic2:
	ld hl, FernIntroMusic2
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

BenFernMusic4:
	ld hl, BenFernText1
	ld a, POKEMON_MUSIC_5
	jp NextRadioLine

BenFernMusic5:
	call GetWeekday
	and 1
	ld hl, BenFernText2A
	jr z, .SunTueThurSun
	ld hl, BenFernText2B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_6
	jp NextRadioLine

BenFernMusic6:
	call GetWeekday
	and 1
	ld hl, BenFernText3A
	jr z, .SunTueThurSun
	ld hl, BenFernText3B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_7
	jp NextRadioLine

StartPokemonMusicChannel:
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .SunTueThurSun
	ld de, MUSIC_POKEMON_LULLABY
.SunTueThurSun:
	farcall RadioMusicRestartDE
BenFernMusic7:
	ret

BenIntroText1:
	; BEN: #MON MUSIC
	text_jump _BenIntroText1
	db "@"

BenIntroText2:
	; CHANNEL!
	text_jump _BenIntroText2
	db "@"

BenIntroText3:
	; It's me, DJ BEN!
	text_jump _BenIntroText3
	db "@"

FernIntroText1:
	; FERN: #MUSIC!
	text_jump _FernIntroText1
	db "@"

FernIntroMusic2:
	; With DJ FERN!
	text_jump _FernIntroText2
	db "@"

BenFernText1:
	; Today's @ ,
	text_jump _BenFernText1
	db "@"

BenFernText2A:
	; so let us jam to
	text_jump _BenFernText2A
	db "@"

BenFernText2B:
	; so chill out to
	text_jump _BenFernText2B
	db "@"

BenFernText3A:
	; #MON March!
	text_jump _BenFernText3A
	db "@"

BenFernText3B:
	; #MON Lullaby!
	text_jump _BenFernText3B
	db "@"

LuckyNumberShow1:
	call StartRadioStation
	farcall Special_CheckLuckyNumberShowFlag
	jr nc, .dontreset
	farcall Special_ResetLuckyNumberShowFlag
.dontreset
	ld hl, LC_Text1
	ld a, LUCKY_NUMBER_SHOW_2
	jp NextRadioLine

LuckyNumberShow2:
	ld hl, LC_Text2
	ld a, LUCKY_NUMBER_SHOW_3
	jp NextRadioLine

LuckyNumberShow3:
	ld hl, LC_Text3
	ld a, LUCKY_NUMBER_SHOW_4
	jp NextRadioLine

LuckyNumberShow4:
	ld hl, LC_Text4
	ld a, LUCKY_NUMBER_SHOW_5
	jp NextRadioLine

LuckyNumberShow5:
	ld hl, LC_Text5
	ld a, LUCKY_NUMBER_SHOW_6
	jp NextRadioLine

LuckyNumberShow6:
	ld hl, LC_Text6
	ld a, LUCKY_NUMBER_SHOW_7
	jp NextRadioLine

LuckyNumberShow7:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_8
	jp NextRadioLine

LuckyNumberShow8:
	ld hl, StringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [StringBuffer1 + 5], a
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_9
	jp NextRadioLine

LuckyNumberShow9:
	ld hl, LC_Text9
	ld a, LUCKY_NUMBER_SHOW_10
	jp NextRadioLine

LuckyNumberShow10:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_11
	jp NextRadioLine

LuckyNumberShow11:
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_12
	jp NextRadioLine

LuckyNumberShow12:
	ld hl, LC_Text10
	ld a, LUCKY_NUMBER_SHOW_13
	jp NextRadioLine

LuckyNumberShow13:
	ld hl, LC_Text11
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jp NextRadioLine

LuckyNumberShow14:
	ld hl, LC_DragText1
	ld a, LUCKY_NUMBER_SHOW_15
	jp NextRadioLine

LuckyNumberShow15:
	ld hl, LC_DragText2
	ld a, LUCKY_CHANNEL
	jp NextRadioLine

LC_Text1:
	; REED: Yeehaw! How
	text_jump _LC_Text1
	db "@"

LC_Text2:
	; y'all doin' now?
	text_jump _LC_Text2
	db "@"

LC_Text3:
	; Whether you're up
	text_jump _LC_Text3
	db "@"

LC_Text4:
	; or way down low,
	text_jump _LC_Text4
	db "@"

LC_Text5:
	; don't you miss the
	text_jump _LC_Text5
	db "@"

LC_Text6:
	; LUCKY NUMBER SHOW!
	text_jump _LC_Text6
	db "@"

LC_Text7:
	; This week's Lucky
	text_jump _LC_Text7
	db "@"

LC_Text8:
	; Number is @ !
	text_jump _LC_Text8
	db "@"

LC_Text9:
	; I'll repeat that!
	text_jump _LC_Text9
	db "@"

LC_Text10:
	; Match it and go to
	text_jump _LC_Text10
	db "@"

LC_Text11:
	; the RADIO TOWER!
	text_jump _LC_Text11
	db "@"

LC_DragText1:
	; …Repeating myself
	text_jump _LC_DragText1
	db "@"

LC_DragText2:
	; gets to be a drag…
	text_jump _LC_DragText2
	db "@"

PeoplePlaces1:
	call StartRadioStation
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PeoplePlaces2:
	ld hl, PnP_Text2
	ld a, PLACES_AND_PEOPLE_3
	jp NextRadioLine

PeoplePlaces3:
	ld hl, PnP_Text3
	call Random
	cp $7b ; 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

PnP_Text1:
	; PLACES AND PEOPLE!
	text_jump _PnP_Text1
	db "@"

PnP_Text2:
	; Brought to you by
	text_jump _PnP_Text2
	db "@"

PnP_Text3:
	; me, DJ LILY!
	text_jump _PnP_Text3
	db "@"

PeoplePlaces4: ; People
	call Random
	and $7f
	inc a
	cp NUM_TRAINER_CLASSES - 1
	jr nc, PeoplePlaces4
	ld hl, .HiddenNames
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	farcall GetTrainerClassName
	ld de, StringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	farcall GetTrainerName
	ld hl, PnP_Text4
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine

.HiddenNames:
	db GIOVANNI
	db RED, BLUE, GREEN, YELLOW
	db BUTCH, CASSIDY, CASSIDY_BUTCH
	db JAMES, JESSIE, JESSIE_JAMES
	db -1

PnP_Text4:
	; @  @ @
	text_jump _PnP_Text4
	db "@"

PeoplePlaces5:
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp $a ; 6.25 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp $7b ; 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

.Descriptors:
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

PnP_cute:
	; is cute.
	text_jump _PnP_cute
	db "@"

PnP_lazy:
	; is sort of lazy.
	text_jump _PnP_lazy
	db "@"

PnP_happy:
	; is always happy.
	text_jump _PnP_happy
	db "@"

PnP_noisy:
	; is quite noisy.
	text_jump _PnP_noisy
	db "@"

PnP_precocious:
	; is precocious.
	text_jump _PnP_precocious
	db "@"

PnP_bold:
	; is somewhat bold.
	text_jump _PnP_bold
	db "@"

PnP_picky:
	; is too picky!
	text_jump _PnP_picky
	db "@"

PnP_sortofok:
	; is sort of OK.
	text_jump _PnP_sortofok
	db "@"

PnP_soso:
	; is just so-so.
	text_jump _PnP_soso
	db "@"

PnP_great:
	; is actually great.
	text_jump _PnP_great
	db "@"

PnP_mytype:
	; is just my type.
	text_jump _PnP_mytype
	db "@"

PnP_cool:
	; is so cool, no?
	text_jump _PnP_cool
	db "@"

PnP_inspiring:
	; is inspiring!
	text_jump _PnP_inspiring
	db "@"

PnP_weird:
	; is kind of weird.
	text_jump _PnP_weird
	db "@"

PnP_rightforme:
	; is right for me?
	text_jump _PnP_rightforme
	db "@"

PnP_odd:
	; is definitely odd!
	text_jump _PnP_odd
	db "@"

PeoplePlaces6: ; Places
	call Random
	cp 9
	jr nc, PeoplePlaces6
	ld hl, .Maps
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, PnP_Text5
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine

.Maps:

PnP_Text5:
	; @ @
	text_jump _PnP_Text5
	db "@"

PeoplePlaces7:
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 1 + 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine

.Descriptors:
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

PokeFluteRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

CopyRadioTextToRAM:
	ld a, [hl]
	cp TX_FAR
	jp z, FarCopyRadioText
	ld de, wRadioText
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

StartRadioStation:
	ld a, [wNumRadioLinesPrinted]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wCurrentRadioLine]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	farcall RadioMusicRestartDE
	ret

RadioChannelSongs:
	dw MUSIC_POKEMON_TALK
	dw MUSIC_POKEMON_CENTER
	dw MUSIC_TITLE
	dw MUSIC_GAME_CORNER
	dw MUSIC_VIRIDIAN_CITY
	dw MUSIC_SKATEBOARD
	dw MUSIC_POKE_FLUTE_CHANNEL

NextRadioLine:
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine
