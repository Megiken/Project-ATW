#To be inserted at 800D1E80

.include "Common/memcard.s"

backup

lwz r20,0x2c(r3)
lbz r20,0xc(r20)


restore


  lis r12, 0x800C
  ori r12, r12, 0x318C
  mtctr r12
  bctr
