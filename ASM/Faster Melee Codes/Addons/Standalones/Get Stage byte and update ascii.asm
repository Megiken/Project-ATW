#To be inserted at 8032C8fc

.include "Common/common.s"

#input r15 = custom stage id for debug menu value
#output r3 = stage ID to store, ascii auto stored

load r20,customStageData
mulli r21,r15,4
lwzx r20,r21,r20
cmpwi r20,0x3a
bgt CUSTOM
mr r3,r20
blr
CUSTOM:
backup
bl THERE
#branches
b MajorasMask
b Entei
b Goomba
b MountOlympus
b Allstarrest
b Homeruncontest
b EscapeShaft
b Racetothefinish
b Duelistprostage
b Event32Corneria
b LegalRainbowCruise
b Legalbigblue
b LegalGreenGreens
b LegalPeachsCastle
b LegalYoshisisland
b LegalJungleJapes
b LegalGreatBay
b LegalMushroomKingdom2
b LegalYoshisIslandN64
b LegalKongoJungle
b Smashvillefourside
b Skyrule
b KirbyWare
b LongFD
b LylatCruise
b NintendoGamecube
b KalosPokemonLeague
b WarioWareInc
b HyruleCastle
b SuzakuCastle
b MetalCavernM
b MetroidLab
b BattlefinoPlaza
b Smash4Battlefield
b Miiverse
b SplattlefinoPlaza
b Smash4FD
b SaffronCity
b seventyfivem
b Warioland

THERE:
mflr r16
subi r20,r20,0x3b
mulli r20,r20,4
add r16,r16,r20
mtctr r16
bctr

MajorasMask:
li r3,0xf8
b CUSTOMEND
Entei:
li r3,0xe3
b CUSTOMEND
Goomba:
li r3,0xd7
b CUSTOMEND
MountOlympus:
li r3,0x53
b CUSTOMEND
Allstarrest:
li r3,0x55
b CUSTOMEND
Homeruncontest:
li r3,0x54
b CUSTOMEND
EscapeShaft:
li r3,0x42
b CUSTOMEND
Racetothefinish:
li r3,0x52
b CUSTOMEND
Duelistprostage:

Event32Corneria:
li r3,0xe9
b CUSTOMEND
LegalRainbowCruise:

Legalbigblue:

LegalGreenGreens:

LegalPeachsCastle:

LegalYoshisisland:

LegalJungleJapes:
LegalGreatBay:
LegalMushroomKingdom2:
LegalYoshisIslandN64:
LegalKongoJungle:
Smashvillefourside:
Skyrule:
KirbyWare:
LongFD:
LylatCruise:
NintendoGamecube:
KalosPokemonLeague:
WarioWareInc:
HyruleCastle:
SuzakuCastle:
MetalCavernM:
MetroidLab:
BattlefinoPlaza:
Smash4Battlefield:
Miiverse:
SplattlefinoPlaza:
Smash4FD:
SaffronCity:
seventyfivem:
Warioland:









CUSTOMEND:
restore
blr
