#To be inserted at 8032C848

#input r22
#output f8

lfd    f3,-0x8000(rtoc)    # 4d8570. loads magic double for int to float conversion
stfd    f3,0x20(r2)
sth    r22,0x26(r2)    # 0x43300000800000xx. put 1st int at end of magic double
lfd    f8,0x20(r2)
fsubs    f8,f8,f3    # subtract 0x4330000080000000 for converted int

blr
