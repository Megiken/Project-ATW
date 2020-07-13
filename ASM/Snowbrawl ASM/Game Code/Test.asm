#To be inserted at 80268b18

mflr r0
lwz r20,8(r3)
cmpwi r20,3
beq END
nop
END:
