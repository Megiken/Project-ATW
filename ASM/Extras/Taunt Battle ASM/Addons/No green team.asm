#To be inserted at 80261be0

cmpwi r4,1
bne END
li r4,2
END:
stb r4,0xa(r25)
