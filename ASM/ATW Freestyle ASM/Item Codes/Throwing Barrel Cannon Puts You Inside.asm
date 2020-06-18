#To be inserted at 802969C0
mr r3, r30
  stw r24, 3328(r31)
  lis r12, 0x8029
  ori r12, r12, 0x5ED4
  mtctr r12
  bctrl 
  mr r3, r24
  mr r4, r30
  lis r12, 0x800C
  ori r12, r12, 0x9078
  mtctr r12
  bctrl 
  lwz r0, 36(r1)