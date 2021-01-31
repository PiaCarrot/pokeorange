;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 4.0 (17-Jun-2020)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_Route24GBS:
	musicheader 4, 1, Music_Route24GBS_Ch1
	musicheader 1, 2, Music_Route24GBS_Ch2
	musicheader 1, 3, Music_Route24GBS_Ch3
	musicheader 1, 4, Music_Route24GBS_Ch4

Music_Route24GBS_Ch1:
	volume $77
	dutycycle $3
	notetype 12, $97
	tone $0001
	stereopanning $f
	tempo 175
	vibrato $04, $22
;Bar 1
	octave 2
	note G#, 4
Music_Route24GBS_Ch1_loop:
	dutycycle $3
	callchannel Music_Route24GBS_Ch1_Bar1
;Bar 2
	note A_, 6
	intensity $87
	note A_, 1
	note G#, 1
	note F#, 4
;Bar 3
	intensity $97
	note G#, 4
	callchannel Music_Route24GBS_Ch1_Bar1
    callchannel Music_Route24GBS_Ch1_Part1
;Bar 9
	callchannel Music_Route24GBS_Ch1_Bar9
	note E_, 1
	note F#, 1
	note G#, 1
	note __, 1
	note F#, 1
	note E_, 1
;Bar 11
	dutycycle $0
	callchannel Music_Route24GBS_Ch1_Bar9
	note G#, 1
	note A_, 1
	note B_, 1
	note __, 1
	note A_, 1
	note G#, 1
    dutycycle $3
	intensity $97
    callchannel Music_Route24GBS_Ch1_Part2
	loopchannel 0, Music_Route24GBS_Ch1_loop

Music_Route24GBS_Ch1_Bar1:
	octave 2;
	note __, 2
	note G#, 1
	note B_, 1
	note A_, 4
	note F#, 2
	octave 3
	note C#, 2
;Bar 2
	octave 2
	intensity $95
	note B_, 2
	note __, 1
	intensity $97
	note G#, 1
	endchannel

Music_Route24GBS_Ch1_Bar9:
	intensity $97
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note D_, 1
	note __, 1
	note A_, 4
;Bar 12
	intensity $95
	note G#, 2
	note __, 1
	intensity $97
	note F#, 1
	note E_, 6
	octave 2
	endchannel

Music_Route24GBS_Ch1_Part1:
;Bar 4
	octave 3
	note E_, 6
	intensity $87
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 4
;Bar 5
	intensity $77
	note A_, 2
	note E_, 2
	octave 2
	note A_, 4
	octave 3
	note G#, 2
	note E_, 2
	octave 2
	note G#, 4
;Bar 6
	octave 3
	note F#, 2
	note C#, 2
	octave 2
	note F#, 4
	octave 3
	note E_, 2
	note C#, 2
	note D#, 2
	note C#, 2
;Bar 7
	intensity $97
	octave 2
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 6
	intensity $87
	note F#, 1
	note __, 1
	intensity $97
	octave 3
	note D_, 4
;Bar 8
	intensity $95
	note E_, 2
	note __, 1
	intensity $97
	octave 2
	note A_, 1
	note G#, 6
	intensity $87
	note E_, 1
	note __, 1
	note A_, 2
	note G#, 2
    endchannel

Music_Route24GBS_Ch1_Part2:
;Bar 13
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note __, 2
;Bar 14
	octave 2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 2
	note D#, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 4
	note G#, 4
    endchannel

; ============================================================================================================

Music_Route24GBS_Ch2:
	dutycycle $1
	notetype 12, $c7
	stereopanning $f0
	vibrato $04, $22
;Bar 1
	octave 3
	note E_, 6
Music_Route24GBS_Ch2_loop:
	dutycycle $1
	callchannel Music_Route24GBS_Ch2_Bar1_2
	note F#, 9
	note __, 3
;Bar 3
	note E_, 6
	callchannel Music_Route24GBS_Ch2_Bar1_2
	note B_, 9
	note __, 3
    dutycycle $0
    callchannel Music_Route24GBS_Ch2_Part1
    dutycycle $1
	intensity $c7
	note F#, 2
	note E_, 2
;Bar 9
	callchannel Music_Route24GBS_Ch2_Bar9
;Bar 11
	callchannel Music_Route24GBS_Ch2_Bar9
    callchannel Music_Route24GBS_Ch2_Part2
	loopchannel 0, Music_Route24GBS_Ch2_loop

Music_Route24GBS_Ch2_Bar9:
	note D_, 2;
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note __, 2
	octave 4
	note C#, 4
;Bar 10
	octave 3
	intensity $c5
	note B_, 2
	note __, 1
	intensity $c7
	note A_, 1
	note G#, 9
	note __, 3
	endchannel

Music_Route24GBS_Ch2_Bar1_2:
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 6
	note A_, 2
	intensity $c5
	note G#, 2
	note __, 1
	intensity $c7
	note E_, 1
	endchannel

Music_Route24GBS_Ch2_Part1:
;Bar 5
	intensity $b7
	octave 4
	note C#, 6
	intensity $c7
	octave 3
	note B_, 1
	note A_, 1
	intensity $b7
	note B_, 6
	intensity $c7
	note A_, 1
	note G#, 1
;Bar 6
	intensity $b7
	note A_, 6
	intensity $c7
	note G#, 1
	note F#, 1
	intensity $b7
	note G#, 4
	dutycycle $2
	intensity $a7
	note F#, 2
	note E_, 2
;Bar 7
	intensity $b7
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 8
	note A_, 4
;Bar 8
	intensity $b5
	note G#, 2
	note __, 1
	intensity $b7
	note F#, 1
	note E_, 8
    endchannel

Music_Route24GBS_Ch2_Part2:
;Bar 13
	dutycycle $2
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note A_, 1
	note B_, 1
	octave 4
	note C#, 2
	note __, 2
;Bar 14
	octave 3
	note D#, 2
	note D#, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note B_, 1
	octave 4
	note C#, 1
	note D#, 2
	notetype 6, $97
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
;Bar 15
	note D#, 1
	notetype 12, $c7
	note E_, 6
    endchannel

; ============================================================================================================

Music_Route24GBS_Ch3:
	notetype 6, $13
Music_Route24GBS_Ch3_loop:
;Bar 1
	callchannel Music_Route24GBS_Ch3_Bar1
	octave 1
	note B_, 8
;Bar 3
	callchannel Music_Route24GBS_Ch3_Bar1
	note G#, 8
    intensity $24
;Bar 5
	callchannel Music_Route24GBS_Ch3_Bar5_6
;Bar 7
rept 4
	intensity $13
	octave 2
	note D_, 2
	note __, 2
	intensity $25
	octave 5
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
endr
;Bar 8
rept 4
	intensity $13
	octave 2
	note E_, 2
	note __, 2
	octave 5
	intensity $25
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
endr
;Bar 9
rept 4
	intensity $13
	octave 1
	note B_, 2
	note __, 2
	octave 6
	intensity $25
	note D_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
endr
;Bar 10
rept 4
	intensity $13
	octave 2
	note E_, 2
	note __, 2
	intensity $25
	octave 6
	note E_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
endr
;Bar 11
rept 4
	intensity $13
	octave 1
	note B_, 2
	intensity $25
	octave 4
	note A_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
endr
;Bar 12
rept 4
	intensity $13
	octave 2
	note E_, 2
	intensity $25
	octave 4
	note B_, 1
	note __, 1
	octave 6
	note G#, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
endr
;Bar 13
	intensity $13
	callchannel Music_Route24GBS_Ch3_Bar13
	loopchannel 0, Music_Route24GBS_Ch3_loop

Music_Route24GBS_Ch3_Bar1:
	octave 2
	note E_, 8
	note __, 16
	note D_, 8
;Bar 2
	note E_, 2
	note __, 16
	note __, 6
	endchannel

Music_Route24GBS_Ch3_Bar5_6:
    octave 3
	note A_, 1
	octave 5
	note C#, 2
	note E_, 1
	note A_, 1
	octave 6
	note C#, 2
	note E_, 1
	note A_, 1
	note E_, 2
	note C#, 1
	octave 5
	note A_, 1
	note E_, 2
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note B_, 2
	octave 5
	note E_, 1
	note G#, 1
	note B_, 2
	octave 6
	note E_, 1
	note G#, 1
	note E_, 2
	octave 5
	note B_, 1
	note G#, 1
	note E_, 2
	octave 4
	note B_, 1
;Bar 6
	octave 3
	note F#, 1
	octave 4
	note A_, 2
	octave 5
	note C#, 1
	note F#, 1
	note A_, 2
	octave 6
	note C#, 1
	note F#, 1
	note C#, 2
	octave 5
	note A_, 1
	note F#, 1
	note C#, 2
	octave 4
	note A_, 1
	octave 3
	note C#, 1
	octave 4
	note E_, 2
	note G#, 1
	octave 5
	note C#, 1
	note E_, 2
	note G#, 1
	octave 6
	note C#, 2
	note __, 6
    endchannel

Music_Route24GBS_Ch3_Bar13:
    octave 1
	note B_, 2
	note __, 16
	note __, 2
	note B_, 2
	note B_, 2
	note B_, 6
	note __, 2
;Bar 14
	note B_, 2
	note __, 16
	note __, 2
	note B_, 2
	note B_, 2
	note B_, 6
	note __, 2
    endchannel

; ============================================================================================================

Music_Route24GBS_Ch4:
	togglenoise 0
	notetype 6
;Bar 1
	callchannel Music_Route24GBS_Ch4_Type6
Music_Route24GBS_Ch4_loop:
	callchannel Music_Route24GBS_Ch4_Type1
;Bar 2
	callchannel Music_Route24GBS_Ch4_Type3
	callchannel Music_Route24GBS_Ch4_Type5
;Bar 3
	callchannel Music_Route24GBS_Ch4_Type3
	callchannel Music_Route24GBS_Ch4_Type1
;Bar 4
	callchannel Music_Route24GBS_Ch4_Type3
	callchannel Music_Route24GBS_Ch4_Type5
;Bar 5
	note G#, 2
	note __, 16
	note __, 16
	note __, 16
	note __, 14
;Bar 7
rept 2
	callchannel Music_Route24GBS_Ch4_Type4
;Bar 8
	note D#, 8
	note D#, 8
	note D#, 8
	note D#, 4
	callchannel Music_Route24GBS_Ch4_Type2
endr
;Bar 11
	callchannel Music_Route24GBS_Ch4_Type4
;Bar 12
	note D#, 8
	note D#, 8
	note D#, 4
	callchannel Music_Route24GBS_Ch4_Type2
	callchannel Music_Route24GBS_Ch4_Type5
;Bar 13
	note D#, 16
	note __, 4
	note D#, 2
	note D#, 2
	note A_, 4
	callchannel Music_Route24GBS_Ch4_Type2
;Bar 14
	note D#, 16
	note __, 4
	callchannel Music_Route24GBS_Ch4_Type2
	callchannel Music_Route24GBS_Ch4_Type5
;Bar 15
	callchannel Music_Route24GBS_Ch4_Type6
	loopchannel 0, Music_Route24GBS_Ch4_loop

Music_Route24GBS_Ch4_Type1:
	notetype 8
rept 6
	note D#, 1
endr
	notetype 6
	endchannel

Music_Route24GBS_Ch4_Type2:
	notetype 8
	note D#, 1
	note D#, 1
	note D#, 1
	notetype 6
	endchannel

Music_Route24GBS_Ch4_Type3:
	note D#, 12;
	note D#, 2
	note D#, 2
	note D#, 8
	endchannel

Music_Route24GBS_Ch4_Type4:
	note D#, 8;
	note D#, 8
	note D#, 8
	note D#, 4
	note D#, 2
	note D#, 2
	endchannel

Music_Route24GBS_Ch4_Type5:
rept 4
	note D#, 2
endr
	endchannel

Music_Route24GBS_Ch4_Type6:
	note G#, 12;
	note D#, 2
	note D#, 2
	note D#, 8
	endchannel

; ============================================================================================================
; ============================================================================================================

Music_Route24GBSNight:
	musicheader 4, 1, Music_Route24GBSNight_Ch1
	musicheader 1, 2, Music_Route24GBSNight_Ch2
	musicheader 1, 3, Music_Route24GBSNight_Ch3
	musicheader 1, 4, Music_Route24GBSNight_Ch4

Music_Route24GBSNight_Ch1:
	volume $77
	dutycycle $2
	notetype 12, $97
	tone $0001
	stereopanning $f
	tempo 183
	vibrato $04, $12
;Bar 1
	octave 2
	note G#, 4
Music_Route24GBSNight_Ch1_loop:
	dutycycle $2
	callchannel Music_Route24GBS_Ch1_Bar1
;Bar 2
	note A_, 6
	intensity $87
	note A_, 1
	note G#, 1
	note F#, 4
;Bar 3
	intensity $97
	note G#, 4
	callchannel Music_Route24GBS_Ch1_Bar1
    callchannel Music_Route24GBS_Ch1_Part1
;Bar 9
	callchannel Music_Route24GBS_Ch1_Bar9
	note E_, 1
	note F#, 1
	note G#, 1
	note __, 1
	note F#, 1
	note E_, 1
;Bar 11
	dutycycle $1
	callchannel Music_Route24GBS_Ch1_Bar9
	note G#, 1
	note A_, 1
	note B_, 1
	note __, 1
	note A_, 1
	note G#, 1
    dutycycle $2
	intensity $97
    callchannel Music_Route24GBS_Ch1_Part2
	loopchannel 0, Music_Route24GBSNight_Ch1_loop

Music_Route24GBSNight_Ch2:
	dutycycle $2
	notetype 12, $c7
	stereopanning $f0
	vibrato $04, $12
;Bar 1
	octave 3
	note E_, 6
Music_Route24GBSNight_Ch2_loop:
	dutycycle $2
	callchannel Music_Route24GBS_Ch2_Bar1_2
	note F#, 9
	note __, 3
;Bar 3
	note E_, 6
	callchannel Music_Route24GBS_Ch2_Bar1_2
	note B_, 9
	note __, 3
    dutycycle $1
    callchannel Music_Route24GBS_Ch2_Part1
    dutycycle $2
	intensity $c7
	note F#, 2
	note E_, 2
;Bar 9
	callchannel Music_Route24GBS_Ch2_Bar9
;Bar 11
	callchannel Music_Route24GBS_Ch2_Bar9
    callchannel Music_Route24GBS_Ch2_Part2
	loopchannel 0, Music_Route24GBSNight_Ch2_loop

Music_Route24GBSNight_Ch3:
	notetype 6, $13
Music_Route24GBSNight_Ch3_loop:
;Bar 1
	callchannel Music_Route24GBS_Ch3_Bar1
	octave 1
	note B_, 8
;Bar 3
	callchannel Music_Route24GBS_Ch3_Bar1
	note G#, 8
    intensity $34
;Bar 5
	callchannel Music_Route24GBS_Ch3_Bar5_6
;Bar 7
rept 4
	intensity $12
	octave 2
	note D_, 2
	note __, 2
	intensity $24
	octave 5
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
endr
;Bar 8
rept 4
	intensity $12
	octave 2
	note E_, 2
	note __, 2
	octave 5
	intensity $24
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
endr
;Bar 9
rept 4
	intensity $12
	octave 1
	note B_, 2
	note __, 2
	octave 6
	intensity $24
	note D_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
endr
;Bar 10
rept 4
	intensity $12
	octave 2
	note E_, 2
	note __, 2
	intensity $24
	octave 6
	note E_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
endr
;Bar 11
rept 4
	intensity $12
	octave 1
	note B_, 2
	intensity $24
	octave 4
	note A_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
endr
;Bar 12
rept 4
	intensity $12
	octave 2
	note E_, 2
	intensity $24
	octave 4
	note B_, 1
	note __, 1
	octave 6
	note G#, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
endr
;Bar 13
	intensity $12
	callchannel Music_Route24GBS_Ch3_Bar13
	loopchannel 0, Music_Route24GBSNight_Ch3_loop

Music_Route24GBSNight_Ch4:
	togglenoise $6
	notetype 6
;Bar 1
	callchannel Music_Route24GBS_Ch4_Type6
    callchannel Music_Route24GBS_Ch4_loop
    endchannel