#To be inserted at 80260700

.include "Common/common.s"

lbz r20,0x4(r31)
mulli r19,r20,0x44
load r21,0x804C1FAC
lwzx r22,r21,r19
cmpwi r22,0x0610
bne BACK
li r19,0
sth r19,0xa(r31)


branchl r12,removePlayerFromCSS

lbz r20,0x4(r31)
branchl r12,CSS_UpdateCSPInfo

branchl r12,getCharData
mflr r15
load r16,numOfChars
lwz r16,0(r16)
stbx r16,r15,r20


mr r3,r20
backupallnomflr
branchl r12,0x8025db34
restoreallnomtlr
li r20,0
sth r20,0xa(r31)
b END


BACK:
mulli r20,r20,0x24
load r21,0x803f0e08
add r20,r20,r21
lbz r20,0(r20)
cmpwi r20,3
beq END
stb	r0, -0x49AA (r13)

END:
