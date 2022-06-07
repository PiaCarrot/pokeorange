const_value = 1
	const LIGHTNING_ISLAND_LAWRENCE

LightningIslandCave_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

LawrenceLightningIslandScript:
	opentext
	writetext LawrenceLightningIslandText2
	waitbutton
	closetext
	faceplayer
	showemote EMOTE_QUESTION, LIGHTNING_ISLAND_LAWRENCE, 15
	playmusic MUSIC_CASTLE_ROUTE
	opentext
	writetext LawrenceLightningIslandText
	waitbutton
	closetext
	applymovement LIGHTNING_ISLAND_LAWRENCE, LawrenceLightningIsland_Movement
	disappear LIGHTNING_ISLAND_LAWRENCE
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_ROUTE_37
	pause 10
	setevent EVENT_MET_LAWRENCE_AT_LIGHTNING_ISLAND
	end
	
LawrenceLightningIslandText:
	text "???: Hmm?"
	
	para "Did those little"
	line "islanders catch"
	cont "wind of my plans"
	cont "already?"
	
	para "Stay out of my way"
	line "if you know what's"
	cont "good for you,"
	cont "peasant."
	
	para "The legends say if"
	line "the 3 treasures"
	cont "are obtained, one"
	cont "can tame LUGIA, or"
	cont "as you islanders"
	cont "call it, 'the god"
	cont "of the sea.'"
	
	para "The 3 treasures"
	line "clearly refer to"
	cont "the 3 bird #MON"
	cont "ZAPDOS, MOLTRES,"
	cont "and ARTICUNO."
	
	para "So, don't worry"
	line "about your stupid"
	cont "little prophecy."
	cont "I am the world's"
	cont "best collector of"
	cont "#MON, LAWRENCE"
	cont "STEALTHIUS"
	cont "GELARDAN, third"
	cont "of his name."
	
	para "I suppose<...>"
	line "That might be a"
	cont "bit sophisticated"
	cont "for you."
	
	para "You may call me"
	line "LAWRENCE III."
	
	para "Good day, peasant."
	done
	
LawrenceLightningIslandText2:
	text "Target appears to"
	line "have left the"
	cont "LIGHTNING ISLAND"
	cont "in order to claim"
	cont "FIRE ISLAND."
	
	para "<...> <...> <...>"
	
	para "Target ZAPDOS is"
	line "currently engaged"
	cont "in battle with"
	cont "Target 3 on ICE"
	cont "ISLAND."
	
	para "???: Getting a"
	line "bit ahead of our-"
	cont "selves are we,"
	cont "ZAPDOS<...>?"
	done
	
LawrenceLightningIsland_Movement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

LightningIslandCave_MapEventHeader::

.Warps: db 2
	warp_def $3, $11, 1, LIGHTNING_ISLAND
	warp_def $5, $3, 2, LIGHTNING_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1	
	person_event SPRITE_LAWRENCE,  3,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LawrenceLightningIslandScript, EVENT_MET_LAWRENCE_AT_LIGHTNING_ISLAND
