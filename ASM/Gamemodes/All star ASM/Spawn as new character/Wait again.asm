#To be inserted at 800d3930

.include "Common/common.s"

lwz r0,AStimer(rtoc)
subi r0,r0,1
stw r0,AStimer(rtoc)
cmpwi r0,0
