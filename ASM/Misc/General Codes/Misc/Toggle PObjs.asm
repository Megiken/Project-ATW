#To be inserted at 8036e8d8

lhz r7, 0xC(r3)
andi. r0, r7, 0x0800
beq+ _return
  ori r7, r7, 0xC000
_return:
