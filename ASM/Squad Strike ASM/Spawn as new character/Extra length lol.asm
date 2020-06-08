#To be inserted at 80017be4

.include "Common/common.s"

lhz r20,0x6(r26)
cmpwi r20,0x200
ble END
load r3,2182400
END:
stw r3,0xc(r26)
