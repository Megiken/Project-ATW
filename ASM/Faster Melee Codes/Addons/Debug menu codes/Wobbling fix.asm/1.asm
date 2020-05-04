#To be inserted at 800DA9DC

.include "Common/common.s"

load r20,wobblingFlag
lwz r20,0(r20)
cmpwi r20,1
beq END
li r3, 0x0
stb r3, 9040(r28)
li r3, -1
sth r3, 9042(r28)
mr r3, r26
b LOL
END:
lfs	f1, -0x6918 (rtoc)
LOL:
