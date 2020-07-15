#To be inserted at 80260280

.include "Common/common.s"

backup

load r20,playerCSSdata1
mulli r21,r27,0x24
add r20,r20,r21
lbz r22,1(r20)
load r20,playerCSSdata2
mulli r21,r27,0x24
add r20,r20,r21
stb r22,3(r20)

restore

branchl r12,CSS_UpdateCSPInfo
