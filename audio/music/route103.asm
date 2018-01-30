Music_Route103:;this song doesn't loop properly most likely (drums)
	dbw $C0, Music_Route103_Ch1
	dbw $01, Music_Route103_Ch2
	dbw $02, Music_Route103_Ch3
	dbw $03, Music_Route103_Ch4

Music_Route103_Ch1:
	tempo $98
	volume $77
	notetype $C, $97
	dutycycle 2
	octave 4
	note __, 16
	note __, 16
Music_Route103_Ch1_loop:
	notetype $C, $93
	tempo $90
	dutycycle 3
	tone $0001
	octave 2
	note D#, 4
	notetype $8, $93
	note D#, 8
	intensity $91
	note D#, 2
	note D#, 4
	note D#, 2
	note D#, 2
	intensity $93
	note C#, 6
	note C#, 8
	intensity $91
	note C#, 2
	note C#, 4
	note C#, 2
	note D_, 2
	note D#, 4
	note D#, 2
	intensity $93
	note D#, 8
	intensity $91
	note D#, 2
	note D#, 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C#, 2
	intensity $93
	note C#, 8
	intensity $91
	octave 1
	note A#, 2
	note A#, 2
	note A#, 2
	note G_, 2
	octave 2
	note C#, 2
	intensity $93
	octave 3
	note D#, 6
	note D#, 8
	intensity $91
	note D#, 2
	note D#, 4
	note D#, 2
	note D#, 2
	note C#, 4
	note C#, 2
	intensity $93
	note C#, 8
	intensity $91
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 2
	intensity $93
	octave 2
	note F_, 6
	note F_, 8
	intensity $91
	note F_, 2
	note F_, 4
	note F_, 2
	note F_, 2
	intensity $93
	octave 3
	note E_, 8
	intensity $91
	note F#, 2
	note E_, 2
	intensity $93
	note D#, 6
	octave 4
	note D#, 6
	intensity $95
	dutycycle 1
	octave 1
	note G#, 16
	intensity $91
	note G_, 2
	note G#, 2
	octave 2
	note C_, 2
	note D#, 2
	intensity $95
	octave 1
	note A#, 16
	intensity $91
	note A_, 2
	note A#, 2
	octave 2
	note F_, 2
	note G_, 2
	intensity $95
	note C_, 16
	intensity $91
	octave 1
	note B_, 2
	octave 2
	note C_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	note F_, 2
	note C_, 2
	note G#, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	intensity $95
	note G#, 16
	intensity $91
	note G_, 2
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note G#, 2
	intensity $95
	note A#, 16
	intensity $91
	note A_, 2
	octave 3
	note G_, 2
	note F_, 2
	octave 2
	note A#, 2
	intensity $95
	octave 3
	note C_, 16
	intensity $91
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 2
	note F_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	intensity $95
	octave 3
	note C_, 12
	intensity $91
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 5
	note C#, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note A#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	octave 4
	note A#, 1
	octave 5
	note D#, 1
	octave 4
	note A#, 1
	note G_, 1
	note A#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	note G_, 1
	note A#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	octave 2
	note A#, 1
	tempo $98
	octave 1
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	tempo $A0
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note D#, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 2
	note C#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 3
	note C#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 4
	note C#, 1
	loopchannel 0, Music_Route103_Ch1_loop

Music_Route103_Ch2:
	notetype $C, $A7
	dutycycle 1
	octave 3
	note __, 16
	note __, 15
	tone $0002
	notetype $6, $A1
Music_Route103_Ch2_loop:
	octave 3
	note C_, 1
	note C#, 1
	notetype $8, $A1
	note D#, 4
	note C_, 2
	note A#, 4
	intensity $A3
	note G#, 5
	intensity $A1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 4
	note D#, 2
	notetype $C, $A7
	note C#, 12
	notetype $8, $A1
	note C_, 4
	note C#, 2
	intensity $A5
	note D#, 16
	intensity $A1
	octave 4
	note C_, 1
	note C#, 1
	note D#, 4
	note C_, 1
	note C#, 1
	intensity $A5
	note D#, 14
	intensity $A1
	octave 3
	note F#, 2
	note F#, 2
	note F#, 2
	note C#, 2
	note G_, 2
	note D#, 4
	note C_, 2
	octave 4
	note D#, 4
	intensity $A3
	note C#, 5
	intensity $A1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 4
	note G#, 2
	notetype $C, $A7
	note F#, 12
	notetype $8, $A1
	note F_, 4
	note F#, 2
	notetype $C, $A7
	note G#, 12
	notetype $8, $A1
	octave 4
	note C#, 4
	note D#, 2
	intensity $A3
	note E_, 8
	intensity $A1
	note F#, 2
	note E_, 2
	intensity $A3
	note D#, 6
	octave 5
	note D#, 6
	intensity $A7
	dutycycle 2
	vibrato $00, $34
	note C_, 4
	note C#, 2
	note D#, 4
	note C#, 6
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	notetype $C, $A7
	note A#, 16
	notetype $8, $A7
	note G_, 4
	note G#, 2
	note A#, 4
	octave 5
	note D#, 6
	note C#, 2
	note C_, 2
	note C#, 2
	octave 4
	note G_, 2
	note A#, 4
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 6
	note A#, 6
	octave 5
	note C_, 6
	octave 4
	note G#, 12
	note F_, 4
	note G_, 6
	note G#, 2
	note G#, 6
	note G_, 4
	note F_, 2
	note F_, 4
	note G#, 4
	note G_, 4
	note F_, 10
	note D#, 8
	note C_, 5
	note B_, 1
	notetype $C, $A7
	octave 5
	note C_, 16
	notetype $8, $A1
	dutycycle 1
	vibrato $00, $00
	note C_, 4
	octave 4
	note A#, 2
	note G#, 4
	intensity $A3
	note G#, 6
	intensity $A1
	note G_, 2
	intensity $A3
	note F_, 6
	intensity $A1
	note G_, 4
	note G#, 2
	note A#, 4
	intensity $A3
	note A#, 6
	intensity $A1
	note G#, 2
	intensity $A3
	note G_, 6
	notetype $C, $A7
	note A_, 12
	note G_, 4
	note F_, 8
	notetype $8, $A1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	loopchannel 0, Music_Route103_Ch2_loop

Music_Route103_Ch3:
	notetype $C, $14
	octave 2
	note __, 16
	note __, 12
	note D#, 4
Music_Route103_Ch3_loop:
	notetype $8, $14
	note G#, 2
	note __, 10
	note D#, 2
	note __, 10
	note F#, 2
	note __, 10
	note C#, 2
	note __, 8
	note D#, 1
	note D#, 1
	note G#, 2
	note __, 10
	note D#, 2
	note __, 10
	note F#, 2
	note __, 4
	note C#, 2
	note __, 6
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 2
	note __, 10
	note D#, 2
	note __, 10
	note F#, 2
	note __, 10
	note C#, 2
	note __, 10
	note F_, 2
	note __, 10
	note C#, 12
	note F#, 2
	note __, 4
	note C#, 2
	note __, 4
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note G_, 6
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C#, 2
	note __, 8
	octave 3
	note C_, 2
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 7
	note D#, 2
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 2
	note __, 8
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	note __, 2
	note F_, 1
	note __, 5
	note E_, 2
	note D#, 2
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 2
	note __, 2
	note C#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C#, 2
	note __, 8
	octave 3
	note C_, 2
	octave 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 7
	note D#, 2
	note __, 2
	note D#, 1
	note __, 5
	note A#, 2
	note C_, 2
	note __, 2
	note C_, 1
	note __, 1
	octave 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note C_, 2
	note __, 8
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	note __, 2
	note F_, 1
	note __, 5
	note E_, 2
	note D#, 2
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note D_, 2
	note __, 2
	note D_, 1
	note __, 1
	note C#, 4
	notetype $A, $14
	note __, 16
	notetype $8, $14
	note D#, 4
	notetype $A, $14
	note __, 16
	notetype $C, $14
	note F_, 12
	note __, 16
	note D#, 4
	notetype $8, $14
	note __, 1
	loopchannel 0, Music_Route103_Ch3_loop

Music_Route103_Ch4:
	togglenoise 0
	notetype $8
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
Music_Route103_Ch4_loop:
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 13
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 4
	note G_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 4
	note G_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 4
	note D_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note D_, 2
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 3
	note C#, 3
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 3
	note C#, 3
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	loopchannel 0, Music_Route103_Ch4_loop
