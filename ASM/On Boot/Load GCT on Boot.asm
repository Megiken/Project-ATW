#To be inserted at 80375384

.include "Common/common.s"

backup

mr r25,r31

load r3,allocSpace

#Create Heap Boundaries

.set REG_FileSize,28
	CreateHeapBoundaries:
  addi r3,r3,32
	addi	r0, r3, 31						#allign to something
	rlwinm	REG_FileSize, r0, 0, 0, 26			#allign to something
	mr	r3,r25			#r3 = start of heap
	mr r24,r25
bl TEXT
mflr r20
mr r3,r20
branchl r12,0x800163D8
add r25,r25,r3
addi r25,r25,0x500
stw r25,newHeapStart(rtoc)
mr r3,r24

	add	r25,r3,REG_FileSize			#ArenaHi = ArenaLo+ .gct size
	addi	r25,r25,0x500			#ArenaHi = ArenaHi+ 0x500 (misc space for file loading)
	mr	r4,r25			#r4= end of heap
	branchl	r12,0x803440e8			#Create Heap
	stw	r3, -0x5688 (r13)

#Allocate persistent file space
.set REG_Codeset,27
  li	r3, 0
  mr	r4,REG_FileSize
  branchl	r12,0x80015BD0
load r21,heapStart

branchl r12,loadbackupstoreGCT

  mr	r3,r25
	b END

TEXT:
blrl
.string "S+E.dat"
.align 2

END:

restore
mr	r31,r3		#r31 = start of next heap
addi	r3, r31, 31		#original codeline
