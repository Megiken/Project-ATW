#To be inserted at 8028DC80

.include "Common/common.s"

lfs	f0, 0x0DD4 (r30)
lwz r20,0x10(r30)
cmpwi r20,0xf
bne END
lwz r20,0xdd4(r30)
lis r21,0x43f0
cmpw r21,r20
bne END
li r22,300
branchl r12,Int2Float
fmr f0,f8
END:
