	const_def
	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BUG
	const DARK
	const STEEL
	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC
	const ICE
	const DRAGON
	const GHOST
	const FAIRY
TYPES_END EQU const_value

if DEF(PSS)
PHYSICAL EQU %00000000
SPECIAL  EQU %10000000
STATUS   EQU %11000000
else
PHYSICAL EQU NORMAL ; first physical type
SPECIAL  EQU FIRE ; first special type
STATUS   EQU TYPES_END
endc
