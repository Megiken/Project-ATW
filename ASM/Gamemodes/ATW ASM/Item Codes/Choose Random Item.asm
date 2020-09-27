#To be inserted at 8026C75C

.include "Common/common.s"

backup

REDO:
li r3,1000
branchl r12,0x80380580
mr r4,r3


li r3,yoshiEgg
cmpwi r4,41
blt FINISH
li r3,Flipper
cmpwi r4,82
blt FINISH
li r3,Freezie
cmpwi r4,124
blt FINISH

li r3,Pokeball
cmpwi r4,165
blt FINISH
li r3,Greenshell
cmpwi r4,206
blt FINISH
li r3,Capsule
cmpwi r4,248
blt FINISH

li r3,Barrel
cmpwi r4,289
blt FINISH
li r3,Crate
cmpwi r4,330
blt FINISH
li r3,Starrod
cmpwi r4,372
blt FINISH

li r3,Beamsword
cmpwi r4,413
blt FINISH
li r3,Lipstick
cmpwi r4,454
blt FINISH
li r3,Fan
cmpwi r4,496
blt FINISH

li r3,MrSaturn
cmpwi r4,537
blt FINISH
li r3,Bobomb
cmpwi r4,578
blt FINISH
li r3,Motionmine
cmpwi r4,620
blt FINISH

li r3,Superscope
cmpwi r4,641
blt FINISH
li r3,Raygun
cmpwi r4,662
blt FINISH
li r3,Homerunbat
cmpwi r4,684
blt FINISH

li r3,Egg
cmpwi r4,705
blt FINISH
li r3,Barrelcannon
cmpwi r4,726
blt FINISH
li r3,Screwattack
cmpwi r4,748
blt TEST

li r3,MetalBox
cmpwi r4,769
blt FINISH
li r3,Redshell
cmpwi r4,790
blt FINISH
li r3,Warpstar
cmpwi r4,812
blt FINISH

li r3,Bunnyhood
cmpwi r4,833
blt FINISH
li r3,Parasol
cmpwi r4,854
blt FINISH
li r3,Partyball
cmpwi r4,876
blt FINISH

li r3,Fireflower
cmpwi r4,897
blt FINISH
li r3,Supermushroom
cmpwi r4,918
blt FINISH
li r3,Poisonmushroom
cmpwi r4,940
blt FINISH

li r3,Heart
cmpwi r4,950
blt FINISH
li r3,Hammer
cmpwi r4,960
blt FINISH
li r3,CloakingDevice
cmpwi r4,970
blt FINISH
li r3,Starman
cmpwi r4,980
blt FINISH
li r3,Food
b FINISH
TEST:
mr r20,r3
branchl r12,countPlayersInMatch
compareile r3,2,REDO
mr r3,r20



FINISH:
restore
blr
