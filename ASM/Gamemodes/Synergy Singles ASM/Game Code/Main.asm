#To be inserted at 80377598

.include "Common/common.s"

lfs f29, -5168(r2)
#copy p2 to p1
lhz r3, 0(r25)
andi. r3, r3, 0x104F
lhz r4, 12(r25)
andi. r4, r4, 0xFFB0
or r3, r3, r4
sth r3, 0(r25)
lhz r3, 16(r25)
sth r3, 4(r25)
lbz r3, 19(r25)
stb r3, 7(r25)

li r3, 0x0
li r4, 0xFFFF
stw r3, 12(r25)
stw r3, 16(r25)
stw r3, 20(r25)
stb r4, 22(r25)

lhz r3, 24(r25)
andi. r3, r3, 0x104F
lhz r4, 36(r25)
andi. r4, r4, 0xFFB0
or r3, r3, r4
sth r3, 24(r25)
lhz r3, 40(r25)
sth r3, 28(r25)
lbz r3, 43(r25)
stb r3, 31(r25)

li r3, 0x0
li r4, 0xFFFF
stw r3, 36(r25)
stw r3, 40(r25)
stw r3, 44(r25)
stb r4, 46(r25)
