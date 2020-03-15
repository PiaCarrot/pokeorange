; Four Island, Sevii Islands (Fire Red, based off of Azalea Town from GSC)
; By Monstarules
; Free use

Music_FourIsland:
	musicheader 4, 1, Music_FourIsland_Ch1
	musicheader 1, 2, Music_FourIsland_Ch2
	musicheader 1, 3, Music_FourIsland_Ch3
	musicheader 1, 4, Music_FourIsland_Ch4

Music_FourIsland_Ch1:
	tempo $A0
	volume $77
	stereopanning $77
	notetype $C, $A2
	octave 3
	callchannel Music_FourIsland_Ch1_Branch1
	callchannel Music_FourIsland_Ch1_Branch1
	intensity $A1
	note A_, 2
Music_FourIsland_Ch1_loop:
	intensity $A2
	octave 4
	callchannel Music_FourIsland_Ch1_Branch2
	callchannel Music_FourIsland_Ch1_Branch4
	note A_, 2
	intensity $91
	note A_, 2
	intensity $61
	note A_, 2
	intensity $A2
	note E_, 2
	intensity $91
	note E_, 2
	intensity $61
	note E_, 2
	intensity $A2
	note F_, 2
	intensity $91
	note F_, 2
	callchannel Music_FourIsland_Ch1_Branch3
	callchannel Music_FourIsland_Ch1_Branch5
	callchannel Music_FourIsland_Ch1_Branch2
	callchannel Music_FourIsland_Ch1_Branch6
	note F#, 2
	note __, 2
	vibrato $04, $24
	note G#, 8
	intensity $C1
	vibrato $00, $00
	note A_, 2
	intensity $A2
	octave 4
	callchannel Music_FourIsland_Ch1_Branch2
	callchannel Music_FourIsland_Ch1_Branch4
	note G_, 2
	intensity $91
	note G_, 2
	intensity $A2
	note F#, 2
	note G#, 2
	intensity $91
	note G#, 2
	intensity $61
	note G#, 2
	intensity $A2
	note E_, 2
	intensity $91
	note E_, 2
	callchannel Music_FourIsland_Ch1_Branch3
	callchannel Music_FourIsland_Ch1_Branch5
	callchannel Music_FourIsland_Ch1_Branch2
	callchannel Music_FourIsland_Ch1_Branch6
	note E_, 2
	note __, 2
	vibrato $04, $24
	note G#, 8
	note __, 2
	dutycycle 2
	callchannel Music_FourIsland_Ch1_Branch7
	dutycycle 1
	intensity $97
	vibrato $04, $24
	octave 3
	note G#, 6
	note E_, 10
	callchannel Music_FourIsland_Ch1_Branch7
	intensity $97
	octave 3
	note B_, 6
	note F#, 8
	intensity $85
	vibrato $00, $00
	octave 4
	note F#, 2
	callchannel Music_FourIsland_Ch1_Branch8
	note A_, 2
	callchannel Music_FourIsland_Ch1_Branch8
	note E_, 2
	intensity $A0
	octave 3
	note G#, 4
	intensity $A7
	vibrato $00, $24
	note G#, 8
	note G#, 4
	intensity $A0
	note E_, 6
	intensity $A7
	note E_, 8
	dutycycle 0
	intensity $A1
	note A_, 2
	vibrato $00, $00
	loopchannel 0, Music_FourIsland_Ch1_loop
Music_FourIsland_Ch1_Branch1:
	note __, 2
	note C#, 4
	note __, 2
	note C#, 4
	note C#, 4
	endchannel
Music_FourIsland_Ch1_Branch2:
	note C#, 2
	intensity $91
	note C#, 2
	intensity $61
	note C#, 2
	intensity $A2
	octave 3
	note B_, 2
	intensity $91
	note B_, 2
	intensity $61
	note B_, 2
	intensity $A2
	endchannel
Music_FourIsland_Ch1_Branch3:
	intensity $D2
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note F#, 2
	intensity $D5
	octave 3
	note F#, 4
	intensity $D2
	note A_, 2
	octave 4
	note F_, 2
	intensity $C5
	octave 3
	note F_, 4
	intensity $C2
	note A_, 2
	octave 4
	note E_, 2
	intensity $C5
	endchannel
Music_FourIsland_Ch1_Branch4:
	octave 4
	note C#, 2
	intensity $91
	note C#, 2
	intensity $A2
	endchannel
Music_FourIsland_Ch1_Branch5:
	vibrato $04, $24
	octave 3
	note E_, 8
	note __, 2
	intensity $A2
	vibrato $00, $00
	note B_, 2
	intensity $91
	note B_, 2
	intensity $61
	note B_, 2
	intensity $A2
	octave 4
	note D_, 2
	intensity $91
	note D_, 2
	intensity $61
	note D_, 2
	intensity $31
	note D_, 2
	note __, 2
	intensity $A2
	endchannel
Music_FourIsland_Ch1_Branch6:
	note A_, 2
	intensity $91
	note A_, 2
	intensity $A2
	note G#, 2
	intensity $91
	note G#, 2
	intensity $61
	note G#, 2
	intensity $A2
	note F#, 2
	intensity $91
	note F#, 2
	intensity $61
	note F#, 2
	intensity $A2
	note G#, 2
	intensity $91
	note G#, 2
	intensity $C5
	note E_, 2
	endchannel
Music_FourIsland_Ch1_Branch7:
	intensity $A1
	vibrato $00, $00
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	endchannel
Music_FourIsland_Ch1_Branch8:
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note E_, 2
	note __, 2
	note A_, 2
	note __, 2
	endchannel

Music_FourIsland_Ch2:
	notetype $C, $C2
	note __, 2
	octave 3
	note B_, 2
	intensity $91
	note B_, 2
	intensity $61
	note B_, 2
	callchannel Music_FourIsland_Ch2_Branch1
	intensity $31
	note A_, 2
	intensity $11
	note A_, 2
	intensity $C2
	note G#, 2
	intensity $91
	note G#, 2
	intensity $61
	note G#, 2
	callchannel Music_FourIsland_Ch2_Branch1
	vibrato $04, $24
	notetype $B, $C7
	note E_, 4
	vibrato $00, $00
	notetype $1, $C0
	note F_, 1
	intensity $C2
	note F#, 1
	intensity $C0
	note G_, 1
	intensity $C2
	note G#, 1
Music_FourIsland_Ch2_loop:
	notetype $C, $C4
	callchannel Music_FourIsland_Ch2_Branch2
	note E_, 6
	intensity $C3
	note C#, 4
	octave 3
	note B_, 4
	callchannel Music_FourIsland_Ch2_Branch3
	vibrato $00, $24
	note B_, 8
	intensity $C1
	vibrato $00, $00
	note A_, 2
	intensity $C5
	note G#, 2
	intensity $C1
	note A_, 2
	note __, 2
	intensity $C7
	vibrato $04, $24
	note B_, 8
	dutycycle 0
	intensity $C5
	vibrato $00, $00
	note E_, 1
	note F#, 1
	intensity $C4
	callchannel Music_FourIsland_Ch2_Branch2
	note E_, 4
	intensity $C3
	note C#, 2
	note F_, 4
	note C#, 2
	octave 3
	note B_, 2
	callchannel Music_FourIsland_Ch2_Branch3
	note B_, 8
	intensity $C1
	note A_, 2
	intensity $D5
	note G#, 2
	intensity $D2
	note E_, 2
	note __, 2
	intensity $D7
	vibrato $04, $24
	octave 4
	note E_, 6
	intensity $C7
	vibrato $00, $00
	note D_, 2
	note C#, 2
	dutycycle 1
	octave 3
	callchannel Music_FourIsland_Ch2_Branch4
	note D_, 2
	note __, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	intensity $C7
	vibrato $04, $24
	note A_, 10
	vibrato $00, $00
	callchannel Music_FourIsland_Ch2_Branch4
	note F_, 2
	note __, 2
	intensity $C4
	note G#, 2
	notetype $2, $C4
	note G_, 1
	note G#, 11
	note A_, 12
	intensity $C2
	note G#, 12
	note C#, 12
	note __, 12
	octave 3
	note B_, 12
	note __, 12
	dutycycle 2
	callchannel Music_FourIsland_Ch2_Branch5
	octave 3
	note B_, 12
	note __, 12
	dutycycle 1
	callchannel Music_FourIsland_Ch2_Branch5
	dutycycle 0
	note F#, 12
	note __, 12
	note G#, 12
	notetype $C, $C0
	note E_, 4
	intensity $C7
	vibrato $00, $24
	note E_, 8
	octave 3
	note B_, 4
	intensity $C0
	note G#, 6
	intensity $C7
	note G#, 8
	intensity $C2
	vibrato $00, $00
	note E_, 1
	note F#, 1
	loopchannel 0, Music_FourIsland_Ch2_loop
Music_FourIsland_Ch2_Branch1:
	intensity $C2
	note A_, 2
	intensity $91
	note A_, 2
	intensity $61
	note A_, 2
	endchannel
Music_FourIsland_Ch2_Branch2:
	note A_, 2
	intensity $C2
	note E_, 2
	note G#, 2
	intensity $C5
	vibrato $04, $24
	note A_, 4
	note B_, 4
	octave 4
	notetype $B, $C5
	note C#, 2
	notetype $1, $C2
	note D_, 1
	intensity $C0
	vibrato $00, $00
	note D#, 1
	vibrato $04, $24
	notetype $C, $C5
	endchannel
Music_FourIsland_Ch2_Branch3:
	intensity $C2
	octave 4
	note C#, 2
	intensity $C0
	octave 3
	note A_, 12
	intensity $C7
	note A_, 16
	dutycycle 2
	intensity $C1
	vibrato $00, $00
	note F#, 2
	note A_, 2
	intensity $C7
	octave 4
	note D_, 10
	notetype $2, $C0
	note C#, 1
	note D_, 11
	note C#, 12
	octave 3
	note B_, 12
	notetype $C, $C5
	note A_, 6
	intensity $C1
	note G#, 2
	note __, 2
	intensity $C4
	note G#, 4
	note A_, 2
	intensity $C0
	note B_, 6
	intensity $C7
	endchannel
Music_FourIsland_Ch2_Branch4:
	intensity $C2
	note B_, 2
	note A_, 2
	note G#, 2
	octave 4
	note E_, 2
	note __, 2
	endchannel
Music_FourIsland_Ch2_Branch5:
	note A_, 12
	octave 4
	note C#, 12
	octave 3
	note B_, 12
	note A_, 12
	octave 4
	note C#, 12
	note __, 12
	endchannel

Music_FourIsland_Ch3:
	dutycycle 6
	octave 2
	notetype $C, $16
	note E_, 1
	note F#, 1
	note A_, 2
	callchannel Music_FourIsland_Ch3_Branch1
	note __, 2
	intensity $16
	note A_, 2
	callchannel Music_FourIsland_Ch3_Branch1
	intensity $16
	note D_, 2
Music_FourIsland_Ch3_loop:
	callchannel Music_FourIsland_Ch3_Branch2
	callchannel Music_FourIsland_Ch3_Branch4
	note F#, 2
	note A_, 2
	intensity $36
	note A_, 2
	intensity $16
	callchannel Music_FourIsland_Ch3_Branch3
	note C#, 2
	note C_, 2
	note __, 2
	octave 2
	note B_, 3
	intensity $26
	vibrato $00, $24
	note B_, 4
	intensity $36
	note B_, 3
	intensity $16
	vibrato $00, $00
	callchannel Music_FourIsland_Ch3_Branch2
	callchannel Music_FourIsland_Ch3_Branch5
	octave 2
	note F#, 2
	octave 3
	callchannel Music_FourIsland_Ch3_Branch4
	callchannel Music_FourIsland_Ch3_Branch3
	note B_, 2
	note G#, 2
	note __, 2
	note B_, 3
	intensity $26
	vibrato $00, $24
	note B_, 4
	intensity $36
	note B_, 3
	intensity $16
	vibrato $00, $00
	note E_, 4
	intensity $26
	callchannel Music_FourIsland_Ch3_Branch5
	callchannel Music_FourIsland_Ch3_Branch6
	note G#, 4
	intensity $26
	note G#, 2
	intensity $16
	note C#, 4
	intensity $26
	note C#, 2
	intensity $36
	note C#, 2
	note __, 2
	intensity $16
	note E_, 4
	intensity $26
	callchannel Music_FourIsland_Ch3_Branch5
	callchannel Music_FourIsland_Ch3_Branch6
	note C#, 4
	intensity $26
	note C#, 2
	intensity $16
	note D#, 4
	intensity $26
	note D#, 2
	intensity $36
	note D#, 2
	intensity $16
	note F#, 2
	note A_, 2
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note __, 2
	note A_, 2
	note __, 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note __, 2
	note F#, 2
	note __, 2
	note G#, 2
	note E_, 10
	intensity $36
	note E_, 2
	intensity $16
	callchannel Music_FourIsland_Ch3_Branch5
	note E_, 12
	intensity $36
	note E_, 2
	intensity $16
	octave 2
	note D_, 2
	loopchannel 0, Music_FourIsland_Ch3_loop
Music_FourIsland_Ch3_Branch1:
	intensity $36
	note A_, 2
	note __, 2
	intensity $16
	note A_, 2
	intensity $36
	note A_, 2
	intensity $16
	note A_, 2
	intensity $36
	note A_, 2
	endchannel
Music_FourIsland_Ch3_Branch2:
	note A_, 2
	intensity $36
	note A_, 2
	intensity $16
	note E_, 2
	note A_, 2
	intensity $36
	note A_, 2
	intensity $16
	note E_, 2
	intensity $36
	note E_, 2
	intensity $16
	note G#, 2
	octave 3
	endchannel
Music_FourIsland_Ch3_Branch3:
	note G#, 2
	intensity $36
	note G#, 2
	intensity $16
	note E_, 2
	octave 3
	note D_, 2
	intensity $36
	note D_, 2
	intensity $16
	octave 2
	note D_, 2
	note A_, 2
	intensity $36
	note A_, 2
	note __, 6
	intensity $16
	note G#, 2
	intensity $36
	note G#, 2
	note __, 2
	intensity $16
	note A_, 2
	intensity $36
	note A_, 2
	note __, 6
	intensity $16
	octave 3
	note D_, 2
	intensity $36
	note D_, 2
	note __, 2
	intensity $16
	octave 2
	note A_, 2
	intensity $36
	note A_, 2
	intensity $16
	note G#, 2
	octave 3
	note C#, 2
	intensity $36
	note C#, 2
	note __, 2
	intensity $16
	octave 2
	note F#, 2
	note A_, 2
	note G#, 2
	intensity $36
	note G#, 2
	intensity $16
	note E_, 2
	octave 3
	note C#, 2
	intensity $36
	note C#, 2
	intensity $16
	octave 2
	note B_, 2
	intensity $36
	note B_, 2
	note __, 2
	intensity $16
	note E_, 2
	intensity $36
	note E_, 2
	note __, 2
	intensity $16
	note B_, 2
	intensity $36
	note B_, 2
	intensity $16
	octave 3
	endchannel
Music_FourIsland_Ch3_Branch4:
	note C#, 2
	intensity $36
	note C#, 2
	intensity $16
	octave 2
	endchannel
Music_FourIsland_Ch3_Branch5:
	note E_, 2
	intensity $36
	note E_, 2
	intensity $16
	endchannel
Music_FourIsland_Ch3_Branch6:
	octave 2
	note B_, 4
	intensity $26
	note B_, 2
	intensity $36
	note B_, 2
	intensity $16
	octave 3
	endchannel

Music_FourIsland_Ch4:
	notetype $C
	note __, 2
	togglenoise 3
	note C_, 2
	note G_, 2
	note F#, 2
	note G#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note G#, 2
	note F#, 2
	note E_, 1
	note E_, 1
	note C_, 2
	note G_, 2
	note F#, 2
	note G#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note D_, 1
Music_FourIsland_Ch4_loop:
	note A#, 2
	note G_, 2
	note F#, 2
	note G#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note A#, 2
	note G#, 2
	note C#, 1
	note D_, 1
	loopchannel 0, Music_FourIsland_Ch4_loop