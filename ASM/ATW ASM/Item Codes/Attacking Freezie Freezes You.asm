#To be inserted at 8028F42C
mflr r0
  stw r0, 4(r1)
  stwu r1, -256(r1)
  stmw r3, 8(r1)
  lwz r3, 3308(r31)
lhz r15,0(r3)
cmpwi r15,4
bne END
  lis r15, 0x4400
  lwz r16, 44(r3)
  stw r15, 6224(r16)
  lis r12, 0x8009
  ori r12, r12, 0xB60
  mtctr r12
  bctrl
END:
  lmw r3, 8(r1)
  lwz r0, 260(r1)
  addi r1, r1, 0x100
  mtlr r0
  li r3, 0x1
