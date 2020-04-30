#To be inserted at 802FCCE8
loc_0x0:
  lis r3, 0x8003
  ori r3, r3, 0x556C
  mtlr r3
  lbz r3, 0(r31)
  blrl 
  rlwinm r0, r3, 0, 24, 31
  cmplwi r0, 120
  beq- loc_0x8C
  lis r3, 0x8045
  ori r3, r3, 0xD84F
  mulli r0, r0, 0x1A4
  add r3, r3, r0
  li r4, 0x0

loc_0x34:
  lbzu r0, 1(r3)
  cmpwi r0, 0x0
  beq- loc_0x54
  addi r4, r4, 0x1
  cmpwi r0, 0x80
  blt- loc_0x34
  lbzu r0, 1(r3)
  b loc_0x34

loc_0x54:
  cmpwi r4, 0x5
  blt- loc_0x8C
  lis r3, 0x4080
  stw r3, -16(r1)
  lfs f17, -16(r1)
  lis r18, 0x4330
  lfd f16, -29608(r2)
  stw r18, -20(r1)
  stw r4, -16(r1)
  lfd f15, -20(r1)
  fsubs f15, f15, f16
  fdivs f15, f15, f17
  lwz r3, 16(r30)
  stfs f15, 44(r3)

loc_0x8C:
  lwz r3, 16(r30)
