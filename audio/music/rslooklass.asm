Music_RSLookLass:
	musicheader 4, 1, Music_RSLookLass_Ch1
	musicheader 1, 2, Music_RSLookLass_Ch2
	musicheader 1, 3, Music_RSLookLass_Ch3
	musicheader 1, 4, Music_RSLookLass_Ch4 


Music_RSLookLass_Ch1:
	dutycycle $3
	vibrato $12, $15
	tempo 208
	notetype $6, $82
	octave 3
	note D#, 2
	intensity $85
	octave 5
	note D#, 4
	intensity $50
	note D#, 10
	intensity $5f
	note D#, 8
	dutycycle $2
	intensity $80
	octave 2
	note D#, 2
	soundinput $6e
	note D#, 6
	soundinput $00
Music_RSLookLass_Ch1_loop_main:
	callchannel Music_RSLookLass_Ch1_branch_1
	intensity $a3
	octave 2
	note D#, 4
	octave 1
	note G#, 2
	note G_, 2
	callchannel Music_RSLookLass_Ch1_branch_1
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	octave 2
	note D#, 2
	note D_, 2
	intensity $a3
	octave 1
	note A#, 6
	note A#, 2
	intensity $97
	octave 2
	note F_, 6
	intensity $a3
	octave 1
	note A#, 2
	note A#, 2
	octave 2
	note F_, 2
	octave 1
	note A#, 4
	note A#, 2
	note G#, 2
	note A#, 2
	octave 2
	note C_, 2
	note D#, 6
	note D#, 2
	intensity $97
	note A#, 6
	intensity $a3
	note D#, 2
	note D#, 3
	note A#, 1
	octave 1
	note A#, 4
	octave 2
	note D#, 2
	octave 1
	note A#, 2
	octave 2
	note C_, 2
	note C#, 2
	loopchannel 0, Music_RSLookLass_Ch1_loop_main
	
Music_RSLookLass_Ch1_branch_1:
	intensity $a3
	octave 1
	note G#, 6
	note G#, 2
	intensity $97
	octave 2
	note D#, 6
	intensity $a3
	octave 1
	note G#, 2
	note G#, 2
	intensity $97
	octave 2
	note D#, 2
	octave 1
	note G#, 4
	endchannel
	
Music_RSLookLass_Ch2:
	dutycycle $2
	vibrato $12, $15
	notetype $6, $a2
	octave 4
	note D#, 2
	intensity $a7
	octave 5
	note D#, 6
	intensity $a2
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	octave 5
	note D#, 2
	octave 3
	note D#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 1
	note G#, 1
	note A#, 1
	octave 4
	note D#, 1
	dutycycle $0
	intensity $83
Music_RSLookLass_Ch2_loop_main:
	note __, 2
	octave 3
	note G#, 1
	note A_, 1
	note A#, 6
	note A#, 8
	note A#, 4
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	note G#, 2
	note A#, 2
	note G#, 4
	note A_, 1
	note G#, 1
	note G_, 6
	note G_, 8
	note G_, 4
	octave 4
	note D#, 2
	octave 3
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note __, 2
	note F#, 1
	note G_, 1
	note G#, 6
	note G#, 8
	note G#, 4
	note G#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note A_, 6
	octave 4
	note D#, 6
	note C#, 4
	note C_, 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note G#, 2
	note A_, 2
	loopchannel 0, Music_RSLookLass_Ch2_loop_main
	
Music_RSLookLass_Ch3:
	notetype $6, $26
	octave 3
	note D#, 2
	octave 5
	note D#, 14
	octave 4
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 1
	note G#, 1
	note A#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note G_, 1
	intensity $13
	vibrato $1b, $34
Music_RSLookLass_Ch3_loop_main:
	octave 5
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 12
	intensity $33
	note A#, 2
	intensity $13
	note A#, 2
	note __, 1
	octave 6
	note E_, 1
	note D#, 2
	octave 5
	note A#, 2
	note G#, 2
	note A_, 1
	note A#, 1
	note G#, 2
	note G_, 16
	intensity $33
	note G_, 2
	intensity $13
	note G_, 2
	note __, 1
	octave 6
	note E_, 1
	note D#, 2
	octave 5
	note G_, 2
	note F_, 2
	note F#, 1
	note G_, 1
	note F_, 2
	note __, 2
	note A#, 1
	octave 6
	note C_, 1
	note C#, 12
	intensity $33
	note C#, 2
	intensity $13
	note C#, 2
	intensity $33
	note C#, 2
	intensity $13
	note D#, 2
	note C#, 2
	intensity $33
	note C#, 2
	intensity $13
	octave 5
	note F_, 2
	note A#, 1
	note B_, 1
	octave 6
	note C_, 12
	note C#, 2
	note C_, 2
	octave 5
	note A#, 3
	octave 6
	note D_, 1
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note G_, 2
	note F_, 2
	note G_, 2
	loopchannel 0, Music_RSLookLass_Ch3_loop_main
	
Music_RSLookLass_Ch4:
	togglenoise $1
	notetype $6
	note __, 16
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 2
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
Music_RSLookLass_Ch4_loop_main:
	callchannel Music_RSLookLass_Ch4_branch_1
	note A#, 4
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	callchannel Music_RSLookLass_Ch4_branch_1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	loopchannel 0, Music_RSLookLass_Ch4_loop_main
	
Music_RSLookLass_Ch4_branch_1:
	note A#, 4
	note F_, 4
	note A#, 1
	note E_, 1
	note A#, 2
	note E_, 4
	note A#, 3
	note E_, 1
	note F_, 4
	endchannel