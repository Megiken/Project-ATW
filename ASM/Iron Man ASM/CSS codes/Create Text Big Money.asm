################################################################################
# Address: 802652f0
################################################################################
.include "Common/Common.s"

.set text,31
.set textProperties,30
cmpwi r29,1
bge TRUEEND
lwz r3,IMtype(rtoc)
cmpwi r3,2
bne TRUEEND
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
  stw r3,IMmoneyTextStruct(rtoc)

#####################
## Create UCF Text ##
#####################

	#convert player number into float (f1)
		mr    r3,r29
		bl	IntToFloat

	#Get Correct Y Offset
		lfs f2,0x0(textProperties) #X offset of text
		lfs f2,0x4(textProperties) #Y offset of text

	#Create Text
		mr r3,text       #struct pointer
		branchl r12,getMoneyText
		mflr r4 #pointer to ASCII
    load r20,IMplayerMoney
    lwz r26,0(r20)
    li r22,0
    branchl r12,storeAscii
    li r20,0x7c
    stbx r20,r16,r4
    add r4,r4,r16
    addi r4,r4,1
    branchl r12,storeAscii
    branchl r12,getMoneyText
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
.float 2
.float -400
.long 0x3D851EBB



#**************************************************#

IntToFloat:
stwu	r1,-0x100(r1)	# make space for 12 registers
stfs  f2,0x8(r1)

lis	r0, 0x4330
lfd	f2, -0x6758 (rtoc)
xoris	r3, r3,0x8000
stw	r0,0xF0(sp)
stw	r3,0xF4(sp)
lfd	f1,0xF0(sp)
fsubs	f1,f1,f2		#Convert To Float

lfs  f2,0x8(r1)
addi	r1,r1,0x100	# release the space
blr

#**************************************************#
end:

restore
TRUEEND:
addi r4,r24,0
