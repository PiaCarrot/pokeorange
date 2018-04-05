Music_XdBattleSimTheme:
	musicheader 4, 1, Music_XdBattleSimTheme_Ch1
	musicheader 1, 2, Music_XdBattleSimTheme_Ch2
	musicheader 1, 3, Music_XdBattleSimTheme_Ch3
	musicheader 1, 4, Music_XdBattleSimTheme_Ch4


Music_XdBattleSimTheme_Ch1:
	vibrato $12, $15
	tone $0001
	tempo 128
	notetype $c, $b1
	note __, 16
	note __, 16
Music_XdBattleSimTheme_Ch1_loop_main:
	dutycycle $0
	note __, 16
	note __, 16
	note __, 16
	note __, 16
Music_XdBattleSimTheme_Ch1_loop_1:
	octave 4
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note E_, 2
	note E_, 2
	note E_, 1
	note E_, 3
	note E_, 1
	note E_, 1
	note E_, 1
	loopchannel 4, Music_XdBattleSimTheme_Ch1_loop_1
	dutycycle 1
	intensity $61
Music_XdBattleSimTheme_Ch1_loop_2:
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note E_, 1
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note E_, 1
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note E_, 1
	octave 5
	note D_, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	loopchannel 8, Music_XdBattleSimTheme_Ch1_loop_2
	octave 4
Music_XdBattleSimTheme_Ch1_loop_3:
	intensity $4f
	vibrato $0, $0
	note C_, 4
	vibrato $0, $42
	intensity $8f
	note C_, 4
	vibrato $0, $82
	intensity $bf
	note C_, 4
	vibrato $0, $b2
	intensity $f0
	note C_, 4
	loopchannel 8, Music_XdBattleSimTheme_Ch1_loop_3
	vibrato $0, $0
	intensity $b1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_XdBattleSimTheme_Ch1_loop_main
	
Music_XdBattleSimTheme_Ch2:
	dutycycle $2
	vibrato $12, $15
	tone $0001
	notetype $c, $82
	note __, 16
	note __, 16
	octave 1
Music_XdBattleSimTheme_Ch2_loop_main:
Music_XdBattleSimTheme_Ch2_loop_1:
	note E_, 2
	loopchannel 32, Music_XdBattleSimTheme_Ch2_loop_1
	dutycycle $0
	intensity $d1
Music_XdBattleSimTheme_Ch2_loop_2:
	octave 3
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 1
	note A_, 2
	note A_, 1
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 3
	note G#, 1
	note G#, 1
	note G#, 1
	loopchannel 4, Music_XdBattleSimTheme_Ch2_loop_2
	dutycycle 2
	intensity $81
Music_XdBattleSimTheme_Ch2_loop_3:
	octave 6
	note E_, 1
	octave 5
	note E_, 1
	note E_, 1
	octave 6
	note E_, 1
	octave 5
	note E_, 1
	note E_, 1
	octave 6
	note E_, 1
	octave 5
	note E_, 1
	note E_, 1
	octave 6
	note D_, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	loopchannel 8, Music_XdBattleSimTheme_Ch2_loop_3
	dutycycle 0
	octave 4
	callchannel Music_XdBattleSimTheme_Ch2_branch_1
	callchannel Music_XdBattleSimTheme_Ch2_branch_2
	callchannel Music_XdBattleSimTheme_Ch2_branch_3
	callchannel Music_XdBattleSimTheme_Ch2_branch_2
	callchannel Music_XdBattleSimTheme_Ch2_branch_1
	callchannel Music_XdBattleSimTheme_Ch2_branch_2
	callchannel Music_XdBattleSimTheme_Ch2_branch_3
	intensity $4f
	vibrato $0, $0
	note F#, 4
	vibrato $0, $42
	intensity $8f
	note F#, 4
	vibrato $0, $82
	intensity $bf
	note F#, 4
	vibrato $0, $b2
	intensity $f0
	note F#, 4
	dutycycle 2
	vibrato $0, $0
	intensity $82
	octave 1
Music_XdBattleSimTheme_Ch2_loop_4:
	note E_, 2
	loopchannel 32, Music_XdBattleSimTheme_Ch2_loop_4
	loopchannel 0, Music_XdBattleSimTheme_Ch2_loop_main
	
Music_XdBattleSimTheme_Ch2_branch_1:
	intensity $4f
	vibrato $0, $0
	note A_, 4
	vibrato $0, $42
	intensity $8f
	note A_, 4
	vibrato $0, $82
	intensity $bf
	note A_, 4
	vibrato $0, $b2
	intensity $f0
	note A_, 4
	endchannel
	
Music_XdBattleSimTheme_Ch2_branch_2:
	intensity $4f
	vibrato $0, $0
	note G#, 4
	vibrato $0, $42
	intensity $8f
	note G#, 4
	vibrato $0, $82
	intensity $bf
	note G#, 4
	vibrato $0, $b2
	intensity $f0
	note G#, 4
	endchannel
	
Music_XdBattleSimTheme_Ch2_branch_3:
	intensity $4f
	vibrato $0, $0
	note G_, 4
	vibrato $0, $42
	intensity $8f
	note G_, 4
	vibrato $0, $82
	intensity $bf
	note G_, 4
	vibrato $0, $b2
	intensity $f0
	note G_, 4
	endchannel
	
Music_XdBattleSimTheme_Ch3:
	notetype $6, $19
	note __, 16
	note __, 16
	note __, 16
	note __, 16
Music_XdBattleSimTheme_Ch3_loop_main:
	vibrato $0, $0
Music_XdBattleSimTheme_Ch3_loop_1:
	callchannel Music_XdBattleSimTheme_Ch3_branch_1
	loopchannel 4, Music_XdBattleSimTheme_Ch3_loop_1
	notetype $c, $19
Music_XdBattleSimTheme_Ch3_loop_2:
	callchannel Music_XdBattleSimTheme_Ch3_branch_2
	note G_, 1
	note __, 1
	note A_, 9
	octave 1
	note A_, 1
	note __, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 3
	callchannel Music_XdBattleSimTheme_Ch3_branch_2
	note B_, 1
	note __, 1
	note A_, 10
	note G_, 3
	note F#, 4
	loopchannel 2, Music_XdBattleSimTheme_Ch3_loop_2
	intensity $12
Music_XdBattleSimTheme_Ch3_loop_3:
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note D_, 2
	note E_, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 2
	loopchannel 4, Music_XdBattleSimTheme_Ch3_loop_3
	intensity $17
	vibrato $18, $53
	octave 3
	note A_, 6
	octave 4
	note E_, 14
	note A_, 4
	note E_, 4
	note D_, 4
	note E_, 12
	note C_, 4
	note D_, 6
	note E_, 9
	note __, 1
	note E_, 12
	note A_, 8
	note B_, 4
	octave 5
	note D_, 4
	note C_, 4
	octave 4
	note B_, 12
	note G_, 4
	note F#, 16
	notetype $6, $19
	vibrato $0, $0
Music_XdBattleSimTheme_Ch3_loop_4:
	callchannel Music_XdBattleSimTheme_Ch3_branch_1
	loopchannel 4, Music_XdBattleSimTheme_Ch3_loop_4
	loopchannel 0, Music_XdBattleSimTheme_Ch3_loop_main
	
Music_XdBattleSimTheme_Ch3_branch_1:
	octave 2
	note E_, 1
	note __, 1
	octave 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	octave 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note E_, 4
	octave 1
	note E_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note E_, 1
	note __, 1
	endchannel
	
Music_XdBattleSimTheme_Ch3_branch_2:
	octave 1
	note A_, 1
	note __, 1
	note A_, 1
	octave 2
	note A_, 1
	note __, 1
	octave 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	endchannel
	
Music_XdBattleSimTheme_Ch4:
	togglenoise $3
	notetype $c
Music_XdBattleSimTheme_Ch4_loop_1:
	note D#, 2
	note G#, 1
	note G#, 1
	loopchannel 8, Music_XdBattleSimTheme_Ch4_loop_1
Music_XdBattleSimTheme_Ch4_loop_2:
	note D#, 2
	note G#, 1
	note G#, 1
	note D_, 2
	note G#, 1
	note G#, 1
	loopchannel 7, Music_XdBattleSimTheme_Ch4_loop_2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note D#, 2
	note C_, 1
Music_XdBattleSimTheme_Ch4_loop_main:
Music_XdBattleSimTheme_Ch4_loop_3:
	note D#, 3
	note D#, 1
	note C_, 3
	note D#, 2
	note D#, 1
	note D#, 2
	note C_, 3
	note D#, 1
	loopchannel 7, Music_XdBattleSimTheme_Ch4_loop_3
	note D#, 3
	note D#, 1
	note C_, 3
	note D#, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note D#, 2
	note C_, 1
Music_XdBattleSimTheme_Ch4_loop_4:
	note A#, 2
	note G_, 2
	loopchannel 30, Music_XdBattleSimTheme_Ch4_loop_4
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note D#, 2
	note C_, 1
	loopchannel 0, Music_XdBattleSimTheme_Ch4_loop_main