################################################################################
# Address: 802652ec
################################################################################
.include "Common/Common.s"

.set text,31
.set textProperties,30
backup

#GET PROPERTIES TABLE
  bl TEXTPROPERTIES
  mflr textProperties

#CREATE TEXT OBJECT, RETURN POINTER TO STRUCT IN r3
	li r3,0
	li r4,0
	branchl r12,0x803a6754

#BACKUP STRUCT POINTER
	mr text,r3

#####################
## Create UCF Text ##
#####################

	#convert player number into float (f1)
		mr    r22,r29
		branchl r12,Int2Float
    fmr r1,f8

	#Get Correct Y Offset
		lfs f2,0xC(textProperties) #distance between players
		fmuls f1,f1,f2  #multiply by player number
		lfs f2,0x0(textProperties) #X offset of text
		fadds f1,f1,f2  #add player offset to original offset
		lfs f2,0x4(textProperties) #Y offset of text

	#Create Text
		mr r3,text       #struct pointer
lbz r20,SynData(rtoc)
compareeq r20,r29,LEFT
lbz r20,SynData+2(rtoc)
comparene r20,r29,RIGHT
LEFT:
bl TEXT.LEFT
b STORELOL
RIGHT:
bl TEXT.RIGHT
STORELOL:
		mflr r4 #pointer to ASCII
		branchl r12,0x803a6b98

########################
## Create On/Off Text ##
########################

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

	#store pointers to r13 (start at 804d6700)
		subi r3,r13,UCFTextPointers
		mulli r4,r29,0x4
		stwx text,r3,r4

b end

#**************************************************#
TEXTPROPERTIES:
blrl
.float -510
.long 0x43EA0000 #y offset of "UCF" (464)
.long 0x3D3851EC #text scaling
.long 0x43AC8000 #distance between players (350)
.long 0xC3DC0000 #x offset of Toggle Status (-500)
.long 0x43FA0000 #y offset of Toggle Status (500)

TEXT.LEFT:
blrl
.string "Side: Left"
.align 2

TEXT.RIGHT:
blrl
.string "Side: Right"
.align 2




#**************************************************#
end:

restore
TRUEEND:
li	r3, 0
