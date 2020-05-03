#To be inserted at 801b1688

.include "Common/common.s"

lwz r20,tempStageAdr(rtoc)
cmpwi r20,0
beq END
lwz r21,tempBackupAscii(rtoc)
stw r21,0(r20)
li r22,0
stw r22,tempStageAdr(rtoc)
stw r22,tempBackupAscii(rtoc)
END:
mflr	r0
