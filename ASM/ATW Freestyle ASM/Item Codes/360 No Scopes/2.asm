#To be inserted at 800ce480

.include "Common/common.s"

mflr r0

lwz r20,0x2c(r3)
lbz r21,0x676(r20)
li r22,0x14
cmpw r21,r22
bge END
lfs f0,-0x741c(rtoc)
lfs f1,0x2c(r20)
fcmpu 0,f0,f1
bne NEXT
lbz r21,0x2228(r20)
rlwinm	r21, r21, 0, 31, 31
cmplwi r21,1
beq GO
NEXT:
lfs f0,-0x7418(rtoc)
fcmpu 0,f0,f1
bne END
lbz r21,0x2228(r20)
rlwinm.	r21, r21, 0, 31, 31
bne END
GO:
fneg f0,f1
stfs f0,0x2c(r20)
END:
