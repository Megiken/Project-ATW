#To be inserted at 800998a4
lwz r3, 28(r1)
addi r3, r3, 0x8
lwz r31, 20(r1)
addi r1, r1, 0x18
mtlr r3
blr
