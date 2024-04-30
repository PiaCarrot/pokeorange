INCLUDE "includes.asm"


SECTION "Audio", ROMX

INCLUDE "audio/engine.asm"

; What music plays when a trainer notices you
INCLUDE "audio/trainer_encounters.asm"

Music:
INCLUDE "audio/music_pointers.asm"

INCLUDE "audio/music/nothing.asm"

Cries:
INCLUDE "audio/cry_pointers.asm"

SFX:
INCLUDE "audio/sfx_pointers.asm"


SECTION "Songs 1", ROMX

INCLUDE "audio/music/aftertherivalfight.asm"
INCLUDE "audio/music/azaleatown.asm"
INCLUDE "audio/music/battletowerlobby.asm"
INCLUDE "audio/music/battletowertheme.asm"
INCLUDE "audio/music/bicycle.asm"
INCLUDE "audio/music/buenaspassword.asm"
INCLUDE "audio/music/bugcatchingcontest.asm"
INCLUDE "audio/music/burnedtower.asm"
INCLUDE "audio/music/caveoforigin.asm"


SECTION "Songs 2", ROMX

INCLUDE "audio/music/celadoncity.asm"
INCLUDE "audio/music/championbattle.asm"
INCLUDE "audio/music/cherrygrovecity.asm"
INCLUDE "audio/music/cianwoodcity.asm"
INCLUDE "audio/music/cinnabar.asm"
INCLUDE "audio/music/clair.asm"
INCLUDE "audio/music/contestresults.asm"
INCLUDE "audio/music/dancinghall.asm"
INCLUDE "audio/music/wildpokemonvictory.asm"
INCLUDE "audio/music/successfulcapture.asm"


SECTION "Songs 3", ROMX

INCLUDE "audio/music/darkcave.asm"
INCLUDE "audio/music/dragonsden.asm"
INCLUDE "audio/music/ecruteakcity.asm"
INCLUDE "audio/music/elmslab.asm"
INCLUDE "audio/music/evergrandecity.asm"
INCLUDE "audio/music/evolution.asm"
INCLUDE "audio/music/gamecorner.asm"
INCLUDE "audio/music/goldenrodcity.asm"


SECTION "Songs 4", ROMX

INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/gymleadervictory.asm"
INCLUDE "audio/music/halloffame.asm"
INCLUDE "audio/music/healpokemon.asm"
INCLUDE "audio/music/hoenn_dewford_town.asm"
INCLUDE "audio/music/indigoplateau.asm"
INCLUDE "audio/music/johtogymbattle.asm"
INCLUDE "audio/music/johtotrainerbattle.asm"
INCLUDE "audio/music/johtowildbattle.asm"
INCLUDE "audio/music/johtowildbattlenight.asm"


SECTION "Songs 5", ROMX

INCLUDE "audio/music/kantogymbattle.asm"
INCLUDE "audio/music/kantotrainerbattle.asm"
INCLUDE "audio/music/kantowildbattle.asm"
INCLUDE "audio/music/lakeofrage.asm"
INCLUDE "audio/music/lakeofragerocketradio.asm"
INCLUDE "audio/music/lavendertown.asm"
INCLUDE "audio/music/lighthouse.asm"
INCLUDE "audio/music/magnettrain.asm"
INCLUDE "audio/music/mom.asm"


SECTION "Songs 6", ROMX

INCLUDE "audio/music/lookbeauty.asm"
INCLUDE "audio/music/lookgladion.asm"
INCLUDE "audio/music/lookhiker.asm"
INCLUDE "audio/music/lookkimonogirl.asm"
INCLUDE "audio/music/looklass.asm"
INCLUDE "audio/music/lookofficer.asm"
INCLUDE "audio/music/lookpokemaniac.asm"
INCLUDE "audio/music/lookrival.asm"
INCLUDE "audio/music/lookrocket.asm"
INCLUDE "audio/music/looksage.asm"
INCLUDE "audio/music/lookyoungster.asm"


SECTION "Songs 7", ROMX

INCLUDE "audio/music/mainmenu.asm"
INCLUDE "audio/music/mobileadapter.asm"
INCLUDE "audio/music/mobileadaptermenu.asm"
INCLUDE "audio/music/mobilecenter.asm"
INCLUDE "audio/music/mtmoon.asm"
INCLUDE "audio/music/mtmoonsquare.asm"
INCLUDE "audio/music/nationalpark.asm"
INCLUDE "audio/music/newbarktown.asm"
INCLUDE "audio/music/pallettown.asm"


SECTION "Songs 8", ROMX

INCLUDE "audio/music/pokeflutechannel.asm"
INCLUDE "audio/music/pokemoncenter.asm"
INCLUDE "audio/music/pokemonchannel.asm"
INCLUDE "audio/music/pokemonlullaby.asm"
INCLUDE "audio/music/pokemonmarch.asm"
INCLUDE "audio/music/postcredits.asm"
INCLUDE "audio/music/printer.asm"
INCLUDE "audio/music/profoak.asm"
INCLUDE "audio/music/profoakspokemontalk.asm"
INCLUDE "audio/music/ridinglapras.asm"


SECTION "Songs 9", ROMX

INCLUDE "audio/music/rivalbattle.asm"
INCLUDE "audio/music/rocketbattle.asm"
INCLUDE "audio/music/rockethideout.asm"
INCLUDE "audio/music/rockettheme.asm"
INCLUDE "audio/music/route1.asm"
INCLUDE "audio/music/route2.asm"
INCLUDE "audio/music/route3.asm"
INCLUDE "audio/music/route12.asm"
INCLUDE "audio/music/route26.asm"
INCLUDE "audio/music/route29.asm"


SECTION "Songs 10", ROMX

INCLUDE "audio/music/route30.asm"
INCLUDE "audio/music/route36.asm"
INCLUDE "audio/music/route37.asm"
INCLUDE "audio/music/ruinsofalphinterior.asm"
INCLUDE "audio/music/ruinsofalphradio.asm"
INCLUDE "audio/music/showmearound.asm"
INCLUDE "audio/music/slateportcity.asm"
INCLUDE "audio/music/sootopoliscity.asm"
INCLUDE "audio/music/sprouttower.asm"
INCLUDE "audio/music/ssaqua.asm"


SECTION "Songs 11", ROMX

INCLUDE "audio/music/suicunebattle.asm"
INCLUDE "audio/music/surf.asm"
INCLUDE "audio/music/tintower.asm"
INCLUDE "audio/music/trainervictory.asm"
INCLUDE "audio/music/unioncave.asm"
INCLUDE "audio/music/vermilioncity.asm"
INCLUDE "audio/music/victoryroad.asm"
INCLUDE "audio/music/violetcity.asm"
INCLUDE "audio/music/viridiancity.asm"


SECTION "Songs 12", ROMX

INCLUDE "audio/music/crystalopening.asm"
INCLUDE "audio/music/titlescreen.asm"


SECTION "Songs 13", ROMX

INCLUDE "audio/music/hoohbattle.asm"
INCLUDE "audio/music/lilycovecity.asm"
INCLUDE "audio/music/lugiabattle.asm"
INCLUDE "audio/music/route103.asm"
INCLUDE "audio/music/xdbattlesimtheme.asm"
INCLUDE "audio/music/route119.asm"
INCLUDE "audio/music/sunnyshore.asm"
INCLUDE "audio/music/marinetube.asm"
INCLUDE "audio/music/rslooklass.asm"
INCLUDE "audio/music/route110.asm"
INCLUDE "audio/music/route209n.asm"
INCLUDE "audio/music/canalave.asm"

SECTION "Songs 14", ROMX

INCLUDE "audio/music/credits.asm"
INCLUDE "audio/music/route206.asm"
INCLUDE "audio/music/seviiislands.asm"
INCLUDE "audio/music/oreburghgate.asm"
INCLUDE "audio/music/fourisland.asm"
INCLUDE "audio/music/route111.asm"
INCLUDE "audio/music/sirdbattle.asm"
INCLUDE "audio/music/castleroute.asm"
INCLUDE "audio/music/route24gbs.asm"
INCLUDE "audio/music/driftveilcity.asm"

SECTION "Songs Regen", ROMX

INCLUDE "audio/music/tangelojungle.asm"
INCLUDE "audio/music/crystalcave.asm"
INCLUDE "audio/music/meetjessiejames.asm"
INCLUDE "audio/music/rocketmotto.asm"
INCLUDE "audio/music/pinkanisland.asm"
INCLUDE "audio/music/imakunitheme.asm"
INCLUDE "audio/music/traceybattle.asm"
INCLUDE "audio/music/marshadowbattle.asm"
INCLUDE "audio/music/PWTfinalorange.asm"

SECTION "Songs Regen 2", ROMX
INCLUDE "audio/music/traceyencounter.asm"
INCLUDE "audio/music/route69heh.asm"
INCLUDE "audio/music/drakebattle.asm"
INCLUDE "audio/music/ascorbiaisland.asm"
INCLUDE "audio/music/route62.asm"
INCLUDE "audio/music/earlyorangeroute.asm"
INCLUDE "audio/music/crimsonroute.asm"
INCLUDE "audio/music/starterorangeroute.asm"
INCLUDE "audio/music/cityorange.asm"
INCLUDE "audio/music/valenciatown.asm"


SECTION "Songs Regen 3", ROMX


INCLUDE "audio/music/looker.asm"
INCLUDE "audio/music/routeextra.asm"
INCLUDE "audio/music/orangeencounter.asm"
INCLUDE "audio/music/orangedive.asm"

SECTION "Songs Monstarules", ROMX

INCLUDE "audio/music/crossbattle.asm"
INCLUDE "audio/music/orangewild.asm"
INCLUDE "audio/music/lugiassong.asm"
INCLUDE "audio/music/orangegymbattle.asm"
INCLUDE "audio/music/orangetrainerbattle.asm"

SECTION "Sound Effects", ROMX

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "audio/sfx_crystal.asm"



SECTION "Cries", ROMX

CryHeaders:: INCLUDE "audio/cry_headers.asm"

INCLUDE "audio/cries.asm"

INCLUDE "audio/ded.asm"

INCLUDE "audio/ded/files.asm"
