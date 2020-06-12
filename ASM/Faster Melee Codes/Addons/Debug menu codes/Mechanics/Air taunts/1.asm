#To be inserted at 800DECDC

.include "Common/common.s"

load r14,airGrabs
lwz r14,0(r14)
cmpwi r14,0
bne END

lwz r14, 224(r31)
cmpwi r14, 0x0
beq- END
lis r14, 0x800C
ori r14, r14, 0xC700
stw r14, 8616(r31)
lis r14, 0x8008
ori r14, r14, 0xD5B4
stw r14, 8612(r31)
lis r14, 0x800C
ori r14, r14, 0xCAAC
stw r14, 8604(r31)
lis r14, 0x8008
ori r14, r14, 0xD010
stw r14, 8608(r31)

END:
lwz r0, 36(r1)
