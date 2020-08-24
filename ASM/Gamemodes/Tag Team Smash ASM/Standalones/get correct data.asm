#To be inserted at 8032C8bc

.include "Common/common.s"

#input r3 = port
#output r3 = struct
#output r14 = 1 or 2

backup

branchl r12,IMgetFirst
mflr r20
lhz r22,0(r20)
compareine r22,0x6969,NEXT
li r14,1
lbz r22,3(r20)
cmpw r3,r22
beq YES
NEXT:
branchl r12,IMgetSecond
mflr r20
lhz r22,0(r20)
compareine r22,0x6969,NO
li r14,2
lbz r22,3(r20)
cmpw r3,r22
beq YES
NO:
li r3,-1
b END

YES:
mr r3,r20
END:
restore
blr
