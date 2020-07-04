#To be inserted at 8006CA9C

.include "Common/common.s"

backupall

lfs f6,0xb0(r31)
lfs f7,0xb4(r31)
li r22,80
branchl r12,Int2Float
fmr f9,f8
fcmpo 0,f6,f9
bgt NOTIN
fcmpo 0,f7,f8
bgt NOTIN
li r22,20
branchl r12,Int2Float
fneg f8,f8
fneg f9,f9
fcmpo 0,f6,f9
blt NOTIN
fcmpo 0,f7,f8
blt NOTIN
lwz r20,0x168(r31)
cmpwi r20,2
beq NORMAL
subi r20,r20,1
NORMAL:
subi r20,r20,1
stb r20,0x1968(r31)
lwz r20,0x10(r31)
cmpwi r20,0x23
blt END
cmpwi r20,0x25
bgt END
lwz r3,0(r31)
branchl r12,0x800cc730




NOTIN:
END:
restoreall
lbz	r0, 0x221E (r31)
