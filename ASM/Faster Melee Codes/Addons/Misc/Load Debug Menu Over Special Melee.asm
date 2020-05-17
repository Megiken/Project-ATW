#To be inserted at 801b139c

.include "Common/common.s"

load r20,0x804a04f0
lbz r20,0(r20)
cmpwi r20,0xc
bne END


load r20,customGamemodeFlag
lwz r20,0(r20)
cmpwi r20,1
beq END

load r20,cssID
lbz r20,0(r20)
cmpwi r20,6
bge END


li r3,6


b LOL
END:
lbz r3,0(r3)
LOL:
