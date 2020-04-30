#To be inserted at 801B09FC

.include "Common/common.s"

li r17,0

lwz r20,gameID(rtoc)
cmpwi r20,1
bne NORMAL

load r20,resumeGame
load r21,0x803fa604
stw r20,0(r21)



NORMAL:
load r20,debugMenuValues
lbz r21,0(r20)
lwz r20, 8(r20)

mulli r21,r21,0x20
add r20,r20,r21
lwz r20,8(r20)
lwz r20,0(r20)



load r22,0x474f0000
cmpw r20, r22
bne CHECKB
li r17,0x6969
cmpwi r3,1
b END

CHECKB:
cmpwi r3, 0
END:
