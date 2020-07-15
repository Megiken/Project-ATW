#To be inserted at 802617CC

lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x1C
li r0, 0x1
b loc_0x20

loc_0x1C:
rlwinm r0, r0, 0, 31, 31

loc_0x20:
