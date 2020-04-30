#To be inserted at 8032C8f0

.include "Common/common.s"

#input r17 = port number
#output r25 = struct
#output r14 = 1 or 2

backup

branchl r12,IMgetFirst
mflr r20
lbz r21,3(r20)
cmpw r21,r17
bne SECOND
branchl r12,IMgetFirstBans
mflr r25
li r14,1
b END
SECOND:
branchl r12,IMgetSecond
mflr r20
lbz r21,3(r20)
cmpw r21,r17
bne FAIL
branchl r12,IMgetSecondBans
mflr r25
li r14,2
b END
FAIL:
li r14,-1
END:
mr r15,r25
restore
mr r25,r15
blr
