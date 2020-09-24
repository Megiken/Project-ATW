#To be inserted at 8026074C

.include "Common/memcard.s"

li r22,26
branchl r12,Int2Float
fmr f9,f8
li r22,0
branchl r12,Int2Float
fsubs f9,f8,f9
stfs f9,0x10(r31)
