;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 4.0 (17-Jun-2020)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_AltoMare:
	musicheader 4, 1, Music_AltoMare_Ch1
	musicheader 1, 2, Music_AltoMare_Ch2
	musicheader 1, 3, Music_AltoMare_Ch3
	musicheader 1, 4, Music_AltoMare_Ch4

Music_AltoMare_Ch1:
	volume $77
	dutycycle $1
	tone $0002
	notetype 12, $62
	stereopanning $f
	tempo 99
;Bar 1
	note __, 16
;Bar 2
	octave 3
rept 5
	callchannel Music_AltoMare_Ch1_Intro
endr
;Bar 7
rept 8
	note A_, 1
endr
	intensity $57
	note G_, 2
	note G_, 2
	note __, 2
	note E_, 2
Music_AltoMare_Ch1_loop:
	dutycycle $1
	octave 3
Music_AltoMare_Ch1_loop1:
;Bar 8
	callchannel Music_AltoMare_Ch1_Type1
;Bar 9
	callchannel Music_AltoMare_Ch1_Type2
;Bar 10
	callchannel Music_AltoMare_Ch1_Type3
;Bar 11
	callchannel Music_AltoMare_Ch1_Type4
;Bar 12
	callchannel Music_AltoMare_Ch1_Type1
;Bar 13
	callchannel Music_AltoMare_Ch1_Type2
;Bar 14
	callchannel Music_AltoMare_Ch1_Type5
;Bar 15
	callchannel Music_AltoMare_Ch1_Type6
	loopchannel 2, Music_AltoMare_Ch1_loop1
;Bar 24
	intensity $87
	dutycycle $2
	callchannel Music_AltoMare_Ch1_Type7
;Bar 25
	callchannel Music_AltoMare_Ch1_Type8
;Bar 26
	callchannel Music_AltoMare_Ch1_Type9
;Bar 27
	callchannel Music_AltoMare_Ch1_Type10
;Bar 28
	intensity $77
	callchannel Music_AltoMare_Ch1_Type7
;Bar 29
	callchannel Music_AltoMare_Ch1_Type11
;Bar 30
	octave 3
	note G#, 2
	note __, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 2
;Bar 31
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note E_, 2
	note A_, 2
	note __, 6
;Bar 32
	callchannel Music_AltoMare_Ch1_Type7
;Bar 33
	callchannel Music_AltoMare_Ch1_Type8
;Bar 34
	callchannel Music_AltoMare_Ch1_Type9
;Bar 35
	callchannel Music_AltoMare_Ch1_Type10
;Bar 36
	callchannel Music_AltoMare_Ch1_Type7
;Bar 37
	callchannel Music_AltoMare_Ch1_Type11
;Bar 38
	octave 3
	note B_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A#, 2
	note __, 2
;Bar 39
	note A_, 4
	note __, 4
	note E_, 2
	note __, 6
;Bar 40
	dutycycle $1
	octave 3
	callchannel Music_AltoMare_Ch1_Type1
;Bar 41
	callchannel Music_AltoMare_Ch1_Type2
;Bar 42
	callchannel Music_AltoMare_Ch1_Type3
;Bar 43
	callchannel Music_AltoMare_Ch1_Type4
;Bar 44
	callchannel Music_AltoMare_Ch1_Type1
;Bar 45
	callchannel Music_AltoMare_Ch1_Type2
;Bar 46
	callchannel Music_AltoMare_Ch1_Type5
;Bar 47
	callchannel Music_AltoMare_Ch1_Type6
;Bar 48
	dutycycle $2
	intensity $58
	callchannel Music_AltoMare_Ch1_Bar48_53
;Bar 54
	note A_, 8
	note G_, 8
;Bar 55
	note F_, 8
	note C_, 8
;Bar 56
	callchannel Music_AltoMare_Ch1_Bar48_53
;Bar 62
	intensity $78
	note E_, 8
	note D_, 8
;Bar 63
	note C_, 16
;Bar 64
	loopchannel 0, Music_AltoMare_Ch1_loop

Music_AltoMare_Ch1_Intro:
	note A_, 1
	loopchannel 16, Music_AltoMare_Ch1_Intro
	endchannel

Music_AltoMare_Ch1_Type1:
	note A_, 2;
	note __, 2
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 2
	note A_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type2:
	note G_, 2;
	note __, 2
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 2
	note G_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type3:
	note A#, 4;
	note A#, 2
	note __, 2
	octave 4
	note C_, 4
	note C_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type4:
	octave 3;
	note A_, 4
	note A_, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type5:
	note A_, 4;
	note A_, 2
	note E_, 4
	note E_, 2
	note __, 4
	endchannel

Music_AltoMare_Ch1_Type6:
	note F_, 4;
	note F_, 2
	note C_, 4
	note C_, 2
	note C_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type7:
	octave 4
	note D_, 2;
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type8:
	note F_, 2;
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type9:
	octave 3
	note A#, 2;
	note __, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type10:
	note A_, 2;
	note __, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Type11:
	note C_, 2;
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	endchannel

Music_AltoMare_Ch1_Bar48_53:
	octave 4
	note A#, 16
;Bar 49
	note A#, 16
;Bar 50
	note A_, 16
;Bar 51
	note A_, 16
;Bar 52
	note A#, 16
;Bar 53
	note A#, 12
	note __, 4
	endchannel

; ============================================================================================================

Music_AltoMare_Ch2:
	dutycycle $2
	notetype 12, $88
	vibrato $00, $1b
	stereopanning $f0
;Bar 1
	note __, 16
	note __, 16
;Bar 3
	octave 5
	intensity $2e
	note D_, 12
	notetype 6, $88
	note C_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
;Bar 4
	notetype 12, $85
	note D_, 10
	intensity $2e
	note A_, 12
	intensity $78
;Bar 5
	note __, 16
	note __, 8
;Bar 6
	octave 3
	intensity $58
	note A_, 2
;Bar 7
	intensity $2e
	octave 4
	note A_, 12
	octave 2
	vibrato $08, $1b
	intensity $98
	note A_, 4
Music_AltoMare_Ch2_loop:
;Bar 8
	octave 3
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 9
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 10
	callchannel Music_AltoMare_Ch2_Bar10
;Bar 11
	callchannel Music_AltoMare_Ch2_Bar11
	octave 2
	note A_, 4
;Bar 12
	octave 3
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 13
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 14
	callchannel Music_AltoMare_Ch2_Bar14
;Bar 15
	callchannel Music_AltoMare_Ch2_Bar15
	octave 2
	note A_, 4
;Bar 16
	octave 3
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 17
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 18
	callchannel Music_AltoMare_Ch2_Bar10
;Bar 19
	callchannel Music_AltoMare_Ch2_Bar11
	octave 2
	note A_, 4
;Bar 20
	octave 3
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 21
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 22
	callchannel Music_AltoMare_Ch2_Bar14
;Bar 23
	callchannel Music_AltoMare_Ch2_Bar15
	note A_, 4
;Bar 24
	callchannel Music_AltoMare_Ch2_Bar24
;Bar 25
	note F_, 8
	note C_, 4
	octave 3
	note A_, 4
;Bar 26
	callchannel Music_AltoMare_Ch2_Bar26
;Bar 27
	intensity $4d
	note A_, 8
	intensity $98
	note __, 4
	note A_, 4
;Bar 28
	callchannel Music_AltoMare_Ch2_Bar24
;Bar 29
	note F_, 8
	note C_, 4
	octave 3
	note A_, 4
;Bar 30
	note G#, 2
	note A_, 2
	note B_, 4
	octave 4
	note E_, 4
	octave 3
	note B_, 2
	octave 4
	note D_, 2
;Bar 31
	intensity $4d
	note C#, 8
	intensity $98
	note __, 4
	octave 3
	note A_, 2
	note B_, 1
	octave 4
	note C#, 1
;Bar 32
	callchannel Music_AltoMare_Ch2_Bar24
;Bar 33
	note F_, 8
	note C_, 4
	octave 3
	note A_, 4
;Bar 34
	callchannel Music_AltoMare_Ch2_Bar26
;Bar 35
	note A_, 8
	note __, 4
	note A_, 4
;Bar 36
	callchannel Music_AltoMare_Ch2_Bar24
;Bar 37
	note F_, 8
	note G_, 4
	note A_, 4
;Bar 38
	note B_, 2
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
;Bar 39
	note C#, 3
	note __, 4
	notetype 6, $88
	note E_, 1
	note G_, 1
	notetype 12, $88
	note A_, 2
	note __, 6
;Bar 40
	octave 4
	intensity $88
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 41
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 42
	callchannel Music_AltoMare_Ch2_Bar10
;Bar 43
	callchannel Music_AltoMare_Ch2_Bar11
	octave 3
	note A_, 4
;Bar 44
	octave 4
	callchannel Music_AltoMare_Ch2_Bar8
;Bar 45
	callchannel Music_AltoMare_Ch2_Bar9
;Bar 46
	callchannel Music_AltoMare_Ch2_Bar14
;Bar 47
	note D_, 12
	note __, 4
;Bar 48
	intensity $a7
	dutycycle $3
	octave 3
	callchannel Music_AltoMare_Ch2_Bar48_49
;Bar 50
	intensity $98
	note A_, 16
	intensity $97
	note A_, 10
;Bar 51
	note __, 2
	note A_, 4
;Bar 52
	callchannel Music_AltoMare_Ch2_Bar52_53
;Bar 54
	octave 3
	note A_, 10
	octave 4
	note E_, 2
	note F_, 2
	note G_, 2
;Bar 55
	note A_, 3
	note G_, 1
	note F_, 2
	note G_, 2
	notetype 8, $a7
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	notetype 12, $a7
;Bar 56
	octave 3
	callchannel Music_AltoMare_Ch2_Bar48_49
;Bar 58
	note A_, 8
	octave 4
	note C_, 8
;Bar 59
	note E_, 10
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
;Bar 60
	callchannel Music_AltoMare_Ch2_Bar52_53
;Bar 62
	intensity $68
	octave 3
	note A_, 16
	note A_, 8
	note __, 4
;Bar 64
	dutycycle $2
	intensity $98
	octave 2
	note A_, 4
	loopchannel 0, Music_AltoMare_Ch2_loop

Music_AltoMare_Ch2_Bar8:
	note D_, 2;
	note __, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note E_, 2
	note D_, 2
	endchannel

Music_AltoMare_Ch2_Bar9:
	note G_, 6;
	note A_, 1
	note G_, 1
	note F_, 4
	note E_, 4
	endchannel

Music_AltoMare_Ch2_Bar10:
	note F_, 2;
	note E_, 2
	note F_, 4
	note G_, 2
	note F_, 2
	note G_, 4
	endchannel

Music_AltoMare_Ch2_Bar11:
	intensity $4e
	note A_, 10
	notetype 6, $98
	note G_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	notetype 12, $98
	endchannel

Music_AltoMare_Ch2_Bar14:
	note F_, 2;
	note G_, 2
	note A_, 4
	note E_, 4
	note C_, 2
	note E_, 2
	endchannel

Music_AltoMare_Ch2_Bar15:
	intensity $4d
	note D_, 8
	intensity $98
	note __, 4
	endchannel

Music_AltoMare_Ch2_Bar24:
	octave 4;
	note D_, 2
	note __, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note E_, 4
	endchannel

Music_AltoMare_Ch2_Bar26:
	note A#, 2;
	note A_, 2
	note G_, 4
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 4
	endchannel

Music_AltoMare_Ch2_Bar48_49:
	note A#, 8
	octave 4
	note C_, 4
	note D_, 4
;Bar 49
	note F_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	endchannel

Music_AltoMare_Ch2_Bar52_53:
	note A#, 8
	octave 4
	note C_, 4
	note D_, 4
;Bar 53
	note F_, 4
	note E_, 4
	note D_, 4
	note F_, 4
	endchannel

; ============================================================================================================

Music_AltoMare_Ch3:
	notetype 12, $13
	;stereopanning $f
;Bar 1
	note __, 16
;Bar 2
	callchannel Music_AltoMare_Ch3_Type1
;Bar 3
	callchannel Music_AltoMare_Ch3_Type2
;Bar 4
	callchannel Music_AltoMare_Ch3_Type1
;Bar 5
	callchannel Music_AltoMare_Ch3_Type2
;Bar 6
	callchannel Music_AltoMare_Ch3_Type1
;Bar 7
	callchannel Music_AltoMare_Ch3_Type2
Music_AltoMare_Ch3_loop:
;Bar 8
	callchannel Music_AltoMare_Ch3_Type1
;Bar 9
	callchannel Music_AltoMare_Ch3_Type2
;Bar 10
	callchannel Music_AltoMare_Ch3_Type3
;Bar 11
	callchannel Music_AltoMare_Ch3_Type4
;Bar 12
	callchannel Music_AltoMare_Ch3_Type1
;Bar 13
	callchannel Music_AltoMare_Ch3_Type2
;Bar 14
	callchannel Music_AltoMare_Ch3_Bar14_15
;Bar 16
	callchannel Music_AltoMare_Ch3_Type1
;Bar 17
	callchannel Music_AltoMare_Ch3_Type2
;Bar 18
	callchannel Music_AltoMare_Ch3_Type3
;Bar 19
	callchannel Music_AltoMare_Ch3_Type4
;Bar 20
	callchannel Music_AltoMare_Ch3_Type1
;Bar 21
	callchannel Music_AltoMare_Ch3_Type2
;Bar 22
	callchannel Music_AltoMare_Ch3_Bar14_15
;Bar 24
	callchannel Music_AltoMare_Ch3_Bar24_25
;Bar 26
	note G_, 6
	note __, 2
	note G_, 6
	note __, 2
;Bar 27
	note D_, 6
	note __, 2
	note D_, 2
	note A_, 2
	note E_, 2
	note C_, 2
;Bar 28
	callchannel Music_AltoMare_Ch3_Bar24_25
;Bar 30
	note G#, 4
	note B_, 2
	octave 3
	note C#, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note D_, 2
;Bar 31
	note C#, 4
	note __, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
;Bar 32
	callchannel Music_AltoMare_Ch3_Bar24_25
;Bar 34
	note G_, 6
	note __, 2
	note G_, 6
	note __, 2
;Bar 35
	note D_, 6
	note __, 2
	note D_, 2
	note A_, 2
	note E_, 2
	note C_, 2
;Bar 36
	callchannel Music_AltoMare_Ch3_Bar24_25
;Bar 38
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A#, 2
	note __, 2
;Bar 39
	note A_, 2
	note __, 6
	note A_, 2
	note E_, 1
	note C_, 1
	octave 1
	note A_, 2
	note __, 2
;Bar 40
	callchannel Music_AltoMare_Ch3_Type1
;Bar 41
	callchannel Music_AltoMare_Ch3_Type2
;Bar 42
	callchannel Music_AltoMare_Ch3_Type3
;Bar 43
	callchannel Music_AltoMare_Ch3_Type4
;Bar 44
	callchannel Music_AltoMare_Ch3_Type1
;Bar 45
	callchannel Music_AltoMare_Ch3_Type2
;Bar 46
	callchannel Music_AltoMare_Ch3_Bar14_15
;Bar 48
	callchannel Music_AltoMare_Ch3_Bar48_49
;Bar 50
	callchannel Music_AltoMare_Ch3_Bar50_51
;Bar 52
	callchannel Music_AltoMare_Ch3_Bar48_49
;Bar 54
	callchannel Music_AltoMare_Ch3_Bar54_55
;Bar 56
	callchannel Music_AltoMare_Ch3_Bar48_49
;Bar 58
	callchannel Music_AltoMare_Ch3_Bar50_51
;Bar 60
	callchannel Music_AltoMare_Ch3_Bar48_49
;Bar 62
	callchannel Music_AltoMare_Ch3_Bar54_55
	loopchannel 0, Music_AltoMare_Ch3_loop

Music_AltoMare_Ch3_Type1:
	octave 3;
	note D_, 6
	note __, 2
	octave 2
	note A_, 6
	note __, 2
	endchannel

Music_AltoMare_Ch3_Type2:
	note E_, 6;
	note __, 2
	note C_, 6
	note __, 2
	endchannel

Music_AltoMare_Ch3_Type3:
	note F_, 6;
	note __, 2
	note G_, 6
	note __, 2
	endchannel

Music_AltoMare_Ch3_Type4:
	note A_, 6;
	note __, 2
	octave 1
	note A_, 6
	note __, 2
	endchannel

Music_AltoMare_Ch3_Bar14_15:
	note A_, 6
	note C_, 6
	note __, 4
;Bar 15
	note F_, 6
	note C_, 6
	note __, 4
	endchannel

Music_AltoMare_Ch3_Bar24_25:
	note A#, 6
	note __, 2
	note A#, 6
	note __, 2
;Bar 25
	note A_, 6
	note __, 2
	note A_, 6
	note __, 2
	endchannel

Music_AltoMare_Ch3_Bar48_49:
	note D_, 6
	note __, 2
	note A#, 6
	note __, 2
	loopchannel 2, Music_AltoMare_Ch3_Bar48_49
	endchannel

Music_AltoMare_Ch3_Bar50_51:
	note C_, 6
	note __, 2
	note A_, 6
	note __, 2
	loopchannel 2, Music_AltoMare_Ch3_Bar50_51
	endchannel

Music_AltoMare_Ch3_Bar54_55:
	note C_, 6
	note __, 2
	note G_, 6
	note __, 2
	octave 1
	note A_, 6
	note __, 2
	octave 2
	note C_, 6
	note __, 2
	endchannel

; ============================================================================================================

Music_AltoMare_Ch4:
	;stereopanning $f0
	togglenoise 1
	notetype 12
;Bar 1
	note C_, 2
	note A_, 1
	note C_, 1
	note A_, 2
	note A_, 2
	note F_, 2
	note F_, 2
	note F_, 4
;Bar 2
	note F_, 6
	note E_, 6
	note A_, 4
;Bar 3
	callchannel Music_AltoMare_Ch4_Type1
;Bar 4
	callchannel Music_AltoMare_Ch4_Type1
;Bar 5
	callchannel Music_AltoMare_Ch4_Type1
;Bar 6
	callchannel Music_AltoMare_Ch4_Type1
;Bar 7
	note E_, 6
	note E_, 2
	note E_, 4
	note F_, 4
Music_AltoMare_Ch4_loop:
;Bar 8
	callchannel Music_AltoMare_Ch4_Type1
;Bar 9
	callchannel Music_AltoMare_Ch4_Type1
;Bar 10
	callchannel Music_AltoMare_Ch4_Type1
;Bar 11
	callchannel Music_AltoMare_Ch4_Type2
;Bar 12
	callchannel Music_AltoMare_Ch4_Type1
;Bar 13
	callchannel Music_AltoMare_Ch4_Type1
;Bar 14
	callchannel Music_AltoMare_Ch4_Type1
;Bar 15
	callchannel Music_AltoMare_Ch4_Bar15
;Bar 16
	callchannel Music_AltoMare_Ch4_Type1
;Bar 17
	callchannel Music_AltoMare_Ch4_Type1
;Bar 18
	callchannel Music_AltoMare_Ch4_Type1
;Bar 19
	callchannel Music_AltoMare_Ch4_Type2
;Bar 20
	callchannel Music_AltoMare_Ch4_Type1
;Bar 21
	callchannel Music_AltoMare_Ch4_Type1
;Bar 22
	callchannel Music_AltoMare_Ch4_Type1
;Bar 23
	callchannel Music_AltoMare_Ch4_Bar15

Music_AltoMare_Ch4_Bar24_27:
;Bar 24
	note E_, 6;
	note A_, 2
	note E_, 4
	note A_, 4
;Bar 25
	note E_, 6;
	note A_, 2
	note E_, 4
	note A_, 4
;Bar 26
	note E_, 6;
	note A_, 2
	note E_, 4
	note A_, 4
;Bar 27
	note E_, 6
	note A_, 2
	note E_, 2
	note A_, 4
	note E_, 2
	loopchannel 4, Music_AltoMare_Ch4_Bar24_27
;Bar 40
	callchannel Music_AltoMare_Ch4_Type1
;Bar 41
	callchannel Music_AltoMare_Ch4_Type1
;Bar 42
	callchannel Music_AltoMare_Ch4_Type1
;Bar 43
	callchannel Music_AltoMare_Ch4_Type2
;Bar 44
	callchannel Music_AltoMare_Ch4_Type1
;Bar 45
	callchannel Music_AltoMare_Ch4_Type1
;Bar 46
	callchannel Music_AltoMare_Ch4_Type1
;Bar 47
	callchannel Music_AltoMare_Ch4_Bar15
;Bar 48
Music_AltoMare_Ch4_Bar48_49:
	note E_, 4
	note E_, 2
	note A_, 6
	note E_, 2
	note E_, 4
;Bar 49
	note A_, 2
	note E_, 2
	note E_, 2
	note A_, 4
	note E_, 4
	loopchannel 8, Music_AltoMare_Ch4_Bar48_49
	loopchannel 0, Music_AltoMare_Ch4_loop

Music_AltoMare_Ch4_Type1:
	note E_, 6;
	note E_, 6
	note A_, 4
	endchannel

Music_AltoMare_Ch4_Type2:
	note E_, 6;
	note E_, 2
	note E_, 4
	note F_, 4
	endchannel

Music_AltoMare_Ch4_Bar15:
	note E_, 2;
	note E_, 4
	note E_, 2
	note E_, 4
	note F_, 4
	endchannel
