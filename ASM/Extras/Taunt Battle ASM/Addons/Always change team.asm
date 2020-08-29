#To be inserted at 80261b94

.include "Common/common.s"

li r18,0x800
branchl r12,checkInput
mr r19,r17
mulli r21,r17,0x24
mulli r14,r17,36
add r25,r25,r14
mulli r14,r17,4
add r24,r24,r14
mulli r14,r17,4
add r23,r23,r14
mulli r14,r17,12
add r22,r22,r14

branch r12,0x80261bb8
