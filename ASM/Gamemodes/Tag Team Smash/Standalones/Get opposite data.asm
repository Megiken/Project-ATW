#To be inserted at 8032C930

.include "Common/common.s"

#input r3 = port
#output r3 = struct
#output r14 = 1 or 2

backup

branchl r12,IMgetFirst
mflr r20
li r14,1
lwz r22,0(r20)
lis r21,0x6969
add r21,r21,r3
cmpw r21,r22
bne YES
branchl r12,IMgetSecond
mflr r20
li r14,2
lwz r22,0(r20)
lis r21,0x6969
add r21,r21,r3
cmpw r21,r22
bne YES
li r3,-1
b END

YES:
mr r3,r20
END:
restore
blr
