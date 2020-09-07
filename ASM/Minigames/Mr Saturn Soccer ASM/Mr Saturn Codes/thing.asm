#To be inserted at 80277c0c

lwz r20,0x10(r31)
cmpwi r20,7
beq END
stw	r0, 0x0044 (r31)
END:
