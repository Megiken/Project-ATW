#To be inserted at 8009F15C

bl loc_0x4C
mflr r12
lwz r0, 0(r12)
mtcrf 0x01, r0
lfs f12, 4(r12)
lfs f11, 6224(r5)
fcmpo cr0, f2, f12
lfs f10, 8(r12)
lfs f9, 12(r12)
fcmpo cr1, f11, f10
crand 31, 0, 31
fmuls f9, f9, f11
crand 30, 4, 30
cror 0, 31, 30
ble+ cr7, loc_0x40
crand 0, 31, 30

loc_0x40:
bge+ loc_0x60
stfs f9, 6224(r5)
b loc_0x60

loc_0x4C:
blrl
.long 2
.float 7
.float 60
.float 1

loc_0x60:
