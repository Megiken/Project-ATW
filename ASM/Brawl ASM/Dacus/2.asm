#To be inserted at 800CB5FC

lwz r0, 112(r3)
cmpwi r0, 0x32
blt- loc_0x24
bgt- loc_0x24
lfs f1, -8368(r2)
lfs f2, 1096(r3)
fcmpo cr0, f2, f1
ble- loc_0x24
blr

loc_0x24:
mflr r0
