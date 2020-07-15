#To be inserted at 8006CA9C

.include "Common/common.s"

lwz r20,0x10(r31)
cmpwi r20,0xc7
beq INPLACE
cmpwi r20,0xc8
beq FORWARD
cmpwi r20,0xc9
beq BACKWARDS
b END
INPLACE:
lis r12,0x800c
ori r12,r12,0x0200
mtlr r12
mr r3,r31
blrl
lis r20,0xff00
ori r20,r20,0x00ff
stw r20,0x4b4(r31)
li r20,0x91
stb r20,0x504(r31)
b END
FORWARD:
lis r12,0x800c
ori r12,r12,0x0200
mtlr r12
mr r3,r31
blrl
lis r20,0xff
ori r20,r20,0x00ff
stw r20,0x4b4(r31)
li r20,0x91
stb r20,0x504(r31)
b END
BACKWARDS:
lis r12,0x800c
ori r12,r12,0x0200
mtlr r12
mr r3,r31
blrl
lis r20,0
ori r20,r20,0xffff
stw r20,0x4b4(r31)
li r20,0x91
stb r20,0x504(r31)
b END
END:
lbz	r0, 0x221E (r31)
