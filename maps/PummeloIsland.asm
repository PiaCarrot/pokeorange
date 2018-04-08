const_value set 1

PummeloIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PUMMELO
	return
	
PummeloBadgeYoungsterScript:
	faceplayer
	opentext
	writetext MissingBadgeText
	waitbutton
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .CheckLuana
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .Missing1Badge
	writetext MissingNoBadgeText
	waitbutton
	closetext
	end
	
.CheckLuana:
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .Missing2Badge
	writetext Missing1BadgeText
	waitbutton
	closetext
	end
	
.Missing1Badge:
	writetext Missing1BadgeText
	waitbutton
	closetext
	end
	
.Missing2Badge:
	writetext Missing2BadgeText
	waitbutton
	closetext
	end
	
MissingBadgeText:
	text "You're a trainer!"
	line "How many badges do"
	cont "you have?"
	done
	
Missing1BadgeText:
	text "Aha! You are miss-"
	line "ing a badge!"
	
	para "They won't let you"
	line "into the PUMMELO"
	cont "STADIUM like that!"
	done
	
Missing2BadgeText:
	text "Aha! You are miss-"
	line "ing two badges!"
	
	para "You're really a"
	line "slacker, aren't"
	cont "you?"
	done

MissingNoBadgeText:
	text "All four badges!"
	
	para "Wow, you're super"
	line "awesome!"
	done
	
PummeloIslandSign:
	jumptext PummeloIslandSignText
	
PummeloIslandSign2:
	jumptext PummeloIslandSign2Text
	
PummeloIslandSignText:
	text "PUMMELO ISLAND"
	done
	
PummeloIslandSign2Text:
	text "HALL OF FAME"
	done

PummeloIsland_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 31, 27, SIGNPOST_READ, PummeloIslandSign
	signpost 22, 28, SIGNPOST_READ, PummeloIslandSign2

.ObjectEvents: db 1
	person_event SPRITE_YOUNGSTER, 31, 24, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloBadgeYoungsterScript, -1

