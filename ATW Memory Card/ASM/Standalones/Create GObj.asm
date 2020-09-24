#To be inserted at 8032C958

.include "Common/common.s"

#input r3 = GObj Type
#input r4 = When to run? Sub type?
#input r5 = proc function
#input r6 = gx function
#input r7 = amount of mem

#output r3 = gobj
#output r4 = mem

backup

mr r20,r3
mr r21,r4
mr r22,r5
mr r23,r6
mr r24,r7

mr r3,r20
mr r4,r21
li r5,80
branchl r12,0x803901f0
mr  r25,r3

#Alloc Mem
cmpwi r24,0
beq NOMEM
  mr r3,r24
  branchl r12,0x8037f1e4
  mr  r26,r3

#Zero Data
  mr r4,r24
  branchl r12,zeromem

#Attach Data
  mr  r3,r25
  li  r4,3
  load r5,0x8037f1b0
  mr  r6,r26
  branchl r12,0x80390b68
NOMEM:
#Attach Process
cmpwi r22,0
beq NOPROC
  mr r3,r25
  mr r4,r22
  li r5,3
  branchl r12,0x8038fd54
NOPROC:
cmpwi r23,0
beq NOGX
mr r3,r25
mr r4,r23
li r5,7
li r6,1
branchl r12,0x8039069c
NOGX:
mr r3,r25
mr r4,r26
restore
blr
