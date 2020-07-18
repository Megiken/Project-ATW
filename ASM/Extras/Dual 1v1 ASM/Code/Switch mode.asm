#To be inserted at 8016c094

sub r0,r29,r31      # subtract number of dead players from total number of players
cmpwi r0,3           # if 3 or more alive, ignore custom code
bge- DEFAULT
li r0,1
lis r14,0x8047
stb r0,-0x2497(r14)      # turn ingame FF to on at 8046db69

DEFAULT:
subi r0,r29,1      #default line
