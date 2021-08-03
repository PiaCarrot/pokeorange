GetTrainerDVs: ; 270c4
; Return the DVs of OtherTrainerClass in bc

	push hl
	ld a, [OtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret
; 270d6

TrainerClassDVs: ; 270d6
	;  Atk  Spd
	;  Def  Spc
	db $99, $99 ; cissy
	db $AA, $AA ; danny
	db $BB, $BB ; rudy
	db $CC, $CC ; luana
	db $DD, $DD ; drake
	db $DD, $DD ; tracey
	db $DD, $DD ; tracey2
	db $9D, $79 ; brock
	db $99, $99 ; misty
	db $97, $D9 ; lt surge
	db $99, $99 ; erika
	db $99, $99 ; koga
	db $79, $9D ; sabrina
	db $97, $8D ; blaine
	db $99, $99 ; giovanni
	db $EE, $EE ; lorelei
	db $EE, $EE ; bruno
	db $EE, $EE ; agatha
	db $EE, $EE ; lance
	db $FF, $FF ; red
	db $FF, $FF ; blue
	db $FF, $FF ; green
	db $FF, $FF ; yellow
	db $DD, $DD ; cal
	db $D8, $A8 ; butch
	db $D8, $A8 ; cassidy
	db $D8, $A8 ; cassidy&butch
	db $D8, $A8 ; james
	db $D8, $A8 ; jessie
	db $D8, $A8 ; jessie&james
	db $99, $99 ; mom
	db $98, $88 ; bill
	db $98, $88 ; imakuni
	db $98, $88 ; lawrence
	db $98, $88 ; prof.oak
	db $98, $88 ; prof.ivy
	db $98, $88 ; prof.aide
	db $98, $88 ; nurse
	db $98, $88 ; officer
	db $98, $88 ; youngster
	db $98, $88 ; lass
	db $78, $99 ; beauty
	db $98, $88 ; bug catcher
	db $98, $88 ; bug catcher f
	db $98, $88 ; swimmerm
	db $98, $88 ; swimmerf
	db $98, $88 ; camper
	db $98, $88 ; pink maniac
	db $98, $88 ; pokemaniac
	db $98, $88 ; fisher
	db $A8, $88 ; hiker
	db $98, $88 ; athlete
	db $98, $88 ; sightseerm
	db $98, $88 ; sightseerf
	db $98, $88 ; waitress
	db $D8, $C8 ; cooltrainerm
	db $D8, $C8 ; cooltrainerf
	db $98, $88 ; catman
	db $98, $88 ; birdkeeper
	db $DD, $DD ; cross
	db $6D, $88 ; otaku
;	db $98, $88 ; gentleman
;	db $68, $88 ; teacher
	db $98, $88 ; sailor
;	db $98, $88 ; super nerd
;	db $98, $88 ; guitarist
;	db $98, $88 ; biker
;	db $98, $88 ; firebreather
;	db $98, $88 ; juggler
    db $FF, $FF ; jace
    db $FF, $FF ; kurt
    db $FF, $FF ; kat
    db $FF, $FF ; alice
	db $98, $88 ; blackbelt
;	db $98, $88 ; psychic
;	db $6A, $A8 ; picnicker
;	db $98, $88 ; sage
;	db $78, $88 ; medium
;	db $98, $88 ; pokefanm
;	db $6D, $88 ; pokefanf
	db $98, $88 ; diverm
	db $98, $88 ; diverf
	db $98, $88 ; engineer
	db $FF, $FF ; raymond
	db $D8, $A8 ; crook
	db $D8, $A8 ; scuz
; 2715c


GetTrainerPersonality:
; Return the personality of OtherTrainerClass in b

	push hl
	ld a, [OtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassPersonalities
	add hl, bc

	ld a, [hl]
	ld b, a

	pop hl
	ret

TrainerClassPersonalities:

	db FEMALE_MASK ; cissy
	db MALE_MASK   ; danny
	db MALE_MASK   ; rudy
	db FEMALE_MASK ; luana
	db MALE_MASK   ; drake
	db MALE_MASK   ; tracey
	db MALE_MASK   ; tracey2
	db MALE_MASK   ; brock
	db FEMALE_MASK ; misty
	db MALE_MASK   ; lt surge
	db FEMALE_MASK ; erika
	db MALE_MASK   ; koga
	db FEMALE_MASK ; sabrina
	db MALE_MASK   ; blaine
	db MALE_MASK   ; giovanni
	db FEMALE_MASK ; lorelei
	db MALE_MASK   ; bruno
	db FEMALE_MASK ; agatha
	db MALE_MASK   ; lance
	db MALE_MASK   ; red
	db MALE_MASK   ; blue
	db FEMALE_MASK ; green
	db FEMALE_MASK ; yellow
	db MALE_MASK   ; cal
	db MALE_MASK   ; butch
	db FEMALE_MASK ; cassidy
	db MALE_MASK   ; cassidy&butch
	db MALE_MASK   ; james
	db FEMALE_MASK ; jessie
	db MALE_MASK   ; jessie&james
	db FEMALE_MASK ; mom
	db MALE_MASK   ; bill
	db MALE_MASK   ; imakuni
	db MALE_MASK   ; lawrence
	db MALE_MASK   ; prof.oak
	db FEMALE_MASK ; prof.ivy
	db FEMALE_MASK ; prof.aide
	db FEMALE_MASK ; nurse
	db FEMALE_MASK ; officer
	db MALE_MASK   ; youngster
	db FEMALE_MASK ; lass
	db FEMALE_MASK ; beauty
	db MALE_MASK   ; bug catcher
	db FEMALE_MASK ; bug catcher f
	db MALE_MASK   ; swimmerm
	db FEMALE_MASK ; swimmerf
	db MALE_MASK   ; camper
	db MALE_MASK | PINK_MASK ; pink maniac
	db MALE_MASK   ; pokemaniac
	db MALE_MASK   ; fisher
	db MALE_MASK   ; hiker
	db MALE_MASK   ; athlete
	db MALE_MASK   ; sightseerm
	db FEMALE_MASK ; sightseerf
	db FEMALE_MASK ; waitress
	db MALE_MASK   ; cooltrainerm
	db FEMALE_MASK ; cooltrainerf
	db MALE_MASK   ; catman
	db MALE_MASK   ; birdkeeper
	db MALE_MASK   ; cross
	db MALE_MASK   ; otaku
	db MALE_MASK   ; sailor
	db MALE_MASK   ; Jace
	db MALE_MASK   ; Kurt
	db MALE_MASK   ; Jason
	db FEMALE_MASK   ; Alice
	db MALE_MASK ;blackbelt
	db MALE_MASK ;diverm
	db FEMALE_MASK ;diverf
	db MALE_MASK ;engineer
	db MALE_MASK ;raymond
	db MALE_MASK ;crook
	db MALE_MASK ;scuz
