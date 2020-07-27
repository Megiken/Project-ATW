#To be inserted at 801CC8AC

.include "Common/common.s"

load r20,FODflag
lwz r20,0(r20)
cmpwi r20,0
bne END
fmadds	f0,f0,f31,f0
b LOL
END:
fsub	f0,f0,f0
LOL:
