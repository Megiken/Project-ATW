#To be inserted at 801c0a50

.include "Common/common.s"
.include "Global/Globals.s"

bl	RemoveStage_SkipList
########################
bl	RemoveStage_Dummy
bl	RemoveStage_TEST
bl	RemoveStage_Izumi
bl	RemoveStage_Pstadium
bl	RemoveStage_Castle
bl	RemoveStage_Kongo
bl	RemoveStage_Zebes
bl	RemoveStage_Corneria
bl	RemoveStage_Story
bl	RemoveStage_Onett
bl	RemoveStage_MuteCity
bl	RemoveStage_RCruise
bl	RemoveStage_Garden
bl	RemoveStage_GreatBay
bl	RemoveStage_Shrine
bl	RemoveStage_Kraid
bl	RemoveStage_Yoster
bl	RemoveStage_Greens
bl	RemoveStage_Fourside
bl	RemoveStage_MK1
bl	RemoveStage_MK2
bl	RemoveStage_Akaneia
bl	RemoveStage_Venom
bl	RemoveStage_Pura
bl	RemoveStage_BigBlue
bl	RemoveStage_Icemt
bl	RemoveStage_Icetop
bl	RemoveStage_FlatZone
bl	RemoveStage_OldDL
bl	RemoveStage_OldYS
bl	RemoveStage_OldKongo
bl	RemoveStage_Battlefield
bl	RemoveStage_FinalDestination
########################
RemoveStage_SkipList:
mflr r3
lwz r4,StageID_External(r13)
cmpwi r4,0x20
bgt SkyBattle_RemoveLines
mulli	r4,r4,4
add r4,r3,r4
lwz r5,0x0(r4)				#Get bl Instruction
rlwinm	r5,r5,0,6,29	#Mask Bits 6-29 (the offset)
cmpwi r5,0						#If pointer is null, exit
beq	SkyBattle_RemoveLines
add	r4,r4,r5					#Pointer to code now in r4
mtctr r4
bctr
################################
DestroyMapGObj:
backup
branchl r12,Stage_map_gobj_Load
branchl r12,Stage_Destroy_map_gobj
restore
blr
################################
RemoveStage_Izumi:
li  r3,3
bl  DestroyMapGObj
#FoD is annoying so get the first platform gobj from the second
li  r3,4
branchl r12,Stage_map_gobj_Load
lwz r3,0xC(r3)
branchl r12,GObj_Destroy
li  r3,4
bl  DestroyMapGObj
b SkyBattle_RemoveLines
RemoveStage_Pstadium:
/*
#Get monitor gobj from map_gobj
li  r3,1      #monitor
branchl r12,Stage_map_gobj_Load
lwz r31,0x2C(r3)
lwz r3,0xD4(r31)
branchl r12,GObj_Destroy
lwz r3,0xD8(r31)
branchl r12,GObj_Destroy
lwz r3,0xDC(r31)
branchl r12,GObj_Destroy

li  r3,1      #monitor
bl  DestroyMapGObj
li  r3,2      #stage and transform
bl  DestroyMapGObj
*/
b SkyBattle_RemoveLines
RemoveStage_Story:
li  r3,2
bl  DestroyMapGObj
li  r3,3
bl  DestroyMapGObj
b SkyBattle_RemoveLines
RemoveStage_OldDL:
li  r3,1
bl  DestroyMapGObj
li  r3,4
bl  DestroyMapGObj
li  r3,5
bl  DestroyMapGObj
li  r3,6
bl  DestroyMapGObj
li  r3,7
bl  DestroyMapGObj
li  r3,8
bl  DestroyMapGObj
#set wind hazard count to 0
li	r3,0
stw	r3,Stage_PositionHazardCount(r13)
b SkyBattle_RemoveLines
RemoveStage_Battlefield:
li  r3,6
bl  DestroyMapGObj
b SkyBattle_RemoveLines
RemoveStage_FinalDestination:
li  r3,1
bl  DestroyMapGObj
li  r3,2
bl  DestroyMapGObj
li  r3,3
bl  DestroyMapGObj
b SkyBattle_RemoveLines

/*
SkyBattle_RemoveLines:
.set  REG_Count,31
#Remove all stage lines
lwz r3,-0x51EC (r13)
lwz REG_Count,0x4(r3)
SkyBattle_RemoveLinesLoop:
mr  r3,REG_Count
branchl r12,0x80057bc0
subi  REG_Count,REG_Count,1
cmpwi REG_Count,0
bge SkyBattle_RemoveLinesLoop
*/

SkyBattle_RemoveLines:
lwz r3,-0x51EC (r13)
lwz r3,0x4(r3)
mulli r5,r3,4*6
lwz r3,-0x51E8 (r13)
li  r4,0x45
branchl r12,memset

SkyBattle_InitExit:
#draw box






lwz	r0, 0x0064 (sp)
