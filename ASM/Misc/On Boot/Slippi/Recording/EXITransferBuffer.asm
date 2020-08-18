################################################################################
# Address: FN_EXITransferBuffer # 0x800055f0 from Common.s
################################################################################

################################################################################
# Function: ExiTransferBuffer
# Inject @ 800055f0
# ------------------------------------------------------------------------------
# Description: Sets up EXI slot, writes / reads buffer via DMA, closes EXI slot
# ------------------------------------------------------------------------------
# In: r3 = pointer to buffer
#     r4 = buffer length
#     r5 = read (0x0) or write (0x1)
################################################################################
.include "Common/Common.s"

# Register names
.set REG_TransferBehavior, 31
.set REG_BufferPointer, 30
.set REG_BufferLength, 29

ExiTransferBuffer:
# Store stack frame
  backup

  li r20,1
  stw r20,slippiOn(rtoc)

# Backup buffer pointer
  mr REG_BufferPointer,r3
# Backup buffer length
  mr REG_BufferLength,r4
# Backup EXI transfer behavior
  mr REG_TransferBehavior,r5

# Start flush loop to write the data in buf through to RAM.
# Cache blocks are 32 bytes in length and the buffer obtained from malloc
# should be guaranteed to be aligned at the start of a cache block.
  mr r3, REG_BufferPointer
  add r4,REG_BufferPointer,REG_BufferLength
  cmpwi REG_TransferBehavior,CONST_ExiRead     # Check if writing or reading
  beq InitializeEXI
FLUSH_WRITE_LOOP:
  dcbf 0, r3
  addi r3, r3, 32
  cmpw r3, r4
  blt+ FLUSH_WRITE_LOOP
  sync
  isync

InitializeEXI:
# Step 1 - Prepare slot
# Prepare to call EXIAttach (803464c0)
  li r3, STG_EXIIndex # slot
  li r4, 0 # maybe a callback? leave 0
  branchl r12, EXIAttach
# Prepare to call EXILock (80346d80) r3: 0
  li r3, STG_EXIIndex # slot
  branchl r12, EXILock
# Prepare to call EXISelect (80346688) r3: 0, r4: 0, r5: 4
  li r3, STG_EXIIndex # slot
  li r4, 0 # device
  li r5, 5 # freq
  branchl r12, EXISelect

# Step 2 - Write
# Prepare to call EXIDma (80345e60)
  li r3, STG_EXIIndex # slot
  mr r4, REG_BufferPointer    #buffer location
  mr r5, REG_BufferLength     #length
  mr r6, REG_TransferBehavior # write mode input. 1 is write
  li r7, 0                # r7 is a callback address. Dunno what to use so just set to 0
  branchl r12, EXIDma
# Prepare to call EXISync (80345f4c)
  li r3, STG_EXIIndex # slot
  branchl r12, EXISync

# Step 3 - Close slot
# Prepare to call EXIDeselect (803467b4)
  li r3, STG_EXIIndex # Load input param for slot
  branchl r12, EXIDeselect

# Prepare to call EXIUnlock (80346e74)
  li r3, STG_EXIIndex # Load input param for slot
  branchl r12, EXIUnlock

# Prepare to call EXIDetach (803465cc) r3: 0
  li r3, STG_EXIIndex # Load input param for slot
  branchl r12, EXIDetach

FLUSH_READ_LOOP:
  cmpwi REG_TransferBehavior,CONST_ExiRead     # Check if writing or reading
  bne Exit
  dcbi 0, r3
  addi r3, r3, 32
  cmpw r3, r4
  blt+ FLUSH_READ_LOOP
  sync
  isync

Exit:
#restore registers and sp
  restore
  blr
