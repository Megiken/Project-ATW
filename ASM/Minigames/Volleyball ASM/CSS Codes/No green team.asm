#To be inserted at 80261be0

cmpwi r4,2
bne END 
li r4,0
END:
stb r4,0xa(r25)
