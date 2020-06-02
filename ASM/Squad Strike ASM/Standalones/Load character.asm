#To be inserted at 8032C92c

.include "Common/common.s"

#input r3 = port
#input r4 = struct

backupall
mr r25,r3
mr r28,r4
branchl r12,getPlayerStatic
lwz r19,0x8c(r3)
mr r3,r25
branchl r12,getPlayerData
lwz r18,0x890(r3)
mr r3,r25
mr r4,r28
branchl r12,0x8016d8ac

li r17, 0x6969
mr r3,r25
branchl r12,getPlayerEntity
li r15, 0xFF
stb r15, 7(r3)
stb r15, 6(r3)
mr r16,r3

lwz r3,0x2c(r3)
li r4,0x235c
branchl r12,zeromem

mr r3,r25
branchl r12,0x80031ad0

mr r3,r25
branchl r12,getPlayerStatic
stw r19,0x8c(r3)
mr r3,r25
branchl r12,getPlayerData
stw r18,0x890(r3)
lbz r21, 8733(r3)
rlwimi r21, r21, 3, 28, 28
stb r21, 8733(r3)
restoreall
blr
