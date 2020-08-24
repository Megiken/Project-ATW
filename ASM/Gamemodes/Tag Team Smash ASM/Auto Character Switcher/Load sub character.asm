#To be inserted at 80031bcc

.include "Common/common.s"

stw	r3, 0x00B0 (r30)
lwz r4,0x2c(r3)
li	r3,5
stw	r3,0x1a94(r4)
lbz r3,0xc(r4)
branchl r12,getCorrectData
lbz r4,8(r3)
lbz r5,12(r3)
comparene r4,r5,NOTSAME
li	r0,2
stb	r0,0x46(r30)	# store sub color (dark)
NOTSAME:
mulli r4,r4,3
lis	r5, 0x803C
subi	r0, r5, 12832
add	r5, r0, r4
lbz	r4, 0 (r5)
stw r4,36(sp)

li	r4,1
lbz	r0,0xac(r30)	# load multispawn flag
rlwimi	r0,r4,5,26,26	# turn on (00000020)
stb	r0,0xac(r30)
li r0,5
stb r0,0x4a(r30)
lwz	r3,0xB0(r30)
lwz	r3,0x2c(r3)	# load internal offset
lbz	r0,0x2222(r3)
li	r4,1
rlwimi	r0,r4,2,29,29
stb	r0,0x2222(r3)	# store flag to make secondary disappear upon death


li r3,128	# was 128 for cpu (nana), 42 for human
stb r3,0x2A(sp)

lis	r3,0x8006
ori	r3,r3,0x8e98
mtlr	r3
addi r3,sp,36
li r18,0x6969
blrl
li r18,0
stw r3,0xB4(r30)
lwz	r3,0x2c(r3)
li	r4,6
stw	r4,0x1a94(r3)
