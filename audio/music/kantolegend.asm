Music_KantoLegend:
	dbw $80, Music_KantoLegend_Ch1
	dbw $01, Music_KantoLegend_Ch2
	dbw $02, Music_KantoLegend_Ch3

Music_KantoLegend_Ch1:
; Pat 0 Row 0
	tempo $6a
	dutycycle $2
	notetype $c, $c7
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
; Pat 1 Row 0
Music_KantoLegend_Ch1_L1:
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	loopchannel 4, Music_KantoLegend_Ch1_L1
Music_KantoLegend_Ch1_L2:
	note D_, 1
	note __, 1
	note D_, 1
	note __, 5
	loopchannel 4, Music_KantoLegend_Ch1_L2
; Pat 2 Row 0
Music_KantoLegend_Ch1_L3:
	note E_, 1
	note __, 1
	note E_, 1
	note __, 5
	loopchannel 7, Music_KantoLegend_Ch1_L3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	intensity $74
	octave 4
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
; Pat 3 Row 0
	note E_, 1
Music_KantoLegend_Ch1_L:
	dutycycle $2
	intensity $53
Music_KantoLegend_Ch1_L4:
	octave 2
	note C_, 2
	note F_, 2
	note G_, 2
	octave 3
	note C_, 2
	loopchannel 4, Music_KantoLegend_Ch1_L4
Music_KantoLegend_Ch1_L5:
	octave 2
	note D_, 2
	note G_, 2
	note A_, 2
	octave 3
	note D_, 2
	loopchannel 4, Music_KantoLegend_Ch1_L5
; Pat 4 Row 1
Music_KantoLegend_Ch1_L6:
	octave 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	loopchannel 7, Music_KantoLegend_Ch1_L6
	octave 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 1
; Pat 5 Row 0
Music_KantoLegend_Ch1_L7:
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	octave 5
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	octave 5
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	octave 5
	note C_, 1
	octave 3
	note C_, 1
	octave 5
	note C_, 1
	octave 3
	note C_, 1
	loopchannel 2, Music_KantoLegend_Ch1_L7
Music_KantoLegend_Ch1_L8:
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 5
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 5
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	octave 5
	note D_, 1
	octave 3
	note D_, 1
	octave 5
	note D_, 1
	octave 3
	note D_, 1
	loopchannel 2, Music_KantoLegend_Ch1_L8
; Pat 6 Row 0
Music_KantoLegend_Ch1_L9:
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	octave 2
	note E_, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	loopchannel 3, Music_KantoLegend_Ch1_L9
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 5
	note E_, 1
	octave 3
	note E_, 1
	intensity $74
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
; Pat 7 Row 0
	dutycycle $1
	intensity $c5
	octave 3
	note G_, 6
	note F#, 6
	note E_, 4
	note G_, 6
	note A_, 6
	note G_, 4
	octave 4
	note G#, 12
	note G_, 2
	note __, 2
	note G#, 2
	note G_, 2
	note __, 4
	intensity $b7
	octave 5
	note C#, 8
; Pat 8 Row 0
	intensity $c5
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	note G#, 4
	octave 4
	note C#, 6
	note C_, 6
	octave 3
	note A#, 4
	octave 4
	note F_, 6
	note E_, 6
	note D_, 4
	intensity $c7
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note D_, 4
	note F_, 4
; Pat 9 Row 0
	intensity $c0
	note G#, 16
	intensity $b0
	note G#, 16
	intensity $4e
	note G_, 16
	intensity $c7
	note G_, 16
; Pat 10 Row 0
	octave 3
	note F_, 8
	note A#, 8
	octave 4
	note D_, 8
	note F_, 8
	intensity $c0
	note E_, 16
	intensity $c7
	note E_, 16
; Pat 11 Row 0
	octave 3
	note F_, 8
	note A#, 8
	octave 4
	note D_, 8
	note F_, 8
	intensity $c0
	note G_, 16
	intensity $3f
	octave 5
	note C_, 16
; Pat 12 Row 0
	dutycycle $2
	intensity $43
	note C_, 1
	note E_, 1
	note G_, 1
	octave 6
	note C_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	octave 6
	note C_, 1
	octave 5
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	octave 6
	note D_, 1
	octave 5
	note D_, 1
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	octave 6
	note D_, 1
	octave 5
	note G_, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
; Pat 13 Row 0
Music_KantoLegend_Ch1_L10:
	note E_, 1
	note G_, 1
	note B_, 1
	octave 6
	note E_, 1
	octave 5
	note E_, 1
	octave 6
	note E_, 1
	octave 5
	note B_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 6
	note E_, 1
	octave 5
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 6
	note E_, 1
	octave 5
	note B_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 6
	note E_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note E_, 1
	octave 5
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	loopchannel 2, Music_KantoLegend_Ch1_L10
; Pat 14 Row 0
	dutycycle $1
	intensity $c5
	octave 4
	note E_, 12
	note E_, 2
	note __, 2
	note F_, 2
	intensity $c2
	note E_, 4
	note __, 10
	intensity $c5
	note F_, 12
	note F_, 2
	note __, 2
	note G#, 2
	intensity $c2
	note G_, 6
	intensity $c5
	note F_, 8
; Pat 15 Row 0
	note G_, 12
	note G_, 2
	note __, 2
	note A_, 2
	intensity $c2
	note G_, 4
	note __, 10
	intensity $c5
	note G_, 12
	note G_, 2
	note __, 2
	note A_, 2
	intensity $c2
	note G_, 6
	intensity $c5
	note G_, 9
	loopchannel 0, Music_KantoLegend_Ch1_L

Music_KantoLegend_Ch2:
; Pat 0 Row 0
	dutycycle $1
	notetype $c, $c2
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 1
	note F#, 1
	note F_, 1
	octave 4
	note G_, 1
; Pat 1 Row 0
	octave 2
Music_KantoLegend_Ch2_L1:
	note C_, 2
	note C_, 6
	loopchannel 4, Music_KantoLegend_Ch2_L1
Music_KantoLegend_Ch2_L2:
	note D_, 2
	note D_, 6
	loopchannel 4, Music_KantoLegend_Ch2_L2
; Pat 2 Row 0
Music_KantoLegend_Ch2_L3:
	note E_, 2
	note E_, 6
	loopchannel 6, Music_KantoLegend_Ch2_L3
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
; Pat 3 Row 0
	intensity $b7
Music_KantoLegend_Ch2_L:
	callchannel Music_KantoLegend_Ch2_P_C
	callchannel Music_KantoLegend_Ch2_P_Dm
; Pat 4 Row 0
	callchannel Music_KantoLegend_Ch2_P_Em
; Pat 5 Row 0
	callchannel Music_KantoLegend_Ch2_P_C
	callchannel Music_KantoLegend_Ch2_P_Dm
; Pat 6 Row 0
	callchannel Music_KantoLegend_Ch2_P_Em
; Pat 7 Row 0
	callchannel Music_KantoLegend_Ch2_P_C2
	callchannel Music_KantoLegend_Ch2_P_C#
; Pat 8 Row 0
	callchannel Music_KantoLegend_Ch2_P_C2
	callchannel Music_KantoLegend_Ch2_P_C2
; Pat 9 Row 0
	callchannel Music_KantoLegend_Ch2_P_C#
	callchannel Music_KantoLegend_Ch2_P_C
; Pat 10 Row 0
	note C_, 2
	note C_, 2
	note A#, 4
	note C_, 2
	note C_, 2
	note A#, 4
	note C_, 2
	note F_, 2
	note C_, 2
	note C_, 4
	note C_, 2
	note A#, 4
	callchannel Music_KantoLegend_Ch2_P_C
; Pat 11 Row 0
	note C_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	callchannel Music_KantoLegend_Ch2_P_C
; Pat 12 Row 0
	callchannel Music_KantoLegend_Ch2_P_C
	callchannel Music_KantoLegend_Ch2_P_Dm
; Pat 13 Row 0
	callchannel Music_KantoLegend_Ch2_P_Em
; Pat 14 Row 0
	callchannel Music_KantoLegend_Ch2_P_C
	callchannel Music_KantoLegend_Ch2_P_Dm
; Pat 15 Row 0
	callchannel Music_KantoLegend_Ch2_P_Em
	loopchannel 0, Music_KantoLegend_Ch2_L

Music_KantoLegend_Ch2_P_C:
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	endchannel

Music_KantoLegend_Ch2_P_C2:
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	octave 2
	note C_, 2
	octave 1
	note C_, 2
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note F#, 2
	endchannel

Music_KantoLegend_Ch2_P_C#:
	note C#, 2
	octave 2
	note C#, 2
	octave 1
	note G#, 2
	note F#, 2
	note C#, 2
	octave 2
	note C#, 2
	octave 1
	note G#, 2
	note F#, 2
	note C#, 2
	note G#, 2
	note F#, 2
	octave 2
	note C#, 2
	octave 1
	note C#, 2
	octave 2
	note C#, 2
	octave 1
	note G#, 2
	note F#, 2
	endchannel

Music_KantoLegend_Ch2_P_Dm:
	octave 1
	note D_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	note G_, 2
	note D_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note G_, 2
	octave 2
	note D_, 2
	octave 1
	note D_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	note G_, 2
	endchannel

Music_KantoLegend_Ch2_P_Em:
	octave 1
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	note E_, 2
	note B_, 2
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	note E_, 2
	note B_, 2
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note E_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	note A_, 2
	endchannel

Music_KantoLegend_Ch3:
; Pat 0 Row 0
	notetype $c, $14
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	octave 4
	note C#, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	octave 4
	note D#, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	octave 4
	note F_, 1
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	octave 4
	note F#, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	octave 4
	note G_, 1
; Pat 1 Row 0
	callchannel Music_KantoLegend_Ch3_P1
; Pat 2 Row 0
; Pat 3 Row 0
Music_KantoLegend_Ch3_L:
	intensity $14
	callchannel Music_KantoLegend_Ch3_P1
; Pat 4 Row 0
; Pat 5 Row 0
	callchannel Music_KantoLegend_Ch3_P1
; Pat 6 Row 0
; Pat 7 Row 0
	intensity $26
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
; Pat 8 Row 0
	note A_, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
; Pat 9 Row 0
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
; Pat 10 Row 0
	intensity $16
	note D_, 4
	note C_, 4
	note D_, 4
	note F_, 4
	note E_, 6
	note D_, 6
	note F_, 4
	note A_, 16
	note G_, 16
; Pat 11 Row 0
	note D_, 4
	note C_, 4
	note D_, 4
	note F_, 4
	note G_, 6
	note A_, 6
	note B_, 4
	octave 5
	note C_, 16
	octave 4
	note G_, 8
	intensity $20
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
; Pat 12 Row 0
	note E_, 4
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 12
; Pat 14 Row 0
	intensity $10
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
; Pat 15 Row 0
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note E_, 1
	note __, 1
	loopchannel 0, Music_KantoLegend_Ch3_L

Music_KantoLegend_Ch3_P1:
	octave 3
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	endchannel
