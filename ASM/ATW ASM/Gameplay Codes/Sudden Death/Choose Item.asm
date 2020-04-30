#To be inserted at 80294DCC

.include "Common/common.s"

load r20,0x8049e6c8
lwz r20,0x88(r20)
cmpwi r20,0x7
beq GO
li r0,6
b END
GO:
li r0,0xe
END:
