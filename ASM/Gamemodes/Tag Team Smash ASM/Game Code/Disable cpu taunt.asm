#To be inserted at 800de9d8

lwz	r4,0x2c(r3)	# load internal char offset
lwz	r6,0x1a94(r4)	# load CPU type
cmpwi	r6,5	# if Manual, skip
beq-	TAUNT

NO_TAUNT:
li r3,0
blr
TAUNT:
mflr r0
