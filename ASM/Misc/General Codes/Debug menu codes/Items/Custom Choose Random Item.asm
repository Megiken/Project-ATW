#To be inserted at 8026c888

.include "Common/common.s"

backup
loadwz r20,customItemFlag
compareieq r20,1,LOL
li r3,1000
branchl r12,randomI
load r20,itemRates-4
li r22,10
branchl r12,Int2Float
li r4,0
li r5,6
li r0,29
mtctr r0
LOOP:
lfsu f9,4(r20)
fmul f9,f9,f8
branchl r12,Float2Int
add r4,r4,r23
cmpw r3,r4
blt FOUND
addi r5,r5,1
bdnz LOOP
li r5,0x2a
lfsu f9,4(r20)
fmul f9,f9,f8
branchl r12,Float2Int
add r4,r4,r23
cmpw r3,r4
blt FOUND
li r5,1
li r0,5
mtctr r0
LOOP2:
lfsu f9,4(r20)
fmul f9,f9,f8
branchl r12,Float2Int
add r4,r4,r23
cmpw r3,r4
blt FOUND
addi r5,r5,1
bdnz LOOP2
li r5,0
FOUND:
mr r3,r5
LOL:
restore
blr
