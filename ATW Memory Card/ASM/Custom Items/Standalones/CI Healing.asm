#To be inserted at 8032c884

.include "Common/memcard.s"

backupall

lbzx r19,r15,r16
cmpwi r19,0xf0
blt TIME
mr r3,r16
branchl r12,getPlayerData
load r19,0x9000ff50
stw r19,0x4b4(r3)
li r19,0x80
stb r19,0x504(r3)

TIME:
addi r15,r15,4
mulli r18,r16,2
lhzx r19,r15,r18
cmpwi r19,0
beq REMOVEFLAG
addi r18,r18,1
lbzx r19,r18,r15
cmpwi r19,0
beq GO

subi r19,r19,1
stbx r19,r18,r15
b END

REMOVEFLAG:
mr r3,r16
branchl r12,getPlayerData
li r19,0x11
stb r19,0x504(r3)
subi r15,r15,4
lbzx r24,r16,r15
li r18,0
stbx r18,r15,r16
addi r15,r15,4
b THERE

GO:

li r19,60
stbx r19,r18,r15
subi r18,r18,1
lbzx r19,r18,r15
subi r19,r19,1
stbx r19,r18,r15


subi r15,r15,4
lbzx r24,r16,r15
THERE:
mr r20,r24
branchl r12,absoluteValueByte
mr r23,r21
mr r22,r21
branchl r12,Int2Float


mr r3,r16
branchl r12,getPlayerData
lfs f2,0x1830(r3)
cmpwi r24,0xf0
bgt ADDlol
fsub f2,f2,f8
b STORE
ADDlol:
fadd f2,f2,f8

STORE:
lfs f0,-30604(r2)
fcmpo 0,f2,f0
blt END
stfs f2,0x1830(r3)




mr r3,r16
branchl r12,getPlayerStatic
lhz r4,0x60(r3)
cmpwi r24,0xf0
bgt ADD
sub r4,r4,r23
sth r4,0x60(r3)
b END
ADD:
add r4,r4,r23
sth r4,0x60(r3)



END:
restoreall
blr
