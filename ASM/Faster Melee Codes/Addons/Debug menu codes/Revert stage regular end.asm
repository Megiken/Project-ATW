#To be inserted at 801a5c14

.include "Common/common.s"

lwz r20,tempStageAdr(rtoc)
lwz r21,tempBackupAscii(rtoc)
stw r21,0(r20)
li r22,0
stw r22,tempStageAdr(rtoc)
stw r22,tempBackupAscii(rtoc)
mr	r3, r27
