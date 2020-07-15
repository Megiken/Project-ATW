#To be inserted at 8032c878

.include "Common/common.s"

#input f9
#output r23

fctiwz f9,f9		# convert float to int
stfd f9,0x20(r2)
lwz r23,0x24(r2)	# load int

blr
