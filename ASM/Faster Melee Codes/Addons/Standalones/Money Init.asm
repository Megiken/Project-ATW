#To be inserted at 8032C8d0

.include "Common/common.s"

backup
li r20,1
li r21,6

branchl r12,goToCSS
cmpwi r14,0
beq END
li r17,2
stw r17,IMtype(rtoc)
branchl r12,IMinit

END:
restore
blr
