#To be inserted at 8016D1C0

.include "Common/memcard.s"
mr r20,r3
branchl r12,countPlayersInMatch
cmpwi r3,1
bgt NO
mr r3,r20
branchl r12,0x801a36a0
b THERE
NO:
li r3,0
li r4,0
THERE:
