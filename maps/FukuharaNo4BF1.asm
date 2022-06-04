const_value = 1
	const FUKUHARA_BF1_BUTCH
	const FUKUHARA_BF1_CASSIDY
	const FUKUHARA_BF1_ITEMBALL_ULTRA_BALL
	const FUKUHARA_BF1_ITEMBALL_MAX_ETHER
	const FUKUHARA_BF1_ITEMBALL_REVIVE
	const FUKUHARA_BF1_ITEMBALL_CARBOS

FukuharaNo4BF1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FukuharaBF1UltraBall:
	itemball ULTRA_BALL

FukuharaBF1MaxEther:
	itemball MAX_ETHER
	
FukuharaBF1Revive:
	itemball REVIVE
	
FukuharaBF1Carbos:
	itemball CARBOS
	
FukuharaNo4BF1Script:
	opentext
	writetext FukuharaNo4BF1ScriptText
	waitbutton
	closetext
	applymovement FUKUHARA_BF1_BUTCH, FukuharaNo4BF1ScriptMovement
	applymovement FUKUHARA_BF1_CASSIDY, FukuharaNo4BF1ScriptMovement
	disappear FUKUHARA_BF1_BUTCH
	disappear FUKUHARA_BF1_CASSIDY
	domaptrigger FUKUHARA_NO_4_BF1, $1
	setevent EVENT_FUKUHARA_BF1_EVENT
	end
	
FukuharaNo4BF1ScriptMovement:
	step UP
	step UP
	step_end

FukuharaNo4BF1ScriptText:
	text "BUTCH: We scored"
	line "big this time, my"
	cont "dear CASSIDY!"
	
	para "CASSIDY: Yes, we"
	line "have. There are"
	cont "tons of rare"
	cont "#MON here!"
	
	para "BUTCH: Who would"
	line "have thought?"

	para "CASSIDY: Let's"
	line "catch some and use"
	cont "them to advance"
	cont "TEAM ROCKET's"
	
	para "ambition!"
	
	para "ROCKETS: Mwahaha!"
	done

FukuharaNo4BF1_MapEventHeader::

.Warps: db 2
	warp_def 37, 13, 1, ROUTE_56_EAST
	warp_def 3, 9, 1, FUKUHARA_NO_4_BF2

.CoordEvents: db 1
	xy_trigger 0, 31, 16, FukuharaNo4BF1Script

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_ROCKET, 28, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FUKUHARA_BF1_EVENT
	person_event SPRITE_ROCKET_GIRL, 28, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FUKUHARA_BF1_EVENT
	person_event SPRITE_POKE_BALL, 6, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF1UltraBall, EVENT_FUKUHARA_BF1_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 2, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF1MaxEther, EVENT_FUKUHARA_BF1_MAX_ETHER
	person_event SPRITE_POKE_BALL, 36, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF1Revive, EVENT_FUKUHARA_BF1_REVIVE
	person_event SPRITE_POKE_BALL, 33, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF1Carbos, EVENT_FUKUHARA_BF1_CARBOS

