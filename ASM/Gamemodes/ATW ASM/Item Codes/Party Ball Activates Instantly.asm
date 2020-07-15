#To be inserted at 80279A34
lwz r22,0x10(r30)
cmpwi r22,4
beq GO
lfs f0,0x5d0(r30)
b END
GO:
li r22, 0x7
  lfd f3, -0x8000(r2)
  stfd f3, 32(r2)
  sth r22, 38(r2)
  lfd f0, 32(r2)
  fsubs f0, f0, f3
END:
