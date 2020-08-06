#To be inserted at 8032C928

.include "Common/common.s"

.set  REG_SFXLoopCount,25
.set  REG_SFXMatchInfo,26
.set  REG_AudioBit1,27
.set  REG_AudioBit2,28
backup
  li  REG_SFXLoopCount,0
  li  REG_AudioBit1,0
  li  REG_AudioBit2,0
  load  REG_SFXMatchInfo,0x80480590         #Match info
LoadCharacter_DeathCheckSFXLoadLoop:
  mulli r3,REG_SFXLoopCount,0x24
  add r3,r3,REG_SFXMatchInfo
  lbz r3,0x0(r3)
  extsb r3,r3
  branchl r12,0x80026e84
  or  REG_AudioBit1,REG_AudioBit1,r3
  or  REG_AudioBit2,REG_AudioBit2,r4
LoadCharacter_DeathCheckSFXLoadIncLoop:
  addi  REG_SFXLoopCount,REG_SFXLoopCount,1
  cmpwi REG_SFXLoopCount,6
  blt LoadCharacter_DeathCheckSFXLoadLoop
#Unk
  li  r3,28
  branchl r12,0x80026f2c
#Request the SFX load
  li  r3,4
  mr  r5,REG_AudioBit1
  mr  r6,REG_AudioBit2
  branchl r12,0x8002702c
  branchl r12,0x80027168

LoadCharacter_Exit:
  restore
  blr
