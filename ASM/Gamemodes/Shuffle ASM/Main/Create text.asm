################################################################################
# Address: 802652f0
################################################################################
.include "Common/Common.s"

.set text,31
.set textProperties,30

cmpwi r29,1
bge TRUEEND
backup
bl TEXTPROPERTIES
mflr textProperties

#CREATE TEXT OBJECT, RETURN POINTER TO STRUCT IN r3
li r3,0
li r4,0
branchl r12,0x803a6754

#BACKUP STRUCT POINTER
mr text,r3
stw r3,IMmoneyTextStruct(rtoc)

#####################
## Create UCF Text ##
#####################


#Get Correct Y Offset
  lfs f2,0x0(textProperties) #X offset of text
  lfs f2,0x4(textProperties) #Y offset of text

#Create Text
bl TEXTLOL
b SQUADSTRIKE
b TAGTEAM
b SMASH64
b BRAWL
b DUELISTPRO
b KOTH
b SNOWBRAWL
b OITC
b IJZ
b CYOP
b MRSS
b VOLLEYBALL
b BASKETBALL
TEXTLOL:
mflr r20
lwz r22,shuffleID(rtoc)
mulli r21,r22,4
add r20,r21,r20
mtctr r20
bctr

SQUADSTRIKE:
bl STORE
.string "Squad Strike"
.align 2

TAGTEAM:
bl STORE
.string "Tag Team"
.align 2
SMASH64:
bl STORE
.string "Smash 64"
.align 2
BRAWL:
bl STORE
.string "Brawl"
.align 2
DUELISTPRO:
bl STORE
.string "Duelist Pro"
.align 2
KOTH:
bl STORE
.string "King of the Hill"
.align 2
SNOWBRAWL:
bl STORE
.string "Snowbrawl"
.align 2
OITC:
bl STORE
.string "One in the Chamber"
.align 2
IJZ:
bl STORE
.string "Infinite Jump Zone"
.align 2
CYOP:
bl STORE
.string "Create Your Own Platforms"
.align 2
MRSS:
bl STORE
.string "Mr Saturn Soccer"
.align 2
VOLLEYBALL:
bl STORE
.string "Volleyball"
.align 2
BASKETBALL:
bl STORE
.string "Basketball"
.align 2


STORE:
mflr r4

	branchl r12,0x803a6b98

  #SET TEXT SPACING TO TIGHT
    li r4,0x1
    stb r4,0x49(text)

  #SET TEXT TO CENTER AROUND X
    li r4,0x1
    stb r4,0x4A(text)


  #set size/scaling
    lfs   f1,0x8(textProperties) #get text scaling value from table
    stfs f1,0x24(text) #store text scale X
    stfs f1,0x28(text) #store text scale Y


    b END

TEXTPROPERTIES:
    blrl
    .float 2
    .float -415
    .long 0x3D851EBB

END:
    restore
TRUEEND:
    addi r4,r24,0
