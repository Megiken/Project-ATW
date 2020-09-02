#To be inserted at 8032C998

.include "Common/common.s"

#r3 = unstaled damage
#r4 = base knockback
#r5 = knockback growth
#r6 = opponent current damage
#r7 = opponent weight
#f10 = staled damage

#f20 = knockback

backupall

convTofloat r6,f15
fadd f16,f15,f10
convToFloat r3,f11
fmul f20,f16,f11
loadfloat f11,r20,0x3D4CCCCD
fmul f20,f20,f11

loadfloat f11,r20,0x3DCCCCCD
fmul f21,f16,f11

fadd f20,f21,f20


loadfloat f15,r20,0x40000000
convToFloat r7,f16
loadfloat f17,r20,0x3C23D70A
loadfloat f18,r20,0x3f800000
fmul f14,f16,f17
fmul f21,f14,f15
fadd f14,f14,f18
fdiv f14,f21,f14
fsub f21,f15,f14

fmul f20,f20,f21
loadfloat f15,r20,0x3FB33333
fmul f20,f20,f15
loadfloat f15,r20,0x41900000
fadd f20,f20,f15

convToFloat r5,f16
loadfloat f15,r20,0x3C23D70A
fmul f15,f15,f16
fmul f20,f20,f15
convToFloat r4,f15
fadd f20,f20,f15





restoreall
blr
