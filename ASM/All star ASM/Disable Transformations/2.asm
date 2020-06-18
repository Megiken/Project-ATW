#To be inserted at 800D68D8
lwz	r15,4(r5)	# load internal char ID
cmpwi	r15,0x13		# if Zelda
beq-	NO_TRANS_BRANCH
cmpwi	r15,0x7		# if Sheik
bne-	END

NO_TRANS_BRANCH:

lis	r3,0x800d
ori	r3,r3,0x6918	# end of function
mtctr	r3
li	r3,0		# 0 function return bool
bctr

END:
lwz r4,4(r5)