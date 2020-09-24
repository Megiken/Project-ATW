#To be inserted at 8006CE98
  lwz r20, 16(r29)
  cmpwi r20, 0x133
  blt- loc_0x1C
  cmpwi r20, 0x139
  bgt- loc_0x1C
  li r3, -1
  b END

loc_0x1C:

li r3, 0x3E8
lwz r20,0x1974(r29)
cmpwi r20,0
beq END
lwz r20,0x2c(r20)
cmpwi r20,0
beq END
lwz r20,0x10(r20)
cmpwi r20,0x1e
bne END

li r3,-1

END:
  cmpwi r3, 0x1E