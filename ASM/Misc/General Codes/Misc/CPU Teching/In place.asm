#To be inserted at 80098754

.include "Common/common.s"

backupall
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r4,8(r3)
compareine r4,1,END
li r3,100
branchl r12,randomI
compareilt r3,50,NOTECH
lis	r3,0x8009
ori	r3,r3,0x87a4	# execute tech in place
mtctr	r3
b GOBACK
NOTECH:
lis	r3,0x8009
ori	r3,r3,0x87b4	# do not tech in place
mtctr	r3
GOBACK:
restoreall
bctr
END:
restoreall
lbz	r3,0x680(r31)
