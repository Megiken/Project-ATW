#To be inserted at 8006CA9C

.include "Common/common.s"

backupallnomflr

lwz r16,4(r31)
cmpwi r16,0xb
beq END


branchl r12,getItemVars
mflr r15
branchl r12,getItemFunctions
mflr r14
lbz r16,0xc(r31)
li r17,0
LOOP:
lbzx r18,r16,r15
cmpwi r18,0
beq NEXTITEM

mulli r19,r17,4
lwzx r12,r19,r14
mtlr r12
blrl

NEXTITEM:


cmpwi r17,4 #Number of custom items -1
beq SWAPLOL
addi r17,r17,1
addi r15,r15,12
b LOOP
SWAPLOL:
load r20,doublesByte
lbz r20,0(r20)
cmpwi r20,1
bne END
load r20,percentSwapFlag
lwz r20,0(r20)
cmpwi r20,1
beq END
li r18,4
branchl r12,checkInput
lbz r18,0xc(r31)
cmpw r17,r18
bne END
lbz r20,0x61b(r31)
li r17,0
LOOP2:
mr r3,r17
branchl r12,getPlayerData
cmpwi r3,-1
beq END
lbz r21,0xc(r3)
cmpw r21,r18
beq NEXT2
lbz r22,0x61b(r3)
cmpw r22,r20
bne NEXT2
mr r26,r3
mr r3,r17
branchl r12,getPlayerStatic
mr r21,r3
mr r3,r18
branchl r12,getPlayerStatic
lbz r22,0x8e(r21)
cmpwi r22,0
beq END
lhz r22,0x60(r21)
lbz r23,0x8e(r3)
cmpwi r23,0
beq END
lhz r23,0x60(r3)
sth r23,0x60(r21)
sth r22,0x60(r3)
lwz r23,0x1830(r31)
lwz r24,0x1830(r26)
stw r24,0x1830(r31)
stw r23,0x1830(r26)
b END

NEXT2:
cmpwi r17,4
addi r17,r17,1
bne LOOP2


END:
restoreallnomtlr
lbz	r0, 0x221E (r31)
