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
	db $9A, $77 ; cissy
	db $88, $88 ; danny
	db $98, $88 ; rudy
	db $98, $88 ; luana
	db $DC, $DD ; drake
	db $DD, $DD ; tracey
	db $98, $88 ; brock
	db $78, $88 ; misty
	db $98, $88 ; lt surge
	db $78, $88 ; erika
	db $98, $88 ; koga
	db $7D, $87 ; sabrina
	db $98, $88 ; blaine
	db $98, $88 ; giovanni
	db $7D, $DD ; lorelei
	db $DC, $DD ; bruno
	db $7F, $DF ; agatha
	db $DC, $DD ; lance
	db $FD, $DE ; red
	db $9D, $DD ; blue
	db $7E, $DE ; green
	db $7E, $DE ; yellow
	db $DC, $DD ; cal
	db $D8, $A8 ; butch
	db $7E, $A8 ; cassidy
	db $7E, $A8 ; cassidy&butch
	db $D8, $A8 ; james
	db $7E, $A8 ; jessie
	db $7E, $A8 ; jessie&james
	db $78, $88 ; mom
	db $98, $88 ; bill
	db $98, $88 ; imakuni
	db $98, $88 ; lawrence
	db $98, $88 ; prof.oak
	db $78, $88 ; prof.ivy
	db $78, $88 ; prof.aide
	db $78, $88 ; nurse
	db $78, $88 ; officer
	db $98, $88 ; youngster
	db $58, $88 ; lass
	db $69, $C8 ; beauty
	db $98, $88 ; bug catcher
	db $78, $88 ; bug catcher f
	db $98, $88 ; swimmerm
	db $78, $88 ; swimmerf
	db $98, $88 ; camper
	db $98, $88 ; pokemaniac
	db $98, $88 ; fisher
	db $A8, $88 ; hiker
	db $98, $88 ; athlete
	db $98, $88 ; sightseerm
	db $68, $88 ; sightseerf
	db $68, $88 ; waitress
	db $D8, $C8 ; cooltrainerm
	db $7C, $C8 ; cooltrainerf
;	db $98, $88 ; schoolboy
;	db $98, $88 ; bird keeper
;	db $98, $88 ; gentleman
;	db $68, $88 ; teacher
;	db $98, $88 ; sailor
;	db $98, $88 ; super nerd
;	db $98, $88 ; guitarist
;	db $98, $88 ; biker
;	db $98, $88 ; firebreather
;	db $98, $88 ; juggler
;	db $98, $88 ; blackbelt
;	db $98, $88 ; psychic
;	db $6A, $A8 ; picnicker
;	db $98, $88 ; sage
;	db $78, $88 ; medium
;	db $98, $88 ; pokefanm
;	db $6D, $88 ; pokefanf
; 2715c
