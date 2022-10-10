Music_Route110:
	musicheader 4, 1, Music_Route110_Ch1
	musicheader 1, 2, Music_Route110_Ch2
	musicheader 1, 3, Music_Route110_Ch3
	musicheader 1, 4, Music_Route110_Ch4
; demade by Monstarules
Music_Route110_Ch1:
	tempo $8F
	volume $77
	stereopanning $77
	notetype $C, $00
	note __, 2
Music_Route110_Ch1_loop:
	callchannel Music_Route110_Ch1_S1
	octave 3
	note C#, 1
	octave 5
	note D#, 2
	octave 3
	note C#, 1
	intensity $62
	octave 5
	note F_, 2
	octave 3
	note C#, 1
	dutycycle 0
	intensity $B2
	octave 1
	note C#, 2
	note __, 1
	note C#, 2
	note C#, 2
	callchannel Music_Route110_Ch1_S1
	note __, 1
	note D#, 1
	dutycycle 1
	intensity $95
	octave 3
	note F_, 1
	note F#, 1
	note G#, 4
	note F_, 4
	note G#, 2
	callchannel Music_Route110_Ch1_S2
	intensity $A1
	note C#, 1
	note C#, 1
	note C#, 1
	note __, 1
	note G#, 1
	note __, 1
	intensity $A0
	note C#, 1
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note F_, 1
	note G#, 1
	dutycycle 0
	octave 4
	note C#, 1
	note G#, 1
	note F_, 1
	dutycycle 1
	note C#, 1
	octave 3
	note G#, 1
	intensity $D2
	vibrato $08, $00
	note B_, 2
	note __, 1
	octave 4
	note C#, 1
	intensity $D5
	vibrato $08, $42
	note D#, 4
	note __, 2
	dutycycle 0
	intensity $B2
	vibrato $00, $00
	octave 3
	note D#, 2
	note F_, 2
	note F#, 2
	dutycycle 1
	note C#, 1
	note C#, 1
	note C#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note F#, 1
	intensity $B4
	note B_, 2
	note __, 1
	note A#, 1
	intensity $B5
	vibrato $08, $42
	note G#, 4
	callchannel Music_Route110_Ch1_S2
	intensity $B5
	vibrato $08, $42
	octave 2
	note G#, 6
	vibrato $00, $00
	note G_, 1
	note F#, 1
	vibrato $08, $42
	note F_, 4
	note G#, 4
	vibrato $00, $00
	octave 3
	note D#, 2
	note __, 1
	intensity $B1
	note C#, 1
	intensity $B5
	vibrato $08, $42
	octave 2
	note B_, 4
	vibrato $00, $00
	octave 3
	note F#, 2
	note __, 1
	intensity $B1
	note F_, 1
	intensity $B5
	vibrato $08, $42
	note D#, 4
	vibrato $00, $00
	note C#, 1
	note C#, 1
	note C#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 2
	note G#, 2
	note A#, 2
	note B_, 2
	callchannel Music_Route110_Ch1_S3
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	octave 3
	note G#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note F#, 1
	note G#, 1
	intensity $D5
	vibrato $08, $24
	note C#, 8
	vibrato $00, $00
	callchannel Music_Route110_Ch1_S3
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	note D#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note C#, 1
	note D#, 1
	intensity $D5
	vibrato $08, $24
	octave 3
	note B_, 8
	note D_, 2
	note __, 1
	intensity $D2
	note E_, 1
	intensity $D5
	vibrato $08, $42
	note F#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	note A#, 6
	note A_, 1
	note G#, 1
	intensity $D7
	note F#, 8
	intensity $D5
	note F_, 2
	note __, 1
	intensity $D2
	note G_, 1
	intensity $D0
	vibrato $18, $23
	note G#, 6
	intensity $D5
	vibrato $00, $23
	note G#, 6
	note A#, 2
	note __, 1
	intensity $D2
	octave 4
	note C_, 1
	intensity $D0
	vibrato $18, $23
	note C#, 12
	loopchannel 0, Music_Route110_Ch1_loop
Music_Route110_Ch1_S1:
	dutycycle 1
	octave 3
	intensity $D5
	note C#, 4
	note __, 1
	intensity $D0
	octave 2
	note F#, 1
	octave 3
	note C#, 1
	note F#, 1
	intensity $D5
	vibrato $08, $42
	octave 4
	note C#, 4
	vibrato $00, $00
	note C#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	dutycycle 2
	intensity $62
	octave 5
	note C#, 2
	dutycycle 1
	endchannel
Music_Route110_Ch1_S2:
	vibrato $00, $00
	intensity $D5
	octave 4
	note F#, 2
	note __, 1
	intensity $D1
	note C#, 1
	intensity $D5
	vibrato $08, $42
	note C#, 4
	note __, 2
	intensity $B2
	vibrato $00, $00
	octave 3
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	endchannel
Music_Route110_Ch1_S3:
	intensity $D5
	note A#, 2
	note __, 1
	intensity $D2
	note B_, 1
	intensity $D5
	vibrato $08, $42
	octave 4
	note C#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	endchannel

Music_Route110_Ch2:
	notetype $C, $00
	note __, 2
Music_Route110_Ch2_loop:
	dutycycle 1
	callchannel Music_Route110_Ch2_S1
	octave 3
	callchannel Music_Route110_Ch2_S2
	callchannel Music_Route110_Ch2_S1
	callchannel Music_Route110_Ch2_S2
	callchannel Music_Route110_Ch2_S3
	note C#, 8
	intensity $D2
	vibrato $08, $00
	note D#, 2
	note __, 1
	note F_, 1
	intensity $D5
	vibrato $08, $42
	note F#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	note A#, 4
	note __, 2
	note B_, 1
	note A#, 1
	note G#, 8
	vibrato $00, $00
	callchannel Music_Route110_Ch2_S3
	note C#, 4
	note G#, 4
	vibrato $08, $00
	note F#, 2
	note __, 1
	intensity $D2
	note F_, 1
	intensity $D5
	vibrato $08, $42
	note D#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	note F_, 4
	note __, 2
	intensity $D2
	note F_, 1
	note F#, 1
	intensity $D5
	note G#, 8
	note __, 1
	intensity $61
	vibrato $00, $00
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note F#, 1
	dutycycle 3
	note A#, 1
	octave 5
	note C#, 1
	note F_, 1
	note C#, 1
	note F#, 1
	note F_, 1
	note C#, 1
	octave 4
	note A#, 1
	dutycycle 1
	note F#, 1
	note C#, 1
	octave 3
	note A#, 1
	note G_, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F#, 1
	note G#, 1
	dutycycle 3
	octave 5
	note C#, 1
	note D#, 1
	note C#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 4
	note A#, 1
	dutycycle 1
	note G#, 1
	note F#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	dutycycle 3
	octave 5
	note C#, 1
	octave 4
	note A#, 1
	octave 5
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	dutycycle 1
	note F#, 1
	note D#, 1
	octave 3
	note B_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	octave 4
	note D#, 1
	note F#, 1
	dutycycle 3
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note D#, 1
	note C#, 1
	octave 4
	note B_, 1
	dutycycle 1
	note F#, 1
	note D#, 1
	octave 3
	note B_, 1
	note G_, 1
	note F#, 1
	intensity $B5
	note B_, 2
	note __, 1
	octave 4
	note C#, 1
	vibrato $08, $42
	note D_, 4
	note __, 2
	intensity $B2
	vibrato $00, $00
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	intensity $B5
	vibrato $08, $42
	note C#, 6
	note C_, 1
	octave 3
	note B_, 1
	intensity $B7
	note A#, 8
	intensity $B5
	note G#, 2
	note __, 1
	note A#, 1
	intensity $B0
	vibrato $18, $23
	note B_, 6
	intensity $B5
	vibrato $00, $23
	note B_, 6
	octave 4
	note C#, 2
	note __, 1
	note D#, 1
	intensity $B0
	vibrato $18, $23
	note F_, 12
	loopchannel 0, Music_Route110_Ch2_loop
Music_Route110_Ch2_S1:
	octave 3
	intensity $D5
	note F#, 4
	note __, 1
	intensity $D0
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	octave 4
	note C#, 1
	intensity $D5
	vibrato $08, $42
	note F#, 4
	vibrato $00, $00
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	intensity $D0
	endchannel
Music_Route110_Ch2_S2:
	note G#, 8
	intensity $B5
	vibrato $00, $22
	note G#, 8
	vibrato $00, $00
	endchannel
Music_Route110_Ch2_S3:
	intensity $D5
	note A#, 2
	note __, 1
	intensity $D1
	note F#, 1
	intensity $D5
	vibrato $08, $42
	note F#, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $D5
	vibrato $08, $42
	note F_, 4
	note __, 2
	intensity $D2
	vibrato $00, $00
	note D#, 1
	note F_, 1
	intensity $D5
	vibrato $08, $42
	endchannel

Music_Route110_Ch3:
	notetype $C, $00
	note __, 2
Music_Route110_Ch3_Loop:
	dutycycle 6
	octave 2
	intensity $16
	callchannel Music_Route110_Ch3_S1
	callchannel Music_Route110_Ch3_S1
	callchannel Music_Route110_Ch3_S2
	note A#, 8
	note G#, 8
	octave 3
	callchannel Music_Route110_Ch3_S2
	octave 3
	note C#, 8
	intensity $26
	note C#, 4
	intensity $36
	note C#, 3
	note __, 1
	intensity $16
	note F#, 4
	note C#, 2
	note F#, 2
	note __, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note F_, 4
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note F_, 2
	note __, 1
	note F_, 2
	note __, 1
	note F_, 2
	note E_, 4
	octave 2
	note G#, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	octave 2
	note G#, 2
	octave 3
	note E_, 2
	note D#, 2
	note __, 2
	octave 2
	note F#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note F#, 2
	note __, 4
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	octave 4
	note C#, 8
	octave 3
	note F#, 8
	octave 2
	note G#, 2
	note __, 1
	note G#, 1
	note D#, 2
	note G#, 2
	note __, 2
	note G#, 2
	note __, 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 1
	note C#, 1
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note __, 2
	note C#, 2
	note __, 2
	note C#, 2
	loopchannel 0, Music_Route110_Ch3_Loop
Music_Route110_Ch3_S1:
	note F#, 4
	note __, 1
	note F#, 2
	note __, 3
	note F#, 2
	note __, 2
	note F#, 2
	note C#, 14
	note __, 2
	endchannel
Music_Route110_Ch3_S2:
	note F#, 8
	note C#, 2
	note F#, 2
	note __, 2
	note F#, 2
	note C#, 14
	note __, 2
	octave 2
	note B_, 8
	note F#, 2
	note B_, 2
	note __, 2
	note B_, 2
	endchannel

Music_Route110_Ch4:
	togglenoise 3
	notetype $C
	note D_, 2
Music_Route110_Ch4_loop:
	callchannel Music_Route110_Ch4_S1
	note C_, 1
	note __, 1
	callchannel Music_Route110_Ch4_S1
	note C#, 1
	notetype $6
	note C#, 1
	note C#, 1
	callchannel Music_Route110_Ch4_S2
	note C#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	callchannel Music_Route110_Ch4_S2
	note D_, 2
	note __, 10
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note B_, 4
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note B_, 4
	notetype $C
	note __, 12
	note C_, 2
	note B_, 2
	note __, 14
	note C_, 2
	note __, 4
	note C_, 1
	note C#, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note B_, 2
	note __, 4
	note C_, 1
	note C#, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	notetype $6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $C
	loopchannel 0, Music_Route110_Ch4_loop
Music_Route110_Ch4_S1:
	note B_, 2
	note __, 1
	note C_, 1
	note D_, 2
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note D_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 2
	note C_, 1
	note D_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note __, 1
	note D_, 2
	endchannel
Music_Route110_Ch4_S2:
	note B_, 4
	note __, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note __, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 4
	note C_, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C_, 4
	note __, 2
	note C_, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note __, 2
	note D_, 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 4
	note C_, 2
	note D_, 4
	note C_, 2
	note __, 2
	endchannel