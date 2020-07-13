#To be inserted at 80046f54

.include "Common/common.s"
backup
lwz r20,0(r26)
lwz r18,0x2c(r20)

lfs f6,0xb0(r18)
lfs f7,0xb4(r18)
li r22,80
branchl r12,Int2Float
fmr f9,f8
fcmpo 0,f6,f9
bgt NOTIN
fcmpo 0,f7,f8
bgt NOTIN
li r22,25
branchl r12,Int2Float
fneg f8,f8
fneg f9,f9
fcmpo 0,f6,f9
blt NOTIN
fcmpo 0,f7,f8
blt NOTIN


lwz r20,0x10(r18)
cmpwi r20,0x23
blt END
cmpwi r20,0x25
ble GO
cmpwi r20,0x15f
bgt FALLING
cmpwi r20,0xec
bne END
lfs f1,0x3e8(r18)
li r22,35
branchl r12,Int2Float
fcmpo 0,f1,f8
blt END
b GO
FALLING:
rlwinm.	r0, r27, 0, 29, 29
beq END
lwz r20,0x914(r18)
cmpwi r20,0
bne END
lfs f1,0x84(r18)
lfs f2,rtocnegone(rtoc)
fcmpo 0,f2,f1
blt END
lwz r20,4(r18)
cmpwi r20,YoshiinID
beq END
cmpwi r20,JigglypuffinID
beq END
cmpwi r20,FoxinID
beq FOX
cmpwi r20,SheikinID
beq SHEIK
cmpwi r20,MewtwoinID
beq MEWTWO
cmpwi r20,ZeldainID
beq ZELDA
cmpwi r20,PichuinID
beq PICHU
b GO
FOX:
lwz r20,0x10(r18)
cmpwi r20,0x160
beq GO
cmpwi r20,0x166
bne END
b GO
SHEIK:
lwz r20,0x10(r18)
cmpwi r20,0x168
bne END
b GO
MEWTWO:
lwz r20,0x10(r18)
cmpwi r20,0x166
bne END
b GO
ZELDA:
lwz r20,0x10(r18)
cmpwi r20,0x162
bne END
b GO
PICHU:
lwz r20,0x10(r18)
cmpwi r20,0x166
bne END
b GO
GO:
lwz r3,0(r18)
branchl r12,0x800cc730
END:
NOTIN:
restore
mr r3,r22
