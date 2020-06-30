#To be inserted at 80046e78

.include "Common/common.s"

lfs   f0, 0x14(r26)   # Y_prev, used by default (cannot grab ascending) case
lfs   f2, -0x6c4(r26)   # facing direction
lfs   f3, -0x5e3c(r2) # 0
fcmpo   cr0, f2, f3
bge   right_facing
left_facing:
right_facing:
li r11,0
write_flag:
sth   r11, 0x36(r26)   # overwrite ledge grab direction
subi r19,r26,0x6f0
lwz r20,0x10(r19)
cmpwi r20,0x162
blt done
grab_ascending:
lfs   f0, -0x6280(r2) # 1
fadds   f0, f1, f0   # so ledgegrab logic thinks character is descending

done:
li r20,0
stw r20,0x2204(r19)
lis   r0, 0x8004   # done like this so changing data section in gecko code
ori   r0, r0, 0x6e7c   # form doesn't require recalculating branches
mtlr   r0
blr
####
