const_value set 1
	const HALLOFFAME_LANCE

HallOfFame_MapScriptHeader:

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .NotChampYet
	priorityjump .HallOfFameScript
	end
	
.NotChampYet:
	end
	
.Trigger1:
	end

.HallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	spriteface PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	spriteface HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	dotrigger $1
	pause 15
	writebyte 2 ; Machine is in the Hall of Fame
	special HealMachineAnim
	setevent EVENT_DRAKE_IN_HALL_OF_FAME
	special HealParty
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "DRAKE: It's been a"
	line "long time since I"
	cont "last came here."

	para "This is where we"
	line "honor the ORANGE"

	para "CREW CHAMPIONS"
	line "for generations"
	cont "to come."

	para "Their courageous"
	line "#MON are also"
	cont "inducted."

	para "Here today, we"
	line "witnessed the rise"

	para "of a new ORANGE"
	line "CREW CHAMPION--a"

	para "trainer who feels"
	line "compassion for,"

	para "and trust toward,"
	line "all #MON."

	para "A trainer who"
	line "succeeded through"

	para "perseverance and"
	line "determination."

	para "The new ORANGE"
	line "CREW CHAMPION who"

	para "will lead us to"
	line "more greatness!"

	para "<PLAYER>, allow me"
	line "to register you"

	para "and your partners"
	line "as CHAMPIONS!"
	done
	
HallOfFameMachineScript:
	halloffame
	end

HallOfFame_MapEventHeader:

.Warps: db 2
	warp_def 11, 6, 1, PUMMELO_ISLAND
	warp_def 11, 7, 2, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 1
	signpost  4,  8, SIGNPOST_READ, HallOfFameMachineScript

.PersonEvents: db 1
	person_event SPRITE_DRAKE, 10,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAKE_IN_HALL_OF_FAME
