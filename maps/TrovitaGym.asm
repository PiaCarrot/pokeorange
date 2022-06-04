const_value = 1
	const TROVITA_GYM_RUDY
	const TROVITA_GYM_GUY
	const TROVITA_GYM_MORIKO
	const TROVITA_GYM_AIRI
	const TROVITA_GYM_KATSUO
	const TROVITA_GYM_SON
	const PIA_CARROT_BETA

TrovitaGym_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TROVITA
	return

RudyScript:
	blackoutmod TROVITOPOLIS
	faceplayer
	opentext
	checkevent EVENT_BEAT_RUDY
	iftrue .FightDone
	writetext RudyText
	waitbutton
	closetext
	winlosstext RudyWinLossText, 0
	loadtrainer RUDY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RUDY
	opentext
	writetext BeatRudyText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SPIKE_SHELL_BADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_DOUBLE_TEAM
	iftrue .SpeechAfterTM
;	setevent event_beat_gym_trainers
	writetext RudyDoubleTeamText
	buttonsound
	verbosegiveitem TM_DOUBLE_TEAM
	iffalse .NoRoomForDoubleTeam
	setevent EVENT_GOT_TM_DOUBLE_TEAM
	writetext RudyDoubleTeamExplanationText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext RudyAlreadyGotTMText
	waitbutton
.NoRoomForDoubleTeam:
	closetext
	end

TrovitaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RUDY
	iftrue .TrovitaGymGuyWinScript
	writetext TrovitaGymGuyText
	waitbutton
	closetext
	end

.TrovitaGymGuyWinScript:
	writetext TrovitaGymGuyWinText
	waitbutton
	closetext
	end

TrovitaGymStatue:
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext RUDY, 1, $1
	jumpstd gymstatue2

CooltrainerMorikoScript:
	trainer EVENT_BEAT_COOLTRAINERF_MORIKO, COOLTRAINERF, MORIKO, CooltrainerMorikoSeenText, CooltrainerMorikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMorikoAfterText
	waitbutton
	closetext
	end

CooltrainerMorikoSeenText:
	text "RUDY doesn't have"
	line "time for a loser"
	cont "like you!"
	done

CooltrainerMorikoBeatenText:
	text "What?"
	done

CooltrainerMorikoAfterText:
	text "I just let my"
	line "guard down."
	done

CooltrainerAiriScript:
	trainer EVENT_BEAT_COOLTRAINERF_AIRI, COOLTRAINERF, AIRI, CooltrainerAiriSeenText, CooltrainerAiriBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerAiriAfterText
	waitbutton
	closetext
	end

CooltrainerAiriSeenText:
	text "Um<...>"
	
	para "Let's have a fair"
	line "battle."
	done

CooltrainerAiriBeatenText:
	text "Uwaah!"
	done

CooltrainerAiriAfterText:
	text "Sniffle<...>"
	
	para "I lost fair and"
	line "square."
	done

CooltrainerKatsuoScript:
	trainer EVENT_BEAT_COOLTRAINERM_KATSUO, COOLTRAINERM, KATSUO, CooltrainerKatsuoSeenText, CooltrainerKatsuoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerKatsuoAfterText
	waitbutton
	closetext
	end

CooltrainerKatsuoSeenText:
	text "I wonder if making"
	line "poses and dancing"
	cont "could make #MON"
	cont "stronger."
	done

CooltrainerKatsuoBeatenText:
	text "Wow, you got the"
	line "moves!"
	done

CooltrainerKatsuoAfterText:
	text "RUDY says dancing"
	line "makes #MON a"
	cont "lot more agile."
	done

CooltrainerSonScript:
	trainer EVENT_BEAT_COOLTRAINERM_SON, COOLTRAINERM, SON, CooltrainerSonSeenText, CooltrainerSonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerSonAfterText
	waitbutton
	closetext
	end

CooltrainerSonSeenText:
	text "I feel like I'm"
	line "one with the wind"
	cont "when I'm dancing"
	cont "with #MON!"
	done

CooltrainerSonBeatenText:
	text "Blown away!"
	done

CooltrainerSonAfterText:
	text "You're disturbing"
	line "my peaceful day!"
	done

RudyText:
	text "Hello, CHALLENGER."
	
	para "I am RUDY of the"
	line "ORANGE CREW, and I"
	cont "specialize in the"
	cont "ability of #MON"
	
	para "that are evasive!"
	line "I'll beat you in a"
	cont "flash!"
	done
	
RudyWinLossText:
	text "Your moves are too"
	line "good for me to"
	cont "keep up!"
	done

BeatRudyText:
	text "<PLAYER> received"
	line "SPIKE SHELL BADGE."
	done

RudyDoubleTeamText:
	text "Well done."

	para "That badge will"
	line "allow any #MON"
	cont "up to Level 70"
	cont "to obey you."

	para "Here--you can"
	line "have this."
	done

RudyDoubleTeamExplanationText:
	text "That TM contains"
	line "DOUBLE TEAM. Use"
	cont "it to dance out"
	cont "of trouble!"
	
	para "If they can't hit"
	line "you, they can't"
	cont "win!"
	done

RudyAlreadyGotTMText:
	text "Until we meet"
	line "again."
	done

TrovitaGymGuyText:
	text "Yo, CHAMP in the"
	line "making!"
	
	para "You better be fast"
	line "if you wanna take"
	cont "out RUDY! He'll"
	cont "use DOUBLE TEAM to"
	
	para "increase his"
	line "evasiveness!"
	done

TrovitaGymGuyWinText:
	text "That was a hot"
	line "match!"
	
	para "Only one badge to"
	line "go, kid!"
	done
	
PiaCarrotText:
	text "PIA CARROT: Thanks"
	line "for playing the"
	cont "the beta."
	
	para "Not much more to"
	line "do, but take these"
	cont "and go have some"
	cont "more fun!"
	done

TrovitaGym_MapEventHeader::

.Warps: db 2
	warp_def 13, 4, 2, TROVITA_ISLAND
	warp_def 13, 5, 2, TROVITA_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 7, SIGNPOST_READ, TrovitaGymStatue
	signpost 11, 2, SIGNPOST_READ, TrovitaGymStatue

.ObjectEvents: db 7
	person_event SPRITE_RUDY, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RudyScript, -1
	person_event SPRITE_GYM_GUY, 11, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitaGymGuyScript, -1
	person_event SPRITE_COOLTRAINER_F, 7, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerMorikoScript, -1
	person_event SPRITE_COOLTRAINER_F, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerAiriScript, -1
	person_event SPRITE_COOLTRAINER_M, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerKatsuoScript, -1
	person_event SPRITE_COOLTRAINER_M, 7, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, CooltrainerSonScript, -1
