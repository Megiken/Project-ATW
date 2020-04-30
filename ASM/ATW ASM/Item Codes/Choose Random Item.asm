#To be inserted at 8026C75C

.include "Common/common.s"

lis r15,0x8046
lwz r15,-0x3c84(r15)
lis r16,0xfffb
ori r16,r16,0xffff
cmpw r16,r15
bne END
backup

li r3,1000
branchl r12,0x80380580
mr r4,r3


li r3,0x12
cmpwi r4,16
blt FINISH
li r3,0x20
cmpwi r4,31
blt FINISH
li r3,0x1c
cmpwi r4,47
blt FINISH
li r3,0x21
cmpwi r4,63
blt FINISH
li r3,0x8
cmpwi r4,78
blt FINISH
li r3,0xa
cmpwi r4,94
blt FINISH
li r3,0xf
cmpwi r4,110
blt FINISH
li r3,0x1e
cmpwi r4,125
blt FINISH
li r3,0x12
cmpwi r4,141
blt FINISH




li r3,0x1a
cmpwi r4,165
blt FINISH
li r3,0x1b
cmpwi r4,188
blt FINISH



li r3,0x0e
cmpwi r4,227
blt FINISH
li r3,0x22
cmpwi r4,266
blt FINISH
li r3,0x0
cmpwi r4,305
blt FINISH
li r3,0x02
cmpwi r4,344
blt FINISH


li r3,0x01
cmpwi r4,375
blt FINISH
li r3,0x03
cmpwi r4,406
blt FINISH
li r3,0x04
cmpwi r4,438
blt FINISH
li r3,0x05
cmpwi r4,469
blt FINISH
li r3,0x07
cmpwi r4,500
blt FINISH
li r3,0x14
cmpwi r4,531
blt FINISH
li r3,0x1f
cmpwi r4,562
blt FINISH
li r3,0x11
cmpwi r4,593
blt FINISH
li r3,0xd
cmpwi r4,624
blt FINISH
li r3,0x17
cmpwi r4,656
blt FINISH
li r3,0x18
cmpwi r4,687
blt FINISH
li r3,0x6
cmpwi r4,718
blt FINISH
li r3,0x1d
cmpwi r4,750
blt FINISH
li r3,0x13
cmpwi r4,781
blt FINISH
li r3,0x16
cmpwi r4,812
blt FINISH
li r3,0x10
cmpwi r4,843
blt FINISH
li r3,0x0c
cmpwi r4,874
blt FINISH
li r3,0xb
cmpwi r4,906
blt FINISH
li r3,0x19
cmpwi r4,937
blt FINISH
li r3,0x15
cmpwi r4,968
blt FINISH
li r3,0x2a




FINISH:
restore
blr

END:
mflr r0
