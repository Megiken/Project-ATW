#To be inserted at 802D3B54
  lis r20, 0x8043
  lis r21, 0x14
  ori r21, r21, 0x9970
  stw r21, 10796(r20)
  lwz r0, 28(r1)