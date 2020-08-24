#To be inserted at 80377598

.include "Common/common.s"

lfs f29, -5168(r2)
backup
lbz r21,SynData(rtoc)
lbz r22,SynData+1(rtoc)
bl THING
lbz r21,SynData+2(rtoc)
lbz r22,SynData+3(rtoc)
bl THING
b END


THING:
mulli r21,r21,12
mulli r22,r22,12

lhzx r3,r21, r25
andi. r3, r3, 0x104f
lhzx r4,r22,r25
andi. r4, r4, 0xFFB0
or r3, r3, r4
sthx r3, r21,r25
addi r22,r22,4
addi r21,r21,4
lhzx r3,r22,r25
sthx r3,r21,r25
addi r22,r22,3
addi r21,r21,3
lhzx r3,r22,r25
sthx r3,r21,r25
subi r22,r22,7
li r3, 0x0
li r4, -1
addi r22,r22,1
lbzx r24,r22,r25
andi. r24,r24,0xf
subi r22,r22,1
stwx r3,r22,r25
addi r22,r22,1
stbx r24,r22,r25
addi r22,r22,3
stwx r3,r22,r25
addi r22,r22,4
stwx r3,r22,r25
addi r22,r22,2
stbx r4, r22,r25

blr
END:
restore
