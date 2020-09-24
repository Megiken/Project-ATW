#To be inserted at 8016DDCC

.include "Common/memcard.s"
backupallnor0
load r15,timerVar
lwz r15,0(r15)
cmpwi r15,0
beq CUSTOM
load r15,customTimer
lwz r0,0(r15)
b STORE



CUSTOM:
branchl r12,getATWTimer
mr r0,r3
STORE:
restoreallnor0
  stw r0, 40(r31)
