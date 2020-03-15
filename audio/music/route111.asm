Music_Route111:
	musicheader 4, 1, Music_Route111_Ch1
	musicheader 1, 2, Music_Route111_Ch2
	musicheader 1, 3, Music_Route111_Ch3
	musicheader 1, 4, Music_Route111_Ch4

Music_Route111_Ch1:
	tempo $A0
	volume $77
	stereopanning $77
	dutycycle 2
	octave 2
	notetype $C, $C1
	note F_, 1
	note A_, 1
	note B_, 1
	octave 3
	note D_, 1
	intensity $7C
	note F_, 2
	intensity $C4
	vibrato $00, $32
	note F_, 6
	intensity $C3
	note D_, 4
	dutycycle 1
	intensity $C2
	octave 2
	note E_, 4
	notetype $6, $C2
	callchannel Music_Route111_Ch1_Branch1
	callchannel Music_Route111_Ch1_Branch2
Music_Route111_Ch1_loop:
	note G_, 4
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	note E_, 4
	note E_, 4
	callchannel Music_Route111_Ch1_Branch1
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	note E_, 4
	note E_, 4
	callchannel Music_Route111_Ch1_Branch1
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	note E_, 4
	note E_, 4
	callchannel Music_Route111_Ch1_Branch1
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	note E_, 4
	note E_, 4
	callchannel Music_Route111_Ch1_Branch1
	callchannel Music_Route111_Ch1_Branch3
	callchannel Music_Route111_Ch1_Branch4
	note E_, 8
	note F_, 1
	note E_, 3
	note D#, 2
	intensity $C1
	note E_, 2
	note E_, 4
	intensity $C2
	note D_, 8
	note E_, 4
	note C#, 8
	note E_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note C#, 4
	octave 1
	note B_, 8
	octave 2
	note C#, 4
	callchannel Music_Route111_Ch1_Branch3
	callchannel Music_Route111_Ch1_Branch4
	note A_, 8
	note A#, 1
	note A_, 3
	note G#, 2
	intensity $C1
	note A_, 2
	note A_, 4
	intensity $C2
	note B_, 8
	octave 3
	note C_, 4
	octave 2
	note B_, 8
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note A#, 2
	intensity $C1
	note B_, 2
	note B_, 4
	intensity $C2
	octave 3
	note E_, 8
	note D_, 4
	octave 2
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	note E_, 4
	note E_, 4
	callchannel Music_Route111_Ch1_Branch1
	note E_, 8
	callchannel Music_Route111_Ch1_Branch1
	callchannel Music_Route111_Ch1_Branch2
	loopchannel 0, Music_Route111_Ch1_loop
Music_Route111_Ch1_Branch1:
	note F_, 1
	note E_, 3
	note D#, 2
	note E_, 2
	note G_, 4
	note F_, 8
	note G_, 4
	endchannel
Music_Route111_Ch1_Branch2:
	note E_, 4
	note E_, 4
	note F_, 1
	note E_, 3
	note D#, 2
	note E_, 2
	note G_, 4
	note F_, 8
	endchannel
Music_Route111_Ch1_Branch3:
	note F#, 8
	note G_, 1
	note F#, 3
	note F_, 2
	intensity $C1
	note F#, 2
	note F#, 4
	intensity $C2
	note G#, 8
	note A_, 4
	note G#, 8
	note A_, 1
	note G#, 3
	note G_, 2
	endchannel
Music_Route111_Ch1_Branch4:
	intensity $C1
	note G#, 2
	note G#, 4
	intensity $C2
	note A_, 8
	note B_, 4
	endchannel

Music_Route111_Ch2:
	octave 3
	notetype $C, $C7
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	intensity $7C
	octave 4
	note F_, 2
	intensity $C4
	vibrato $00, $32
	note F_, 6
	intensity $C3
	note D_, 4
	note __, 16
	note __, 12
Music_Route111_Ch2_loop:
	dutycycle 2
	vibrato $00, $00
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	vibrato $02, $32
	note E_, 4
	note __, 2
	vibrato $00, $00
	octave 3
	callchannel Music_Route111_Ch2_Branch1
	callchannel Music_Route111_Ch2_Branch2
	octave 3
	note A_, 2
	note B_, 4
	octave 4
	note C#, 4
	note D_, 6
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C#, 2
	intensity $7C
	note E_, 4
	intensity $C0
	note E_, 14
	intensity $C4
	vibrato $00, $32
	note E_, 12
	notetype $E, $C4
	note __, 12
	vibrato $00, $00
	slidepitchto 1, 4, F_
	notetype $6, $C0
	note E_, 1
	note F_, 1
	intensity $C4
	note F_, 2
	vibrato $02, $32
	note E_, 8
	intensity $C1
	octave 3
	note A_, 2
	note A_, 2
	vibrato $00, $00
	callchannel Music_Route111_Ch2_Branch1
	callchannel Music_Route111_Ch2_Branch2
	note F_, 4
	note G_, 2
	note A_, 6
	note E_, 2
	note A_, 2
	octave 5
	note D_, 4
	intensity $70
	slidepitchto 1, 3, C#
	note C_, 1
	note C#, 1
	intensity $7D
	note C#, 4
	intensity $C0
	note C#, 14
	intensity $C4
	vibrato $00, $32
	note C#, 12
	notetype $C, $C4
	note __, 16
	intensity $C5
	vibrato $06, $32
	octave 4
	note F#, 8
	note __, 2
	intensity $C2
	vibrato $00, $00
	note F#, 1
	note G#, 1
	note __, 1
	note A_, 1
	intensity $C1
	note F#, 2
	intensity $C5
	vibrato $06, $32
	note G#, 8
	note __, 2
	intensity $C2
	vibrato $00, $00
	note G#, 1
	note A_, 1
	note __, 1
	note B_, 1
	intensity $C1
	note G#, 2
	intensity $C5
	vibrato $06, $32
	note E_, 8
	note __, 2
	intensity $C2
	vibrato $00, $00
	note E_, 1
	note F#, 1
	note __, 1
	note G#, 1
	intensity $C1
	note E_, 2
	note F#, 2
	notetype $6, $C3
	note E_, 1
	note F#, 1
	note E_, 2
	note D_, 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	intensity $C1
	octave 4
	note F#, 2
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	intensity $C5
	vibrato $06, $32
	octave 4
	note F#, 16
	note __, 4
	intensity $C2
	vibrato $00, $00
	note F#, 2
	note G#, 2
	note __, 2
	note A_, 2
	intensity $C1
	note F#, 4
	intensity $C5
	vibrato $06, $32
	note G#, 16
	note __, 4
	intensity $C2
	vibrato $00, $00
	note G#, 2
	note A_, 2
	note __, 2
	note B_, 2
	intensity $C1
	note G#, 4
	intensity $C5
	vibrato $06, $32
	note A_, 16
	note __, 4
	intensity $C2
	vibrato $00, $00
	note A_, 2
	note B_, 2
	note __, 2
	octave 5
	note C_, 2
	intensity $C1
	octave 4
	note A_, 4
	intensity $C5
	vibrato $06, $32
	note B_, 16
	intensity $C2
	vibrato $00, $00
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	intensity $C1
	note F_, 2
	note G_, 4
	intensity $C3
	note F_, 1
	note G_, 1
	note F_, 2
	intensity $7C
	note E_, 4
	notetype $C, $C0
	note E_, 12
	vibrato $00, $32
	note E_, 10
	intensity $C4
	note E_, 8
	note __, 16
	note __, 12
	intensity $C3
	octave 4
	loopchannel 0, Music_Route111_Ch2_loop
Music_Route111_Ch2_Branch1:
	notetype $8, $C0
	note A_, 1
	note G#, 1
	note A_, 1
	intensity $C3
	octave 4
	note G_, 3
	notetype $6, $C3
	note F#, 1
	endchannel
Music_Route111_Ch2_Branch2:
	note G_, 1
	note F_, 2
	note E_, 4
	note D_, 4
	note C#, 4
	note D_, 2
	note E_, 6
	endchannel

Music_Route111_Ch3:
	dutycycle 4
	octave 3
	notetype $C, $14
	note D_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 8
	note G#, 4
	octave 2
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
Music_Route111_Ch3_loop:
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch2
	note C#, 2
	note __, 1
	note C#, 1
	octave 2
	note C#, 2
	note __, 1
	note C#, 1
	note __, 1
	note A#, 1
	octave 3
	note C#, 1
	note E_, 1
	note __, 1
	note E_, 1
	note C#, 2
	note F#, 2
	note __, 1
	note F#, 1
	octave 2
	note F#, 2
	note __, 1
	note F#, 1
	octave 3
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	callchannel Music_Route111_Ch3_Branch2
	note F_, 2
	note __, 1
	note F_, 1
	octave 2
	note F_, 2
	note __, 1
	note F_, 1
	octave 3
	note F_, 2
	note __, 1
	note C_, 2
	note __, 1
	note F_, 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	callchannel Music_Route111_Ch3_Branch1
	loopchannel 0, Music_Route111_Ch3_loop
Music_Route111_Ch3_Branch1:
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note E_, 2
	note __, 2
	endchannel
Music_Route111_Ch3_Branch2:
	octave 3
	note D_, 2
	note __, 1
	note D_, 1
	octave 2
	note D_, 2
	note __, 1
	note D_, 1
	octave 3
	note D_, 2
	note __, 1
	octave 2
	note A_, 2
	note __, 1
	octave 3
	note D_, 2
	note E_, 2
	note __, 1
	note E_, 1
	octave 2
	note E_, 2
	note __, 1
	note E_, 1
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note E_, 2
	endchannel

Music_Route111_Ch4:
	notetype $C
	note __, 16
	togglenoise 3
Music_Route111_Ch4_loop:
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 1
	note D_, 1
	note D#, 1
	note C#, 1
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 1
	note D_, 1
	loopchannel 0, Music_Route111_Ch4_loop