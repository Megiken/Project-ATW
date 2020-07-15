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
stw r25,firstFileInHeap(rtoc)
addi r3,r20,8
branchl r12,0x800163D8
add r25,r25,r3
mr r23,r3
addi r25,r25,0x500
li r3,-1
rlwinm.	r4, r25, 0, 27, 31
sub r4,r25,r4
stw r3,0(r4)
stw r25,secondFileInHeap(rtoc)
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

	load r4,heapStart
	addi r3,r20,8
	addi r5,sp,12
	branchl r12,0x8001668C


load r21,heapStart
add r21,r21,r23
addi r21,r21,0x500
branchl r12,loadbackupstoreGCT


  mr	r3,r25
	b END

TEXT:
blrl
.long 0x532b452e
.long 0x64617400
.long 0x44424d2e
.long 0x64617400

END:

restore
mr	r31,r3		#r31 = start of next heap
addi	r3, r31, 31		#original codeline
