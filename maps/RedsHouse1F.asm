const_value = 1
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

RedsMom:
	faceplayer
	opentext
	writetext RedsMomText1
	waitbutton
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "Hi!"

	para "RED's been away"
	line "for a long time."

	para "He hasn't called"
	line "either, so I have"

	para "no idea where he"
	line "is or what he's"
	cont "been doing."

	para "They say that no"
	line "word is proof that"

	para "he's doing fine,"
	line "but I do worry"
	cont "about him."
	done

RedsMomText2:
	text "I worry about RED"
	line "getting hurt or"

	para "sick, but he's a"
	line "boy. I'm proud"

	para "that he is doing"
	line "what he wants to"

	para "do."
	done

RedsHouse1FTVText:
	text "They have programs"
	line "that aren't shown"
	cont "in JOHTO<...>"
	done

RedsHouse1F_MapEventHeader:

.Warps: db 1
	warp_def $0, $7, 1, REDS_HOUSE_2F

.XYTriggers: db 0

.Signposts: db 3
	signpost 1, 0, SIGNPOST_READ, RedsHouse1FBookshelf
	signpost 1, 1, SIGNPOST_READ, RedsHouse1FBookshelf
	signpost 1, 2, SIGNPOST_READ, RedsHouse1FTV

.PersonEvents: db 1
	person_event SPRITE_REDS_MOM, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RedsMom, -1
