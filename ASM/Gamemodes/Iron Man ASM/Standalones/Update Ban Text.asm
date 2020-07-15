#To be inserted at 8032C8f8

.include "Common/common.s"

#input r15 = struct
#input r20 = 0 for ban 1 for pick
backup
lbz r21,3(r15)
mulli r22,r21,0x4 #get offset
subi r23,r13,UCFTextPointers #get pointers
lwzx r3,r22,r23 #get players pointer


#Get Text Associated With Toggle Status

cmpwi r20,0
beq BANNED
bl PICKTEXT

b STORE
BANNED:
bl BANTEXT

STORE:

mflr r5

#Update Text
li  r4,0x0    #Subtext ID 1
branchl r12,0x803a70a0

b exit

PICKTEXT:
blrl
.string "Picking"
.align 2

BANTEXT:
blrl
.string "Banning"
.align 2


exit:
restore
blr
