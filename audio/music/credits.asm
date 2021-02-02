Music_Credits: ; f5127
	dbw $c0, Music_Credits_Ch1
	dbw $01, Music_Credits_Ch2
	dbw $02, Music_Credits_Ch3
	dbw $03, Music_Credits_Ch4
; f5133

Music_Credits_Ch1: ; f5133
	tempo 125
	volume $77
	dutycycle $0
	tone $0001
	vibrato $8, $14
	stereopanning $f0
	notetype $c, $A7
	octave 2
	note __, 16
Music_Credits_branch_f4fb1:
	note __, 16
	octave 4
	note A_, 8
	note B_, 8
	note G#, 16
	note F#, 16
	note __, 16
	note A_, 8
	note B_, 8
	octave 5
	note C#, 16
	octave 4
	note B_, 16
	loopchannel 0, Music_Credits_branch_f4fb1
; f5153

Music_Credits_Ch2: ; f5153
	dutycycle $2
	vibrato $6, $35
	stereopanning $f
	notetype $c, $d2
	octave 3
	note F#, 2
	note F#, 4
	note A_, 4
	note F#, 2
	note A_, 2
	note B_, 2
	loopchannel 0, Music_Credits_branch_f502e
Music_Credits_branch_f502e: ; f502e
	intensity $d2
	octave 4
	note C#, 4
	note C#, 4
	octave 3
	note B_, 2
	note B_, 2
	intensity $92
	note G#, 2
	intensity $d2
	note A_, 4
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 4
	intensity $d3
	octave 4
	note C#, 6
	intensity $d2
	note C#, 4
	octave 3
	note B_, 2
	note B_, 2
	intensity $92
	note G#, 2 
	intensity $d2
	note A_, 4
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 4
	intensity $d3
	octave 4
	note D_, 6
	intensity $d2
	note D_, 4
	note C#, 2
	note C#, 2
	intensity $92
	octave 3
	note A_, 2 ;;;;;;;;;;;;;
	intensity $d2
	note B_, 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note B_, 4
	intensity $d3
	octave 4
	note D_, 6
	intensity $d2
	note D_, 4
	note C#, 2
	note C#, 2
	intensity $92
	octave 3
	note A_, 2
	intensity $d2
	note B_, 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note B_, 2
	loopchannel 0, Music_Credits_branch_f502e
; f516a

Music_Credits_Ch3: ; f516a
	stereopanning $ff
	vibrato $6, $26
	notetype $c, $25
	octave 2
	note E_, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
Music_Credits_branch_f509d:
	note A_, 2
	note __, 4
	note A_, 2
	note A_, 2
	note __, 4
	note E_, 2
	note A_, 2
	note __, 2
	note E_, 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note F#, 2
	note E_, 2
	octave 3
	note C#, 2
	octave 2
	note F#, 2
	note __, 2
	note F#, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note B_, 2
	note __, 2
	note F#, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note F#, 2
	note B_, 2
	note __, 4
	octave 3
	note F#, 2
	note E_, 2
	note C#, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 2
	note __, 4
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	note G#, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note C#, 2
	octave 2
	note E_, 2
	loopchannel 0, Music_Credits_branch_f509d
	
; f517a

Music_Credits_Ch4: ; f517a
	togglenoise $3
	stereopanning $f
	notetype $c
	note __, 4
	note D_, 2
	note __, 2
	note D_, 2
	note D_, 2
	note __, 2
	note D_, 2
Music_Credits_branch_f5118:
	note G#, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note D_, 2
	note D_, 2
	note G#, 2
	note G#, 2
	loopchannel 0, Music_Credits_branch_f5118
; f518a
