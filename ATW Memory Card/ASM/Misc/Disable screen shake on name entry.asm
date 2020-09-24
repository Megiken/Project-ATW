#To be inserted at 8022ba1c
.include "Common/common.s"
loadbz r20,0x80479D30
compareine r20,2,END
loadbz r20,0x804d6cf6
compareine r20,5,END
blr
END:
mflr r0
