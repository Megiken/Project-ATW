#To be inserted at 8027A4D4

.include "Common/memcard.s"

backup

li r3,1000
branchl r12,0x80380580
mr r4,r3


li r3,MarillID
cmpwi r4,70
blt FINISH
li r3,WeezingID
cmpwi r4,140
blt FINISH
li r3,BellossomID
cmpwi r4,210
blt FINISH
li r3,ChikoritaID
cmpwi r4,280
blt FINISH
li r3,Porygon2ID
cmpwi r4,350
blt FINISH
li r3,StaryuID
cmpwi r4,420
blt FINISH
li r3,VenusaurID
cmpwi r4,490
blt FINISH
li r3,ScizorID
cmpwi r4,560
blt FINISH
li r3,SnorlaxID
cmpwi r4,630
blt FINISH
li r3,VoltorbID
cmpwi r4,700
blt FINISH
li r3,ArticunoID
cmpwi r4,750
blt FINISH
li r3,BlastoiseID
cmpwi r4,800
blt FINISH
li r3,UnownID
cmpwi r4,850
blt FINISH
li r3,ChanseyID
cmpwi r4,865
blt FINISH
li r3,WobuffetID
cmpwi r4,881
blt FINISH
li r3,EnteiID
cmpwi r4,896
blt FINISH
li r3,HoOhID
cmpwi r4,912
blt FINISH
li r3,LugiaID
cmpwi r4,927
blt FINISH
li r3,MoltresID
cmpwi r4,943
blt FINISH
li r3,RaikouID
cmpwi r4,958
blt FINISH
li r3,SuicuneID
cmpwi r4,977
blt FINISH
li r3,ZapdosID
cmpwi r4,990
blt FINISH
li r3,CelebiID
cmpwi r4,993
blt FINISH
li r3,MewID
cmpwi r4,996
blt FINISH
li r3,DittoID








FINISH:
restore
blr
