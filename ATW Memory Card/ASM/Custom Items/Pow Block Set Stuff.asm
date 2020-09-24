#To be inserted at 802953F8
  mflr r22
  li r3, 0x0
  stw r3, 1556(r5)
  stw r3, 3532(r5)
  stw r3, 3364(r5)
  lwz r3, 184(r5)
  addi r3, r3, 0x10
  li r4, 0x24
  lis r12, 0x8000
  ori r12, r12, 0xC160
  mtctr r12
  bctrl 
  mtlr r22
  blr