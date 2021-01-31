; Cinnabar Island (FRLG)
; Demixed by TriteHexagon
Music_CinnabarIslandFRLG:
	musicheader 4, 1, Music_CinnabarIslandFRLG_Ch1
	musicheader 1, 2, Music_CinnabarIslandFRLG_Ch2
	musicheader 1, 3, Music_CinnabarIslandFRLG_Ch3
	musicheader 1, 4, Music_CinnabarIslandFRLG_Ch4

; ============================================================================================================
Music_CinnabarIslandFRLG_Ch1:
	tempo 160
	volume $77
	stereopanning $f
	vibrato $04, $25
	
Music_CinnabarIslandFRLG_Ch1_master:
	dutycycle $1
;Bar1:C
	octave 2
	notetype 6, $98
	note B_, 1
	note __, 3
	notetype 12, $98
	note B_, 4
	octave 3
	note D_, 1
	note __, 1
	note D_, 2
	note C_, 1
	note __, 1
	octave 2
	note E_, 1
	note __, 1
	note D_, 2
;Bar2:C
	intensity $98 
	callchannel Music_CinnabarIslandFRLG_Ch1_Bar2
;Bar3:C
	note G_, 1
	notetype 3, $98  
	octave 4
	note D_, 1
	note __, 7
	note D_, 1
	note __, 3
	octave 3
	note B_, 8
	note G_, 4
	note G_, 2
	note __, 2
	notetype 12, $98  
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note F#, 1
	notetype 3, $98  
	octave 4
	note D_, 1
	note __, 3
	notetype 12, $98  
;Bar4:C
	callchannel Music_CinnabarIslandFRLG_Ch1_Bar4
;Bar5:C
	note G_, 1
	notetype 3, $98  
	octave 4
	note __, 8
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note B_, 8
	note G_, 4
	note G_, 2
	note __, 2
	note A_, 2
	octave 4
	note __, 2
	note F#, 1
	note __, 7
	note F#, 1
	note __, 3
	note C_, 8
	octave 3
	note A_, 4
	octave 4
	note G#, 2
	note __, 2
	notetype 12, $98  
;Bar6:C
	callchannel Music_CinnabarIslandFRLG_Ch1_Bar2
;Bar7:C
	note G_, 1
	notetype 3, $98  
	octave 4
	note D_, 1
	note __, 7
	note D_, 1
	note __, 3
	octave 3
	note B_, 8
	note G_, 4
	note G_, 2
	note __, 2
	notetype 12, $98  
	note A_, 1
	note __, 1
	note A_, 1

	notetype 3, $98  
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype 12, $98  

	octave 4
	note C_, 2
	octave 3
	note F#, 1
	notetype 3, $98  
	octave 4
	note D_, 1
	note __, 3
	notetype 12, $98  
;Bar8:
	callchannel Music_CinnabarIslandFRLG_Ch1_Bar4
;Bar9:
	note G_, 1
	notetype 3, $98  
	octave 4
	note D_, 1
	note __, 7
	octave 3
	note G_, 1
	note __, 3
	notetype 12, $98 

	note B_, 4
	
	notetype 3, $98 
	note A_, 2
	note __, 6
	notetype 12, $98  

	note A_, 2
	octave 4

	notetype 3, $98  
	note E_, 2
	note __, 2
	note E_, 1
	note __, 3
	note E_, 2
	note __, 2
	note E_, 1
	note __, 3
	notetype 12, $98 
;Bar10:C
	octave 3
	note B_, 1
	note __, 3
	octave 4
	note D_, 2
	octave 3
	note B_, 1
	notetype 6, $98 
	note B_, 1
	note __, 1
	notetype 12, $98 
	note B_, 1
	note __, 1
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 1
	note __, 1
;Bar11:
	octave 3
	note G_, 1
	note __, 3
	octave 4
	note E_, 2
	note C_, 1
	notetype 3, $98 
	note C_, 1
	note __, 3
	notetype 12, $98 
	note C_, 1
	note __, 1
	note C_, 2
	note E_, 2
	note C_, 1
	note __, 1
;Bar12:
	octave 3
	note A_, 1
	note __, 3
	octave 4
	note A_, 2
	note F#, 1
	notetype 6, $98 
	note F#, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 3
	note __, 1
	notetype 12, $98 
	note D_, 2
	note C_, 1
	note __, 1
;Bar13:C
	octave 3
	note B_, 1
	note __, 1
	note G_, 1
	octave 4
	notetype 6, $98 
	note A_, 1
	note B_, 1
	notetype 12, $98 
	note D_, 2
	note C_, 1
	notetype 3, $98 
	note C_, 1
	note __, 3
	notetype 12, $98 
	octave 3
	note B_, 1
	note __, 1
	note B_, 2
	note A_, 1
	note __, 1
	note A#, 2
;Bar14:C
	octave 3
	note B_, 1
	note __, 2
	notetype 6, $98
	note B_, 1
	octave 4
	note C_, 1
	notetype 12, $98 
	note D_, 2
	octave 3
	note B_, 1
	notetype 6, $98 
	note B_, 1
	note __, 1
	notetype 12, $98 
	note B_, 1
	note __, 1
	note B_, 2
	note B_, 1
	notetype 3, $98
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note B_, 2
	note __, 2
	note A_, 1
	note __, 3
	notetype 12, $98 
;Bar15:C
	octave 3
	note G_, 1
	note __, 2
	octave 4
	notetype 6, $98 
	note C_, 1
	note D_, 1
	notetype 12, $98 

	note E_, 2
	note C_, 1

	notetype 3, $98 
	note C_, 1
	note __, 3
	note C_, 4
	note E_, 1
	note __, 3
	notetype 12, $98 
	note C_, 2
	note E_, 2
	note C_, 1
	note __, 1
;Bar16:
	octave 3
	note A_, 1
	note __, 2
	octave 4

	notetype 6, $98 
	note F#, 1
	note G_, 1
	notetype 12, $98 

	note A_, 2
	note F#, 1

	notetype 3, $98 
	note F#, 1
	note __, 3
	notetype 12, $98 

	note D_, 1
	note __, 1

	notetype 6, $98 
	note D_, 3
	note __, 1
	notetype 12, $98 

	note D_, 2
	note C_, 1
	note __, 1
;Bar17:
	octave 3
	note B_, 1
	note __, 1
	note G_, 1

	notetype 6, $98 
	note A_, 1
	note A#, 1
	notetype 12, $98 

	octave 4
	note D_, 2
	note C_, 1

	notetype 3, $98 
	note C_, 1
	note __, 3
	notetype 12, $98 

	octave 3
	note B_, 1
	note __, 1
	note B_, 2
	
	note A_, 1
	note __, 1
	note A#, 2
	loopchannel 0, Music_CinnabarIslandFRLG_Ch1_master
	endchannel

Music_CinnabarIslandFRLG_Ch1_Bar2:
	octave 3
	note G_, 1
	note __, 1

	notetype 3, $98 
	note __, 3
	note G_, 1
	note __, 2
	note A_, 1
	note __, 1
	notetype 12, $98 

	note B_, 2
	note G_, 1

	notetype 3, $98  
	octave 4
	note G_, 1
	note __, 3
	octave 3
	notetype 12, $98 

	note A_, 2

	notetype 3, $98  
	note G#, 2
	note __, 2
	note A_, 2
	note A_, 1
	note __, 1
	notetype 12, $98  

	octave 4
	note C_, 2
	octave 3
	note F#, 1
	note __, 1
	endchannel

Music_CinnabarIslandFRLG_Ch1_Bar4:
	octave 3
	note G_, 1
	note __, 1

	notetype 3, $98  
	note __, 3
	note G_, 1
	note __, 2
	note A_, 1
	note __, 1
	notetype 12, $98 

	note B_, 2
	note G_, 1

	notetype 3, $98  
	octave 4
	note G_, 1
	note __, 3
	octave 3
	notetype 12, $98 

	note A_, 2

	notetype 3, $98  
	note G#, 2
	note __, 2
	note A_, 2
	note A_, 1
	note __, 1
	notetype 12, $98  

	octave 4
	note C_, 2
	octave 3
	note F#, 1
	notetype 3, $98  
	note D_, 1
	note __, 3
	notetype 12, $98  
	endchannel

; ============================================================================================================
Music_CinnabarIslandFRLG_Ch2:
	stereopanning $ff
	;vibrato $12, $14
	
Music_CinnabarIslandFRLG_Ch2_master:
	dutycycle $2
	vibrato $04, $25
	notetype 6, $c6
;Bar1:C
	octave 3
	note G_, 1
	note __, 3
	notetype 12, $c6
	note G_, 4
	note B_, 1
	note __, 1
	note B_, 2
	note A_, 1
	notetype 6, $c6
	note B_, 1
	note A_, 1
	notetype 12, $c6
	note D_, 1
	note __, 1
	note F#, 2
;Bar2:C
	intensity $c8
	note G_, 4
	intensity $c4
	note G_, 2
	intensity $c8
	note A_, 1
	note B_, 1
	octave 4
	note C_, 4
	intensity $c4
	note C_, 2
	intensity $c8
	note D_, 1
	note E_, 1
;Bar3-4:C
	callchannel Music_CinnabarIslandFRLG_Ch2_Bar3
;Bar5:C
	note D_, 4
	octave 3
	note B_, 6
	intensity $c4
	note B_, 2
	intensity $c8
	note A_, 4
;Bar6:C
	note G_, 4
	intensity $c4
	note G_, 2
	intensity $c8
	note A_, 1
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note D_, 1
	note E_, 1
;Bar7-8:C
	callchannel Music_CinnabarIslandFRLG_Ch2_Bar3
;Bar9:C
	note D_, 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
;Bar10:C
	dutycycle $3
	notetype 12, $c8
	note D_, 6
	octave 2
	note B_, 2
	note G_, 8
;Bar11:C
	octave 3
	note E_, 6
	note C_, 2
	octave 2
	note A_, 8
;Bar12:C
	octave 3
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
;Bar13:C
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	note A_, 4
	octave 3
	dutycycle $0
	notetype 12, $c7
	note B_, 1
	octave 4
	note C_, 1
;Bar14:C
	note D_, 6
	octave 3
	note B_, 2
	note G_, 3
	notetype 6, $c7
	note A_, 1
	note G_, 1
	notetype 12, $c7
	note F#, 2
	note G_, 2
;Bar15:C
	octave 4
	note E_, 6
	note C_, 2
	octave 3
	note A_, 2
	note G#, 2
	note B_, 2
	note A_, 2
;Bar16:C
	octave 4
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	note F#, 2
	note E_, 2
;Bar17:C
	octave 3
	note B_, 4
	octave 4
	note D_, 3
	note F#, 1
	note E_, 2
	note D_, 2
	octave 3
	note E_, 2
	note F#, 2
	loopchannel 0, Music_CinnabarIslandFRLG_Ch2_master
	endchannel

Music_CinnabarIslandFRLG_Ch2_Bar3:
;Bar3:C
	note D_, 4
	note G_, 4
	note A_, 4
	intensity $c4
	note A_, 2
	intensity $c8
	note G_, 1
	note F#, 1
;Bar4:C
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note D_, 1
	note E_, 1
	endchannel

; ============================================================================================================
Music_CinnabarIslandFRLG_Ch3:
	stereopanning $ff
	;vibrato $16, $14

Music_CinnabarIslandFRLG_Ch3_master:
;Bar1:C
	notetype 12, $24
	octave 2
	note G_, 1
	note __, 1
	note G_, 4
	note A_, 1
	note B_, 1
	octave 3
	note D_, 1
	note __, 3
	octave 2
	note A_, 4
;Bar2:C
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 2
	octave 2
	notetype 6, $24
	note B_, 1
	note __, 3
	notetype 12, $24
	note A_, 4
;Bar3:
	octave 2
	note B_, 1
	note __, 3
	octave 3
	note D_, 4
	octave 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note D_, 1
	note E_, 1
	note C_, 2
;Bar4:
	octave 2
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note F#, 1
	note __, 1
	note F#, 4
	note A_, 2
;Bar5:C
	octave 2
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note C_, 2
	octave 2
	note A_, 2
;Bar6:C
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note C_, 1
	note D_, 1
	note C_, 1
	octave 2
	note A_, 1
;Bar7:C
	note B_, 4
	note G_, 4
	note D_, 1
	note __, 1
	note D_, 2
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note F#, 2
;Bar8:C
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note F#, 1
	note __, 1
	note D_, 4
	octave 3
	note D_, 1
	note C_, 1
;Bar9:
	octave 2
	note B_, 2
	note D_, 2
	octave 5
	intensity $13
	stereopanning $f0
	note D_, 1
	note E_, 1
	note D_, 4
	stereopanning $f
	note D_, 1
	note E_, 1
	note D_, 4
	intensity $24
	stereopanning $ff
;Bar10:C
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note B_, 2
;Bar11:C
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note E_, 2
	note C_, 2
;Bar12:C
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 3
	note F#, 2
	note D_, 2
;Bar13:C
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note F#, 2
	octave 3
	note C_, 2
;Bar14:
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 2
	note B_, 4
;Bar15:
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 3
	note C_, 2
	octave 2
	note A_, 2
;Bar16:
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 3
	note F#, 2
	note E_, 2
;Bar17:
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 2
	note D_, 1
	note __, 1
	note A_, 2
	loopchannel 0, Music_CinnabarIslandFRLG_Ch3_master
	endchannel

; ============================================================================================================
Music_CinnabarIslandFRLG_Ch4:
	notetype 6
	stereopanning $f0
	togglenoise $1

Music_CinnabarIslandFRLG_Ch4_master:
;Bar1:C
	note F#, 4
	note E_, 2
	note E_, 2
	note C#, 4
	note C#, 4
	note C_, 4
	note F_, 4
	note C#, 2
	note C#, 2
	note F_, 4
;Bar2-4:C
	callchannel Music_CinnabarIslandFRLG_Ch4_Bar2
;Bar5:C
	note C_, 2
	note C_, 2
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note C#, 4
	note C_, 2
	note C#, 2
	note A_, 2 
	note A_, 2 
	note C_, 2
	note A_, 2 
	note A_, 4 
	note C#, 2
	note C#, 2
;Bar6-8:
	callchannel Music_CinnabarIslandFRLG_Ch4_Bar2
;Bar9:
	note C_, 4
	note C#, 4
	callchannel Music_CinnabarIslandFRLG_Ch4_Bar9 
	note C#, 2
	note C#, 2
;Bar10-13:C
	callchannel Music_CinnabarIslandFRLG_Ch4_Bar10
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G_, 4
	note F_, 1
	note C#, 3
	note G_, 4
;Bar14:C
	note C_, 8
	note C#, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C#, 4
	note C_, 4
;Bar15:C
	note C_, 8
	note C#, 8
	note C_, 2
	note E_, 2
	note C_, 4
	note C#, 4
	note C_, 4
;Bar16:C
	note C_, 4
	note C_, 4
	note C#, 6
	note C#, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note C#, 1
	note C#, 1
	note C#, 4
	note C_, 4
;Bar17:C
	note C_, 4
	note A_, 2 
	note A_, 2 
	note C_, 2
	note A_, 2 
	note A_, 2 
	note C_, 2
	note A_, 2
	note A_, 2 
	note A_, 2 
	note A_, 2 
	note C#, 4
	note C#, 2
	note C_, 2
	loopchannel 0, Music_CinnabarIslandFRLG_Ch4_master
	endchannel

Music_CinnabarIslandFRLG_Ch4_Bar2:
;Bar2:C
	note C_, 4
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 6
	note C_, 2
;Bar3:C
	note C_, 4
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 4
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 6
	note C_, 2
;Bar4:C
	note C_, 2
	note C#, 2
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 1
	note E_, 1
	note C#, 2
	note C_, 4
	note E_, 2
	endchannel

Music_CinnabarIslandFRLG_Ch4_Bar9:
	note A_, 2
	loopchannel 10, Music_CinnabarIslandFRLG_Ch4_Bar9
	endchannel

Music_CinnabarIslandFRLG_Ch4_Bar10:
	note F_, 1
	note C_, 3
	note G_, 4
	loopchannel 14, Music_CinnabarIslandFRLG_Ch4_Bar10
	endchannel