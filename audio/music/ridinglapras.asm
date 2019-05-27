Music_RidingLapras:
	musicheader 4, 1, Music_RidingLapras_Ch1
	musicheader 1, 2, Music_RidingLapras_Ch2
	musicheader 1, 3, Music_RidingLapras_Ch3
	musicheader 1, 4, Music_RidingLapras_Ch4


Music_RidingLapras_Ch1:
	vibrato $12, $15
	tone $0001
	tempo 200
	notetype $c, $92
	note __, 12
Music_RidingLapras_Ch1_loop:
	sound_duty %11, %11, %11, %11
	octave 3
	intensity $92
	note __, 3
	note G_, 2
	note G_, 4
	note G_, 6
	note G#, 2
	note G#, 4
	note G#, 6
	note G_, 2
	note G_, 4
	note G_, 3
	sound_duty %01, %10, %01, %10
	intensity $50
	note A#, 12
	octave 4
	note C_, 6
	note D_, 6
	note D#, 12
	intensity $57
	note D#, 12
	loopchannel 0, Music_RidingLapras_Ch1_loop

Music_RidingLapras_Ch2:
	dutycycle 0
	vibrato $12, $15
	tone $0001
	notetype $c, $a2
Music_RidingLapras_Ch2_loop_1:
	note __, 2
	octave 3
	note G_, 1
	intensity $a5
	note G_, 2
	intensity $a2
	note D#, 1
	note C_, 2
	note D#, 1
	intensity $a5
	note F_, 2
	intensity $a2
	note D#, 13
	loopchannel 2, Music_RidingLapras_Ch2_loop_1
	intensity $c2
	note __, 2
	note G_, 1
	note G_, 2
	note G_, 1
	note A#, 2
	note A#, 1
	octave 4
	note C_, 2
	note C_, 1
	octave 3
	note G_, 2
	note G_, 1
	note F_, 2
	note F_, 1
	note D#, 2
	note F_, 1
	note G_, 2
	note D#, 1
	intensity $c0
	note F_, 6
	intensity $c7
	note F_, 6
	loopchannel 0, Music_RidingLapras_Ch2

Music_RidingLapras_Ch3:
	notetype $c, $13
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note C_, 2
	octave 2
	note G#, 7
	octave 3
	note D#, 1
	note __, 2
	note F_, 3
	note D#, 1
	note __, 4
	note C_, 1
	note D#, 1
	note __, 1
	note D#, 1
	note C_, 2
	octave 2
	note G#, 5
	note __, 1
	note G#, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	octave 2
	note A#, 3
	octave 3
	note D#, 2
	note __, 1
	note D#, 2
	note __, 1
	octave 2
	note G_, 12
	octave 3
	note C_, 6
	octave 2
	note A#, 6
	note A_, 5
	octave 3
	note C_, 1
	note A_, 6
	loopchannel 0, Music_RidingLapras_Ch3

Music_RidingLapras_Ch4:
	togglenoise $1
	notetype $c
	note E_, 3
	note E_, 2
	note E_, 1
	note E_, 3
	note E_, 2
	note E_, 1
Music_RidingLapras_Ch4_loop:
	note F_, 3
	note E_, 2
	note E_, 1
	loopchannel 0, Music_RidingLapras_Ch4_loop