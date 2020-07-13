#To be inserted at 80263250

.include "Common/common.s"

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END


rlwinm. r0, r7, 0, 26, 26
bne RPRESSED
rlwinm.	r0, r7, 0, 25, 25
bne LPRESSED
rlwinm.	r0, r7, 0, 23, 23
bne APRESSED
rlwinm.	r0, r7, 0, 19, 19
bne STARTPRESSED
b END

STARTPRESSED:
li r18,0x1000
branchl r12,checkInput
load r16,0x803F0E08
mulli r15,r17,0x24
add r16,r16,r15
lbz r16,0(r16)
cmpwi r16,0
bne END
b REALEND

RPRESSED:
li r18,0x20
branchl r12,checkInput
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r20,0(r20)
cmpwi r20,0
bne END
backup
bl LOL
mflr r0
stw r0,4(sp)
stwu sp,-0x18(sp)
stw r31,0x14(sp)
branchl r12,0x80266cfc
LPRESSED:
li r18,0x40
branchl r12,checkInput
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r20,0(r20)
cmpwi r20,0
bne END
stb r17,-0x49a7(r13)
backup
bl LOL
mflr r0
stw r0,4(sp)
stwu sp,-0x18(sp)
stw r31,0x14(sp)
branchl r12,0x80266d2c
LOL:
blrl
restore
b END
APRESSED:
li r18,0x100
branchl r12,checkInput

load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r18,0(r20)
cmpwi r18,3
bne END
li r15,0x11
mr r3,r17
li r4,0
branchl r12,0x8025fb50
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
li r21,0
stb r21,0(r20)
stb r21,-0x1(r20)
stb r15,3(r20)
load r20,0x80480820
mulli r21,r17,0x24
add r20,r20,r21
li r21,0
stb r21,1(r20)
mr r3,r17
branchl r12,0x8025db34

#set attributes

load r20,ylDat
lwz r20,0(r20)
load r21,bombImpact
lwz r21,0(r21)
addi r22,r20,bombImpactOffset
stb r21,3(r22)

load r21,bombExplosion
lwz r21,0(r21)
addi r22,r20,bombExplosionOffset
stb r21,3(r22)

load r21,gravity
lwz r22,0(r21)
branchl r12,Int2Float
fmr f9,f8
li r22,100
branchl r12,Int2Float
fdiv f9,f9,f8
addi r22,r20,gravityOffset
stfs f9,0(r22)

load r21,terminalVelocity
lwz r22,0(r21)
branchl r12,Int2Float
fmr f9,f8
li r22,100
branchl r12,Int2Float
fdiv f9,f9,f8
addi r22,r20,terminalVelocityOffset
stfs f9,0(r22)






b END
END:
li r7,0
REALEND:
lbz r0, -18862(r13)
