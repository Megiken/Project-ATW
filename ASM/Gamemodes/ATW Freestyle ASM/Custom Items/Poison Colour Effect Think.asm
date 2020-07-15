#To be inserted at 800BF8D0

.include "Common/common.s"

backupallnomflr


branchl r12,getItemVars
mflr r15
lbz r16,0xc(r27)
lbzx r19,r16,r15
cmpwi r19,0xf0
blt END
restoreallnomtlr
lis r0,0x9000
ori r0,r0,0xff50
b RETURN

END:
restoreallnomtlr
lwz r0,0x2c(r3)
RETURN:
