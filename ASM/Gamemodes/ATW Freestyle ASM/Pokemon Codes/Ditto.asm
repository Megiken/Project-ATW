#To be inserted at 802D3054
  lis r20, 0x8046
  ori r20, r20, 0xB6C8
  li r21, 0x6
  stw r21, 0(r20)
  lwz r0, 28(r1)