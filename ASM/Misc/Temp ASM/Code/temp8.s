#To be inserted at 80263250

.include "Common/common.s"

backupall
lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END

rlwinm. r0, r7, 0, 26, 26
bne RPRESSED
rlwinm.	r0, r7, 0, 25, 25
bne LPRESSED
b END

RPRESSED:
li r18,0x0020
li r19,0x72
b THING


LPRESSED:
li r18,0x0040
li r19,0x6c

THING:
branchl r12,checkData
compareieq r17,-1,END
load r20,playerCSSdata2
mulli r21,r17,0x24
lbzx r22,r21,r20
compareige r22,0x1a,END
addi r21,r21,1
lbzx r23,r21,r20
addi r21,r21,2
lbzx r15,r21,r20
compareine r23,0,END
load r20,0x803c1f40+4
load r21,0x803bcde0
mulli r23,r22,3
lbzx r24,r23,r21
addi r23,r23,1
lbzx r25,r23,r21
compareige r24,0x1b,END
mulli r26,r24,8
lwzx r20,r20,r26
mr r27,r20
LOOP:
lbzu r26,1(r27)
compareine r26,0x2e,LOOP
compareieq r15,0,FOUND
subi r15,r15,1
b LOOP

FOUND:
compareine r24,0,FALSE
compareine r25,4,FALSE
li r16,-1
b TRUE
FALSE:
li r16,1
TRUE:
lbzx r14,r16,r27
compareeq r14,r19,GETD
stbx r19,r16,r27


b SFXPLAYF
GETD:
li r19,0x64
stbx r19,r16,r27


END:
restoreall
lbz r0, -18862(r13)
