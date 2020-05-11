#To be inserted at 8032C910

.include "Common/common.s"

cmpwi r3,1
bne END
lwz r20,gameID(rtoc)
cmpwi r20,0
beq END
mflr	r0
stw	r0, 0x0004 (sp)
stwu	sp, -0x0008 (sp)
li r3,1
branchl r12,0x80024030
li r3,2
branchl r12,0x801a42f8
branchl r12,0x801a4b60

li r20,0
LOOP:
mr r3,r20
branchl r12,removePlayerFromCSS
addi r20,r20,1
cmpwi r20,4
bne LOOP

li r3,0
lwz r0,0xc(sp)
addi sp,sp,8
mtlr r0
END:
blr
