#To be inserted at 801A4B70

loc_0x0:
  lis r3, 0x8000
  lis r4, 0x3C
  lis r12, 0x8000
  ori r12, r12, 0x543C
  mtctr r12
  bctr 
