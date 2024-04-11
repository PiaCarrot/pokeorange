PrintItemDescription: ; 0x1c8955
; Print the description for item [CurSpecies] at de.

	ld a, [CurSpecies]
	cp TM01
	jr c, .not_a_tm

	ld [wCurItem], a
	push de
	farcall GetTMHMItemMove
	pop hl
	ld a, [wd265]
	ld [CurSpecies], a
	predef_jump PrintMoveDesc

.not_a_tm
	push de
	ld hl, ItemDescriptions
	ld a, [CurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
; 0x1c8987


ItemDescriptions:
	dw MasterBallDesc
	dw UltraBallDesc
	dw BrightpowderDesc
	dw GreatBallDesc
	dw PokeBallDesc
	dw TownMapDesc
	dw SkateboardDesc
	dw MoonStoneDesc
	dw AntidoteDesc
	dw BurnHealDesc
	dw IceHealDesc
	dw AwakeningDesc
	dw ParlyzHealDesc
	dw FullRestoreDesc
	dw MaxPotionDesc
	dw HyperPotionDesc
	dw SuperPotionDesc
	dw PotionDesc
	dw EscapeRopeDesc
	dw RepelDesc
	dw MaxElixerDesc
	dw FireStoneDesc
	dw ThunderStoneDesc
	dw WaterStoneDesc
	dw PinkanBerryDesc
	dw HPUpDesc
	dw ProteinDesc
	dw IronDesc
	dw CarbosDesc
	dw LuckyPunchDesc
	dw CalciumDesc
	dw RareCandyDesc
	dw XAccuracyDesc
	dw LeafStoneDesc
	dw MetalPowderDesc
	dw NuggetDesc
	dw PokeDollDesc
	dw FullHealDesc
	dw ReviveDesc
	dw MaxReviveDesc
	dw GuardSpecDesc
	dw SuperRepelDesc
	dw MaxRepelDesc
	dw DireHitDesc
	dw MasterRodDesc
	dw FreshWaterDesc
	dw SodaPopDesc
	dw LemonadeDesc
	dw XAttackDesc
	dw XDefendDesc
	dw XSpeedDesc
	dw XSpclAtkDesc
	dw CoinCaseDesc
	dw ItemfinderDesc
	dw PokeFluteDesc
	dw ExpAllDesc
	dw OldRodDesc
	dw GoodRodDesc
	dw SuperRodDesc
	dw PPUpDesc
	dw PPMaxDesc
	dw EtherDesc
	dw MaxEtherDesc
	dw ElixerDesc
	dw PinkCureDesc
	dw HeartScaleDesc
	dw QuickClawDesc
	dw PsnCureBerryDesc
	dw SoftSandDesc
	dw SharpBeakDesc
	dw PrzCureBerryDesc
	dw BurntBerryDesc
	dw IceBerryDesc
	dw PoisonBarbDesc
	dw KingsRockDesc
	dw BitterBerryDesc
	dw MintBerryDesc
	dw TinyMushroomDesc
	dw BigMushroomDesc
	dw SilverPowderDesc
	dw AmuletCoinDesc
	dw CleanseTagDesc
	dw MysticWaterDesc
	dw TwistedSpoonDesc
	dw BlackbeltDesc
	dw BlackGlassesDesc
	dw PinkBowDesc
	dw StickDesc
	dw SmokeBallDesc
	dw NeverMeltIceDesc
	dw MagnetDesc
	dw MiracleBerryDesc
	dw PearlDesc
	dw BigPearlDesc
	dw EverStoneDesc
	dw SpellTagDesc
	dw SweetOrangeDesc
	dw GSBallDesc
	dw MiracleSeedDesc
	dw ThickClubDesc
	dw FocusBandDesc
	dw EnergyPowderDesc
	dw EnergyRootDesc
	dw HealPowderDesc
	dw RevivalHerbDesc
	dw HardStoneDesc
	dw LuckyEggDesc
	dw StardustDesc
	dw StarPieceDesc
	dw CharcoalDesc
	dw BerryJuiceDesc
	dw ScopeLensDesc
	dw MetalCoatDesc
	dw DragonFangDesc
	dw LeftoversDesc
	dw MysteryBerryDesc
	dw DragonScaleDesc
	dw HeavyBallDesc
	dw LevelBallDesc
	dw LureBallDesc
	dw FastBallDesc
	dw LightBallDesc
	dw FriendBallDesc
	dw MoonBallDesc
	dw LoveBallDesc
	dw SunStoneDesc
	dw PolkadotBowDesc
	dw UpGradeDesc
	dw BerryDesc
	dw GoldBerryDesc
	dw SquirtBottleDesc
	dw ParkBallDesc
	dw BerserkGeneDesc
	dw SacredAshDesc
	dw SilverWingDesc
	dw RainbowWingDesc
	dw ShinyStoneDesc
	dw TradeStoneDesc
	dw MoroTrophyDesc
	dw DubiousDiscDesc
	dw ShinyCharmDesc
	dw SoulDewDesc
	dw DiveBallDesc
	dw HealBallDesc
	dw DuskBallDesc
	dw FlowerMailDesc
	dw SurfMailDesc
	dw LiteBlueMailDesc
	dw PortraitMailDesc
	dw LovelyMailDesc
	dw EonMailDesc
	dw MorphMailDesc
	dw BlueSkyMailDesc
	dw MusicMailDesc
	dw MewMailDesc
	dw XSpclDefDesc
	dw IceStoneDesc
	dw QuickPowderDesc
	dw MagmarizerDesc
	dw ElectirizerDesc
	dw ProtectorDesc
	dw SalveyoWeedDesc
	dw CatStatueDesc
	dw ShellBoxDesc
	dw ElectricOrbDesc
	dw FireOrbDesc
	dw IceOrbDesc
	dw KantoStoneDesc

MasterBallDesc:
	db   "The best BALL. It"
	next "never misses.@"

UltraBallDesc:
	db   "A BALL with a high"
	next "rate of success.@"

BrightpowderDesc:
	db   "Lowers the foe's"
	next "accuracy. (HOLD)@"

GreatBallDesc:
	db   "A BALL with a de-"
	next "cent success rate.@"

PokeBallDesc:
	db   "An item for catch-"
	next "ing #MON.@"

TownMapDesc:
	db   "A map of the"
	next "ORANGE ISLANDS.@"

SkateboardDesc:
	db   "A high-tech SKATE-"
	next "BOARD for travel.@"

MoonStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

AntidoteDesc:
	db   "Cures poisoned"
	next "#MON.@"

BurnHealDesc:
	db   "Heals burned"
	next "#MON.@"

IceHealDesc:
	db   "Defrosts frozen"
	next "#MON.@"

AwakeningDesc:
	db   "Awakens sleeping"
	next "#MON.@"

ParlyzHealDesc:
	db   "Heals paralyzed"
	next "#MON.@"

FullRestoreDesc:
	db   "Fully restores HP"
	next "& status.@"

MaxPotionDesc:
	db   "Fully restores"
	next "#MON HP.@"

HyperPotionDesc:
	db   "Restores #MON"
	next "HP by 200.@"

SuperPotionDesc:
	db   "Restores #MON"
	next "HP by 50.@"

PotionDesc:
	db   "Restores #MON"
	next "HP by 20.@"

EscapeRopeDesc:
	db   "Use for escaping"
	next "from caves, etc.@"

RepelDesc:
	db   "Repels weak #-"
	next "MON for 100 steps.@"

MaxElixerDesc:
	db   "Fully restores the"
	next "PP of one #MON.@"

FireStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

ThunderStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

WaterStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

PinkanBerryDesc:
	db   "It turns a #-"
	next "MON PINK!@"

HPUpDesc:
	db   "Raises the HP of"
	next "one #MON.@"

ProteinDesc:
	db   "Raises ATTACK of"
	next "one #MON.@"

IronDesc:
	db   "Raises DEFENSE of"
	next "one #MON.@"

CarbosDesc:
	db   "Raises SPEED of"
	next "one #MON.@"

LuckyPunchDesc:
	db   "Ups critical hit"
	next "ratio of CHANSEY.@"

CalciumDesc:
	db   "Ups SPECIAL stats"
	next "of one #MON.@"

RareCandyDesc:
	db   "Raises level of a"
	next "#MON by one.@"

XAccuracyDesc:
	db   "Raises accuracy."
	next "(1 BTL)@"

LeafStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

MetalPowderDesc:
	db   "Raises DEFENSE of"
	next "DITTO. (HOLD)@"

NuggetDesc:
	db   "Made of pure gold."
	next "Sell high.@"

PokeDollDesc:
	db   "Use to escape from"
	next "a wild #MON.@"

FullHealDesc:
	db   "Eliminates all"
	next "status problems.@"

ReviveDesc:
	db   "Restores a fainted"
	next "#MON to 1/2 HP.@"

MaxReviveDesc:
	db   "Fully restores a"
	next "fainted #MON.@"

GuardSpecDesc:
	db   "Prevents stats"
	next "reduction. (1 BTL)@"

SuperRepelDesc:
	db   "Repels weak #-"
	next "MON for 200 steps.@"

MaxRepelDesc:
	db   "Repels weak #-"
	next "MON for 300 steps.@"

DireHitDesc:
	db   "Ups critical hit"
	next "ratio. (1 BTL)@"

MasterRodDesc:
	db   "Legendary ROD for"
	next "catching #MON.@"

FreshWaterDesc:
	db   "Restores #MON"
	next "HP by 50.@"

SodaPopDesc:
	db   "Restores #MON"
	next "HP by 60.@"

LemonadeDesc:
	db   "Restores #MON"
	next "HP by 80.@"

XAttackDesc:
	db   "Raises ATTACK."
	next "(1 BTL)@"

XDefendDesc:
	db   "Raises DEFENSE."
	next "(1 BTL)@"

XSpeedDesc:
	db   "Raises SPEED."
	next "(1 BTL)@"

XSpclAtkDesc:
	db   "Raises SPECIAL"
	next "ATTACK. (1 BTL)@"

CoinCaseDesc:
	db   "Holds up to 9,999"
	next "game coins.@"

ItemfinderDesc:
	db   "Checks for unseen"
	next "items in the area.@"

PokeFluteDesc:
	db   "A FLUTE used to"
	next "play melodies.@"

ExpAllDesc:
	db   "Shares battle EXP."
	next "Points with party.@"

OldRodDesc:
	db   "Use by water to"
	next "fish for #MON.@"

GoodRodDesc:
	db   "A good ROD for"
	next "catching #MON.@"

SuperRodDesc:
	db   "A strong ROD for"
	next "catching #MON.@"

PPUpDesc:
	db   "Raises max PP of"
	next "a selected move.@"
	
PPMaxDesc:
	db   "Maximizes PP of"
	next "a selected move.@"

EtherDesc:
	db   "Restores PP of one"
	next "move by 10.@"

MaxEtherDesc:
	db   "Fully restores PP"
	next "of one move.@"

ElixerDesc:
	db   "Restores PP of all"
	next "moves by 10.@"

PinkCureDesc:
	db   "Removes PINK color"
	next "on #MON.@"

SilverWingDesc:
	db   "A strange, silver-"
	next "colored feather.@"

HeartScaleDesc:
	db   "A lovely scale,"
	next "coveted by many.@"

QuickClawDesc:
	db   "Raises 1st strike"
	next "ratio. (HOLD)@"

PsnCureBerryDesc:
	db   "A self-cure for"
	next "poison. (HOLD)@"

SoftSandDesc:
	db   "Powers up ground-"
	next "type moves. (HOLD)@"

SharpBeakDesc:
	db   "Powers up flying-"
	next "type moves. (HOLD)@"

PrzCureBerryDesc:
	db   "A self-cure for"
	next "paralysis. (HOLD)@"

BurntBerryDesc:
	db   "A self-cure for"
	next "freezing. (HOLD)@"

IceBerryDesc:
	db   "A self-heal for a"
	next "burn. (HOLD)@"

PoisonBarbDesc:
	db   "Powers up poison-"
	next "type moves. (HOLD)@"

KingsRockDesc:
	db   "May make the foe"
	next "flinch. (HOLD)@"

BitterBerryDesc:
	db   "A self-cure for"
	next "confusion. (HOLD)@"

MintBerryDesc:
	db   "A self-awakening"
	next "for sleep. (HOLD)@"

TinyMushroomDesc:
	db   "An ordinary mush-"
	next "room. Sell low.@"

BigMushroomDesc:
	db   "A rare mushroom."
	next "Sell high.@"

SilverPowderDesc:
	db   "Powers up bug-type"
	next "moves. (HOLD)@"

AmuletCoinDesc:
	db   "Doubles monetary"
	next "earnings. (HOLD)@"

CleanseTagDesc:
	db   "Helps repel wild"
	next "#MON. (HOLD)@"

MysticWaterDesc:
	db   "Powers up water-"
	next "type moves. (HOLD)@"

TwistedSpoonDesc:
	db   "Powers up psychic-"
	next "type moves. (HOLD)@"

BlackbeltDesc:
	db   "Boosts fighting-"
	next "type moves. (HOLD)@"

BlackGlassesDesc:
	db   "Powers up dark-"
	next "type moves. (HOLD)@"

PinkBowDesc:
	db   "Powers up normal-"
	next "type moves. (HOLD)@"

StickDesc:
	db   "An ordinary stick."
	next "Sell low.@"

SmokeBallDesc:
	db   "Escape from wild"
	next "#MON. (HOLD)@"

NeverMeltIceDesc:
	db   "Powers up ice-type"
	next "moves. (HOLD)@"

MagnetDesc:
	db   "Boosts electric-"
	next "type moves. (HOLD)@"

MiracleBerryDesc:
	db   "Cures all status"
	next "problems. (HOLD)@"

PearlDesc:
	db   "A beautiful pearl."
	next "Sell low.@"

BigPearlDesc:
	db   "A big, beautiful"
	next "pearl. Sell high.@"

EverStoneDesc:
	db   "Stops evolution."
	next "(HOLD)@"

SpellTagDesc:
	db   "Powers up ghost-"
	next "type moves. (HOLD)@"

SweetOrangeDesc:
	db   "Restores #MON"
	next "HP by 20.@"

GSBallDesc:
	db   "The mysterious"
	next "BALL.@"

MiracleSeedDesc:
	db   "Powers up grass-"
	next "type moves. (HOLD)@"

ThickClubDesc:
	db   "A bone of some"
	next "sort. Sell low.@"

FocusBandDesc:
	db   "May prevent faint-"
	next "ing. (HOLD)@"

EnergyPowderDesc:
	db   "Restores #MON"
	next "HP by 50. Bitter.@"

EnergyRootDesc:
	db   "Restores #MON"
	next "HP by 200. Bitter.@"

HealPowderDesc:
	db   "Cures all status"
	next "problems. Bitter.@"

RevivalHerbDesc:
	db   "Revives fainted"
	next "#MON. Bitter.@"

HardStoneDesc:
	db   "Powers up rock-"
	next "type moves. (HOLD)@"

LuckyEggDesc:
	db   "Earns extra EXP."
	next "points. (HOLD)@"

StardustDesc:
	db   "Pretty, red sand."
	next "Sell high.@"

StarPieceDesc:
	db   "A hunk of red gem."
	next "Sell very high.@"

CharcoalDesc:
	db   "Powers up fire-"
	next "type moves. (HOLD)@"

BerryJuiceDesc:
	db   "Restores #MON"
	next "HP by 20.@"

ScopeLensDesc:
	db   "Raises critical"
	next "hit ratio. (HOLD)@"

MetalCoatDesc:
	db   "Powers up steel-"
	next "type moves. (HOLD)@"

DragonFangDesc:
	db   "Powers up dragon-"
	next "type moves. (HOLD)@"

LeftoversDesc:
	db   "Restores HP during"
	next "battle. (HOLD)@"

MysteryBerryDesc:
	db   "A self-restore"
	next "for PP. (HOLD)@"

DragonScaleDesc:
	db   "A rare dragon-type"
	next "item.@"

BerserkGeneDesc:
	db   "Boosts confidence,"
	next "causes confusion.@"

SacredAshDesc:
	db   "Fully revives all"
	next "fainted #MON.@"

HeavyBallDesc:
	db   "A BALL for catch-"
	next "ing heavy #MON.@"

FlowerMailDesc:
	db   "Flower-print MAIL."
	next "(HOLD)@"

LevelBallDesc:
	db   "A BALL for lower-"
	next "level #MON.@"

LureBallDesc:
	db   "A BALL for #MON"
	next "hooked by a ROD.@"

FastBallDesc:
	db   "A BALL for catch-"
	next "ing fast #MON.@"

LightBallDesc:
	db   "An odd, electrical"
	next "orb. (HOLD)@"

FriendBallDesc:
	db   "A BALL that makes"
	next "#MON friendly.@"

MoonBallDesc:
	db   "A BALL for MOON"
	next "STONE evolvers.@"

LoveBallDesc:
	db   "For catching the"
	next "opposite gender.@"

SunStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

PolkadotBowDesc:
	db   "Powers up fairy-"
	next "type moves. (HOLD)@"

UpGradeDesc:
	db   "A mysterious box"
	next "made by SILPH CO.@"

BerryDesc:
	db   "A self-restore"
	next "item. (10HP, HOLD)@"

GoldBerryDesc:
	db   "A self-restore"
	next "item. (30HP, HOLD)@"

SquirtBottleDesc:
	db   "A bottle used for"
	next "watering plants.@"

ParkBallDesc:
	db   "The Bug-Catching"
	next "Contest BALL.@"

RainbowWingDesc:
	db   "A mystical feather"
	next "of rainbow colors.@"

ShinyStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

TradeStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"

MoroTrophyDesc:
	db   "A stolen trophy."
	next "300 years old.@"

DubiousDiscDesc:
	db   "A mysterious disc"
	next "of unknown origin.@"

ShinyCharmDesc:
	db   "A charm for find-"
	next "ing shiny #MON.@"

SoulDewDesc:
	db   "A wondrous orb for"
	next "LATIOS or LATIAS.@"

DiveBallDesc:
	db   "A BALL for under-"
	next "water #MON.@"

HealBallDesc:
	db   "A remedial BALL to"
	next "heal #MON.@"

DuskBallDesc:
	db   "A BALL for night-"
	next "time or caves.@"

SurfMailDesc:
	db   "LAPRAS-print MAIL."
	next "(HOLD)@"

LiteBlueMailDesc:
	db   "DRATINI-print"
	next "MAIL. (HOLD)@"

PortraitMailDesc:
	db   "MAIL featuring the"
	next "holder's likeness.@"

LovelyMailDesc:
	db   "Heart-print MAIL."
	next "(HOLD)@"

EonMailDesc:
	db   "EEVEE-print MAIL."
	next "(HOLD)@"

MorphMailDesc:
	db   "DITTO-print MAIL."
	next "(HOLD)@"

BlueSkyMailDesc:
	db   "Sky-print MAIL."
	next "(HOLD)@"

MusicMailDesc:
	db   "TOGEKISS-print MAIL."
	next "(HOLD)@"

MewMailDesc:
	db   "MEW-print MAIL."
	next "(HOLD)@"
	
XSpclDefDesc:
	db   "Raises SPECIAL"
	next "DEFENSE. (1 BTL)@"
	
IceStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"
	
QuickPowderDesc:
	db   "Raises SPEED of"
	next "DITTO. (HOLD)@"
	
MagmarizerDesc:
	db   "Packed immensely"
	next "with magma energy.@"
	
ElectirizerDesc:
	db   "Packed with lots"
	next "of electricity.@"
	
ProtectorDesc:
	db   "Extremely stiff"
	next "and heavy.@"
	
SalveyoWeedDesc:
	db   "Smells like pond"
	next "water. For fevers.@"
	
CatStatueDesc:
	db   "Solid gold statue."
	next "Worth a ton.@"
	
ShellBoxDesc:
	db   "A quaint wooden"
	next "box for shells.@"
	
ElectricOrbDesc:
	db   "God of LIGHTNING"
	next "ISLAND's treasure.@"

FireOrbDesc:
	db   "God of FIRE"
	next "ISLAND's treasure.@"

IceOrbDesc:
	db   "God of ICE"
	next "ISLAND's treasure.@"

KantoStoneDesc:
	db   "Evolves certain"
	next "kinds of #MON.@"