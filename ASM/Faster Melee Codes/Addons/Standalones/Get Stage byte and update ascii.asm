#To be inserted at 8032C8fc

.include "Common/common.s"

#input r15 = custom stage id for debug menu value
#output r15 = stage ID to store, ascii auto stored

load r20,customStageData
mulli r21,r15,4
lwzx r20,r21,r20
cmpwi r20,0x3a
bgt CUSTOM
cmpwi r20,0x1a
bne RETURN

load r21,dreamlandFlag
lwz r21,0(r21)
cmpwi r21,0
beq RETURN
cmpwi r21,2
beq NIGHT
lwz r21,gameID(rtoc)
cmpwi r21,1
bne RETURN

NIGHT:
lis r17,0x803e
ori r17,r17,0x6740
load r16,0x702e7261
lwz r18,0(r17)
stw r17,tempStageAdr(rtoc)
stw r18,tempBackupAscii(rtoc)
stw r16,0(r17)

RETURN:
mr r15,r20
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
li r15,0xf8
b CUSTOMEND
Entei:
li r15,0xe3
b CUSTOMEND
Goomba:
li r15,0xd7
b CUSTOMEND
MountOlympus:
li r15,0x53
b CUSTOMEND
Allstarrest:
li r15,0x55
b CUSTOMEND
Homeruncontest:
li r15,0x54
b CUSTOMEND
EscapeShaft:
li r15,0x42
b CUSTOMEND
Racetothefinish:
li r15,0x52
b CUSTOMEND
Duelistprostage:

li r15,0x2c
load r20,0x803e8e44
load r21,0x4c672e31


b CUSTOM2END

Event32Corneria:
li r15,0xe9
b CUSTOMEND

Legalbigblue:

li r15,0x18
load r20,0x803E2D18
load r21,0x622e3061
b CUSTOM2END

LegalGreenGreens:

li r15,0x11
load r20,0x803E76C8
load r21,0x722e3061
b CUSTOM2END

LegalPeachsCastle:

li r15,0x4
load r20,0x803E119C
load r21,0x732E3061
b CUSTOM2END

LegalYoshisisland:

li r15,0x10
load r20,0x803E51C4
load r21,0x742E3061
b CUSTOM2END

LegalJungleJapes:

li r15,0xc
load r20,0x803E52D8
load r21,0x642E3061
b CUSTOM2END

LegalGreatBay:

li r15,0xd
load r20,0x803E3F64
load r21,0x622E3061
b CUSTOM2END

LegalMushroomKingdom2:

li r15,0x14
load r20,0x803E4BF8
load r21,0x322E3061
b CUSTOM2END

LegalYoshisIslandN64:

li r15,0x1d
load r20,0x803E6504
load r21,0x792E3061
b CUSTOM2END

LegalKongoJungle:

li r15,0x5
load r20,0x803E17F8
load r21,0x672E3061
b CUSTOM2END

Smashvillefourside:

li r15,0x12
load r20,0x803E3D8C
load r21,0x732E3061
b CUSTOM2END

Skyrule:

li r15,0xe
load r20,0x803E5128
load r21,0x682E3061
b CUSTOM2END

KirbyWare:

li r15,0x1c
load r20,0x803E6740
load r21,0x702E3061
b CUSTOM2END

LylatCruise:

li r15,0x2b
load r20,0x803E8D84
load r21,0x4C6B2E30
b CUSTOM2END

NintendoGamecube:

li r15,0x2c
load r20,0x803e8e44
load r21,0x4C672E32
b CUSTOM2END

KalosPokemonLeague:

li r15,0x39
load r20,0x803E9814
load r21,0x46652E30
b CUSTOM2END

WarioWareInc:

li r15,0x1d
load r20,0x803E6504
load r21,0x792E3161
b CUSTOM2END

HyruleCastle:

li r15,0x30
load r20,0x803E9144
load r21,0x50652E30
b CUSTOM2END

SuzakuCastle:

li r15,0x2c
load r20,0x803e8e44
load r21,0x4C672E30
b CUSTOM2END

MetalCavernM:

li r15,0x32
load r20,0x803E92C4
load r21,0x506B2E30
b CUSTOM2END

MetroidLab:

li r15,0x2a
load r20,0x803E8CC4
load r21,0x4B702E30
b CUSTOM2END

BattlefinoPlaza:

li r15,0x1f
load r20,0x803E7E30
load r21,0x42612E30
b CUSTOM2END

Smash4Battlefield:

li r15,0x23
load r20,0x803E8724
load r21,0x436C2E30
b CUSTOM2END

Miiverse:

li r15,0x29
load r20,0x803E8C04
load r21,0x4B622E30
b CUSTOM2END

SplattlefinoPlaza:

li r15,0x35
load r20,0x803E950C
load r21,0x536B2E30
b CUSTOM2END

Smash4FD:

li r15,0x20
load r20,0x803E7F88
load r21,0x4C612E30
b CUSTOM2END

SaffronCity:

li r15,0x22
load r20,0x803E865C
load r21,0x43612E30
b CUSTOM2END

seventyfivem:

li r15,0x3a
load r20,0x803E98D4
load r21,0x476E2E30
b CUSTOM2END

Warioland:

li r15,0x2f
load r20,0x803E9084
load r21,0x4E732E30
b CUSTOM2END

CUSTOM2END:


lwz r22,0(r20)
stw r20,tempStageAdr(rtoc)
stw r22,tempBackupAscii(rtoc)
stw r21,0(r20)



CUSTOMEND:
restore
blr
