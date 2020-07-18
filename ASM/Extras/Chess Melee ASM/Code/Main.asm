#To be inserted at 8016e91c

.include "Common/common.s"
.include "Global/Globals.s"

bl THERE
li r3,22
li r4,23
mflr r5
li r6,0
li r7,64
branchl r12,createCustomGObj
b END


THERE:
blrl
#Registers
.set REG_GObj,31
.set REG_GObjData,30

#Data Offsets
.set GameState,0x0    #byte
.set FrozenTimer,0x1  #half

#Definitions
#GameState
  .set InProgress,0x0
  .set Frozen,0x1

#Constants
  .set FreezeFrames, 1 * 60

backup

#Init Pointers
  mr  REG_GObj,r3
  lwz REG_GObjData,0x2C(REG_GObj)

#Check state of game
  lbz r3,GameState(REG_GObjData)
  cmpwi r3,InProgress
  beq ChessMelee_Think_InProgress
  cmpwi r3,Frozen
  beq ChessMelee_Think_Frozen
  b ChessMelee_ThinkExit

#region InProgress
ChessMelee_Think_InProgress:
.set REG_LoopCount,29
#Check For Dead Players
  li  REG_LoopCount,0

ChessMelee_Think_InProgressLoop:
#Check Players Presence
  mr  r3,REG_LoopCount
  branchl r12,0x800322c0
  cmpwi r3,0x2
  bne ChessMelee_Think_InProgressIncLoop
#Get Players Data
  mr  r3,REG_LoopCount
  branchl r12,0x80034110
  lwz r3,0x2C(r3)
#Check If Player is still active (not sleep)
  lbz r4,0x221F(r3)
  rlwinm. r4,r4,0,27,27
  bne ChessMelee_Think_InProgressIncLoop
#Check if READY,GO is over
  lbz r4,0x221D(r3)
  rlwinm. r4,r4,0,28,28
  bne ChessMelee_Think_InProgressIncLoop
#Check if Blastzone code is being skipped
  lbz r4,0x2219(r3)
  rlwinm. r4,r4,0,25,25
  beq ChessMelee_Think_InProgressIncLoop
#Rebirth gets here too, check if NOT rebirth/rebirthWait
  lwz r4,0x10(r3)
  cmpwi r4,ASID_Rebirth
  beq ChessMelee_Think_InProgressIncLoop
  cmpwi r4,ASID_RebirthWait
  beq ChessMelee_Think_InProgressIncLoop
#If in any Star KO State, enter them into DeadUp
  cmpwi r4,ASID_DeadUpStar
  beq ChessMelee_Think_InProgressEnterDeadUp
  cmpwi r4,ASID_DeadUpStarIce
  beq ChessMelee_Think_InProgressEnterDeadUp
  cmpwi r4,ASID_DeadUpFall
  beq ChessMelee_Think_InProgressEnterDeadUp
  b  ChessMelee_Think_FreezeOtherPlayers
ChessMelee_Think_InProgressEnterDeadUp:
#Enter DeadUp
  lwz r3,0x0(r3)
  branchl r12,0x800d3e40
  b ChessMelee_Think_FreezeOtherPlayers

ChessMelee_Think_InProgressIncLoop:
  addi REG_LoopCount,REG_LoopCount,1
  cmpwi REG_LoopCount,6
  blt ChessMelee_Think_InProgressLoop
#No players dead, exit think function
  b ChessMelee_ThinkExit

ChessMelee_Think_FreezeOtherPlayers:
#Freeze all other players
.set REG_DeadPlayer,29
.set REG_LoopCount,28
#Check For Dead Players
  li  REG_LoopCount,0
ChessMelee_Think_FreezeOtherPlayersLoop:
#Check if this is the dead player
  cmpw REG_LoopCount,REG_DeadPlayer
  bne ChessMelee_Think_FreezeOtherPlayers_NotDeadPlayer
ChessMelee_Think_FreezeOtherPlayers_NotDeadPlayer:
#Check Players Presence
  mr  r3,REG_LoopCount
  branchl r12,0x800322c0
  cmpwi r3,0x2
  bne ChessMelee_Think_FreezeOtherPlayersIncLoop
#Get Players Data
  mr  r3,REG_LoopCount
  branchl r12,0x80034110
  lwz r3,0x2C(r3)
#Check If Player is still active (not sleep)
  lbz r4,0x221F(r3)
  rlwinm. r4,r4,0,27,27
  bne ChessMelee_Think_FreezeOtherPlayersIncLoop
#Freeze Player
  li    r5,1
  lbz    r4,0x2219(r3)
  rlwimi r4,r5,2,29,29
  stb    r4,0x2219(r3)
#Remove any hitlag
  li  r4,0
  stw r4,0x195C(r3)
  stw r4,0x1958(r3)

ChessMelee_Think_FreezeOtherPlayersIncLoop:
  addi REG_LoopCount,REG_LoopCount,1
  cmpwi REG_LoopCount,6
  blt ChessMelee_Think_FreezeOtherPlayersLoop

#Start Frozen Timer
  li  r3,FreezeFrames
  sth r3,FrozenTimer(REG_GObjData)
#Change State
  li  r3,Frozen
  stb r3,GameState(REG_GObjData)

  b ChessMelee_ThinkExit

#endregion

#region Frozen
ChessMelee_Think_Frozen:
#Decrement timer
  lhz r3,FrozenTimer(REG_GObjData)
  subi  r3,r3,1
  sth r3,FrozenTimer(REG_GObjData)
#Check if up
  cmpwi r3,0
  bne ChessMelee_ThinkExit

#Timer up, enter everyone into rebirth
.set REG_LoopCount,29
.set REG_PlayerGObj,28
#Check For Dead Players
  li  REG_LoopCount,0
ChessMelee_Think_FrozenLoop:
#Check Players Presence
  mr  r3,REG_LoopCount
  branchl r12,0x800322c0
  cmpwi r3,0x2
  bne ChessMelee_Think_FrozenIncLoop
#Get Players GObj
  mr  r3,REG_LoopCount
  branchl r12,0x80034110
  mr  REG_PlayerGObj,r3
#Check If Player is still active (not sleep)
  lbz r4,0x221F(r3)
  rlwinm. r4,r4,0,27,27
  bne ChessMelee_Think_FrozenIncLoop
#Remove Items + Etc
  mr  r3,REG_PlayerGObj
  branchl r12,0x800d331c
#Enter into Sleep
  mr  r3,REG_PlayerGObj
    li r4,0x1
    branchl    r12,0x800bfd9c

ChessMelee_Think_FrozenIncLoop:
  addi REG_LoopCount,REG_LoopCount,1
  cmpwi REG_LoopCount,6
  blt ChessMelee_Think_FrozenLoop

#Enter InProgress Game State
  li  r3,InProgress
  stb r3,GameState(REG_GObjData)
  b ChessMelee_ThinkExit

#endregion

ChessMelee_ThinkExit:
restore
blr

END:
lwz	r0, 0x0024 (sp)
