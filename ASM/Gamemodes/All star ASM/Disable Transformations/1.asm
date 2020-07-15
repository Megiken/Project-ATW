#To be inserted at 80096728
lwz	r15,4(r31)	# load internal char ID
cmpwi	r15,0x13		# if Zelda
beq-	NO_TRANS_BRANCH
cmpwi	r15,0x7		# if Sheik
bne-	END

NO_TRANS_BRANCH:
lis	r3,0x8009
ori	r3,r3,0x68b0	# end of function
mtctr	r3
li	r3,0		# 0 function return bool
bctr

END:
addi	r3,r30,0