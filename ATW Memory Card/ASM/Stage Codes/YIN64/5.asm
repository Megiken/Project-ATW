#To be inserted at 8020e814

.include "Common/memcard.s"

load r20,0x8049E6C8
load r21,0x43140000
stw r21,0x4(r20)
load r21,0xc3140000
stw r21,0(r20)
load r21,0x43550000
stw r21,0x78(r20)
load r21,0xc3550000
stw r21,0x74(r20)
lwz	r0, 0x000C (sp)
