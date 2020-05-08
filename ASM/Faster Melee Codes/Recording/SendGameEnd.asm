################################################################################
# Address: 8016d30c
################################################################################
.include "Common/Common.s"
.include "Recording/Recording.s"

################################################################################
# Routine: SendGameEnd
# ------------------------------------------------------------------------------
# Description: Send information about the end of a game to Slippi Device
################################################################################

.set REG_PlayerData,30
.set REG_Buffer,29
.set REG_BufferOffset,28
.set REG_PlayerSlot,27
.set REG_GameEndID,26
.set REG_SceneThinkStruct,25

backup

# check if VS Mode
  branchl r12,FN_ShouldRecord
  cmpwi r3,0x0
  beq Injection_Exit

# check if game end ID != 0
 load REG_SceneThinkStruct,0x8046b6a0
 lbz REG_GameEndID,0x8(REG_SceneThinkStruct)
 cmpwi REG_GameEndID,0
 beq Injection_Exit

#Custom stuff

 lwz r20,gameID(rtoc)
 cmpwi r20,1
 bne NORMALSLIP

   #Finish Stats

   branchl r12,getATWstats
   mflr r15
   load r16,doublesByte
   lbz r16,0(r16)
   stb r16,Stats_doublesbool(r15)
   load r16,stageData
   lwz r16,0x88(r16)
   stb r16,Stats_stageID(r15)
   branchl r12,countPlayersInMatch
   stb r3,Stats_numofplayers(r15)
   cmpwi r26,1
   bne ZERO
   stb r26,Stats_timeoutbool(r15)
ZERO:

   #Player Loop

   li r16,0

LOOP:
 mr r3,r16
 branchl r12,PlayerBlock_LoadSlotType
 cmpwi r3,3
 beq NEXT

 branchl r12,getCharData
 mflr r17
 lbzx r17,r16,r17
 addi r14,r15,Stats_charsLeft
 stbx r17,r14,r16

 mr r3,r16
 branchl r12,0x8003e39c
 addi r14,r15,Stats_numitemspickedup
 stbx r3,r14,r16


#Longest drought

 mr r3,r16
 branchl r12,getPlayerStatic
 lwz r22,0xdc0(r3)
 branchl r12,Int2Float
 fmr f7,f8
 li r22,60
 branchl r12,Int2Float
 fdiv f9,f7,f8
 branchl r12,Float2Int
 addi r14,r15,Stats_longestdrought
 stbx r23,r14,r16

 #Player IDs

 addi r14,rtoc,playerIDs
 lbzx r17,r14,r16
 addi r14,r15,Stats_playerID
 stbx r17,r16,r14




NEXT:
 addi r16,r16,1
 cmpwi r16,4
 bne LOOP



   #Copy Data
   lwz REG_Buffer,primaryDataBuffer(r13)
   li r3, 0x37
   stb r3,0x0(REG_Buffer)
   addi r3,REG_Buffer,1
   mr r4,r15
   li r5,Stats_length
   branchl r12,copymem

   #Send Data

   mr r3,REG_Buffer
   li r4,GAME_PRE_FRAME_PAYLOAD_LENGTH+1
   li r5,CONST_ExiWrite
   branchl r12,FN_EXITransferBuffer

   #Clear Data

   mr r3,r15
   li r4,Stats_length
   branchl r12,zeromem

NORMALSLIP:





# get buffer
  lwz REG_Buffer,primaryDataBuffer(r13)

# request game information from slippi
  li r3, CMD_GAME_END
  stb r3,0x0(REG_Buffer)

# store byte that will tell us whether the game was won by stock loss or by ragequit (2 = stock loss, 7 = no contest)
  stb REG_GameEndID,0x1(REG_Buffer)

# check if sudden death


LRAStartCheck:
# check if LRA start
  cmpwi REG_GameEndID,0x7
  bne NoLRAStart
# find Who LRA Started
  lbz r3,0x1(REG_SceneThinkStruct)
  b StoreLRAStarter
NoLRAStart:
  li  r3,-1
StoreLRAStarter:
  stb r3,0x2(REG_Buffer)

#------------- Transfer Buffer ------------
  mr  r3,REG_Buffer
  li  r4,GAME_END_PAYLOAD_LENGTH+1
  li  r5,CONST_ExiWrite
  branchl r12,FN_EXITransferBuffer

Injection_Exit:
  restore
  lwz	r0, 0x003C (sp)
