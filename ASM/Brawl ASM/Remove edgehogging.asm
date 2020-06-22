#To be inserted at 8009AD64

li r0, 0x0
lbz r3, 8733(r31)
rlwimi r3, r0, 0, 31, 31
stb r3, 8733(r31)
lwz r0, 9024(r31)
