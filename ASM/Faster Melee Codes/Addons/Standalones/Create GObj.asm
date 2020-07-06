#To be inserted at 8032C958

.include "Common/common.s"

#input r3 = function
#input r4 = mem amount

#output r3 = gobj
#output r4 = mem

backup

mr r20,r3
mr r21,r4

li  r3,22
li  r4,23
li  r5,0
branchl r12,0x803901f0
mr  r24,r3

#Alloc Mem
cmpwi r21,0
beq NOMEM
  mr r3,r21
  branchl r12,0x8037f1e4
  mr  r25,r3

#Zero Data
  mr  r3,r25
  mr r4,r21
  branchl r12,zeromem

#Attach Data
  mr  r3,r24
  li  r4,14
  load r5,0x8037f1b0
  mr  r6,r25
  branchl r12,0x80390b68
NOMEM:
#Attach Process
  mr  r3,r24
  mr r4,r20
  li  r5,23
  branchl r12,0x8038fd54
mr r3,r24
mr r4,r25
restore
blr
