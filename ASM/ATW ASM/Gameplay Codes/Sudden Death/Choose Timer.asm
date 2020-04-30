#To be inserted at 801C0EB0

.include "Common/common.s"

load r20,0x8049e6c8
lwz r20,0x88(r20)
cmpwi r20,0x7
beq GO
cmpwi r3,0
b END
GO:
cmpwi r3,600
END:
