#To be inserted at 8027A4D4

.include "Common/common.s"

backup

li r3,1000
branchl r12,0x80380580
mr r4,r3


li r3,16
cmpwi r4,67
blt FINISH
li r3,10
cmpwi r4,134
blt FINISH
li r3,2
cmpwi r4,201
blt FINISH


li r3,8
cmpwi r4,250
blt FINISH
li r3,15
cmpwi r4,298
blt FINISH
li r3,3
cmpwi r4,346
blt FINISH
li r3,1
cmpwi r4,395
blt FINISH
li r3,26
cmpwi r4,444
blt FINISH
li r3,24
cmpwi r4,493
blt FINISH
li r3,29
cmpwi r4,542
blt FINISH
li r3,11
cmpwi r4,591
blt FINISH



li r3,12
cmpwi r4,633
blt FINISH
li r3,18
cmpwi r4,674
blt FINISH
li r3,17
cmpwi r4,716
blt FINISH
li r3,6
cmpwi r4,758
blt FINISH
li r3,13
cmpwi r4,800
blt FINISH
li r3,14
cmpwi r4,841
blt FINISH
li r3,7
cmpwi r4,883
blt FINISH


li r3,25
cmpwi r4,907
blt FINISH
li r3,28
cmpwi r4,932
blt FINISH
li r3,4
cmpwi r4,957
blt FINISH
li r3,9
cmpwi r4,990
blt FINISH


li r3,19
cmpwi r4,988
blt FINISH
li r3,23
cmpwi r4,994
blt FINISH
li r3,22








FINISH:
restore
blr
