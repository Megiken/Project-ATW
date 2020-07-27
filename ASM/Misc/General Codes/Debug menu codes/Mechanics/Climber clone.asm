#To be inserted at 80031bcc

.include "Common/common.s"

stw r3,0xb0(r30)
load r14,climberCloneFlag
lwz r14,0(r14)
cmpwi r14,0
bne END

lwz	r3,0x2c(r3)	# load internal offset
lwz	r4,4(r3)	# load internal char ID
cmpwi	r4,0x7	# Sheik
beq-	END
cmpwi	r4,0xa	# Popo
beq-	END
cmpwi	r4,0xb	# Nana
beq-	END
cmpwi	r4,0x13	# Zelda
beq-	END

li	r4,1
lbz	r0,0xac(r30)	# load multispawn flag
rlwimi	r0,r4,5,26,26	# turn on (00000020)
stb	r0,0xac(r30)
li	r0,2
stb	r0,0x46(r30)	# store sub color (dark)
li r0,6
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
blrl
stw r3,0xB4(r30)
lwz	r3,0x2c(r3)
li	r4,6
stw	r4,0x1a94(r3)


END:
