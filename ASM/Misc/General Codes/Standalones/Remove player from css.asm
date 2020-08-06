#To be inserted at 8032C900

#input r20 = port number


.include "Common/common.s"
backup
load r24,0x8045acb8
mulli r19,r20,0x24
load r21,0x803f0e08
add r21,r21,r19
li r22,3
stb r22,-0x1(r21)
stb r22,0(r21)
li r22,0x19
stb r22,2(r21)
stb r22,3(r21)
li r22,0
stb r22,1(r21)
load r21,playerCSSdata2
mulli r19,r20,0x24
li r22,0x1a03
sthx r22,r19,r21
sthx r22,r19,r24
mr r3,r20
branchl r12,CSS_UpdateCSPInfo
restore
blr
