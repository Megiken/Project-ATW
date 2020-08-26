#To be inserted at 8025E0E8

subi r3, r13, 0x4FA0
mulli r4, r31, 0x4
lwzx r3, r3, r4
li r4, 0x1
stb r4, 77(r3)
li r3, 0xBA
