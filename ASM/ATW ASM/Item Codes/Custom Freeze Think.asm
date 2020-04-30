#To be inserted at 80090BCC
lwz r20,0x1838(r29)
cmpwi r20,0
beq CUSTOM
lwz r20,0x1868(r29)
lhz r21,0(r20)
cmpwi r21,6
bne NORMAL
lwz r20,0x2c(r20)
lwz r20,0x10(r20)
cmpwi r20,0x27
beq CUSTOM
cmpwi r20,0x23
bne NORMAL
CUSTOM:
li r22, 17
  lfd f3, -29808(r2)
  stfd f3, 32(r2)
  sth r22, 38(r2)
  lfd f1, 32(r2)
  fsubs f1, f1, f3
b END
NORMAL:
lfs f1,0x1838(r29)
END:
