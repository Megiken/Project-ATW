#To be inserted at 802699C4
lwz r0, 16(r31)
  cmpwi r0, 0x11
  bne- loc_0x10
  b loc_0x20

loc_0x10:
  lis r12, 0x8026
  ori r12, r12, 0xA8EC
  mtctr r12
  bctrl

loc_0x20:
