#To be inserted at 80056a14

.include "Common/common.s"

lfs	f1, 0 (r3)
load r20,stageData
lwz r20,0x88(r20)
compareine r20,FinalDestinationinID,END
loadfloat f1,r20,0x3EEB851F

END:
