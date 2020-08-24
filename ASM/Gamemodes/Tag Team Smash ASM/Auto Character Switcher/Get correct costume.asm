#To be inserted at 80068f4c

.include "Common/common.s"

compareine r18,0x6969,END
backupall
lbz r3,4(r29)
branchl r12,getCorrectData
lbz r4,11(r3)
stb r4,0x619(r30)
restoreall

END:
lbz	r4, 0x0619 (r30)
