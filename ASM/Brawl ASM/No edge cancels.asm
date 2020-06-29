#To be inserted at 800843dc

.include "Common/common.s"

lwz r20,0x10(r4)
cmpwi r20,0x46
blt END
cmpwi r20,0x4a
bgt END
branchl r12,0x80084104
b LOL
END:
branchl r12,0x800cc730
LOL:
