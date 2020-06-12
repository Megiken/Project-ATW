#To be inserted at 8009A8AC

.include "Common/common.s"

load r14,ledgeInvincibility
lwz r14,0(r14)
cmpwi r14,0
bne END

mr r7, r3
lwz r3, 44(r3)
lwz r4, 1180(r4)
lwz r5, 4200(r3)
mr r6, r5
addi r5, r5, 0x20
cmpwi r5, 0x140
ble+ loc_0x24
li r5, 0x140

loc_0x24:
stw r5, 4200(r3)
mullw r6, r6, r6
rlwinm r6, r6, 20, 12, 31
cmpw r6, r4
blt+ loc_0x40
li r4, 0x0
b loc_0x44

loc_0x40:
sub r4, r4, r6

loc_0x44:
mr r3, r7
b LOL
END:
lwz	r4, 0x049C (r4)
LOL:
