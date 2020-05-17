#To be inserted at 8032C8cc

.include "Common/common.s"

backup
li r20,1
li r21,5
branchl r12,goToCSS
cmpwi r14,1
bne END
li r17,1
stw r17,IMtype(rtoc)
branchl r12,IMinit
END:
restore
blr
