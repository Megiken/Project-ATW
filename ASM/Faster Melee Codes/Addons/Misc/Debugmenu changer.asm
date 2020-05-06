#To be inserted at 803039a8
.include "Common/common.s"
load r14,debugMenuValues

lwz	r15,0x8(r14)
lis	r16,0x803f
ori	r16,r16,0xa4e0
cmpw	r15,r16
bne-	NOT_MAIN_MENU

MAIN_MENU:

lbz	r15,-0x104(r16) #grab line item from previously opened menu
rlwinm.	r8,r15,0,25,25	# contain (00000040)?
bne-	SKIP
rlwinm	r8,r15,0,26,31	# load line bytes (0000003f)
cmpwi r8,0
beq THERE
stb	r8,0(r14)
THERE:
rlwinm.	r8,r15,0,24,24	# contain (00000080)?
beq-	CONTINUEa
li	r15,0x0100	# load A button
lis	r8,0x804c
stw	r15,0x20c4(r8)	# store A button to P1
CONTINUEa:
li	r15,0x40
stb	r15,-0x104(r16)
b	SKIP

NOT_MAIN_MENU:
lwz r15,0x18(r14)
cmpwi r15,0
bne- SUB_SUBMENU

lbz	r15,-0x103(r16) # load secondary line item
rlwinm.	r8,r15,0,25,25	# contain (00000040)?
beq-	REG_NOT_MAIN
rlwinm	r8,r15,0,26,31	# load line bytes (0000003f)
stb	r8,0(r14)
rlwinm.	r8,r15,0,24,24	# contain (00000080)?
beq-	CONTINUE
li	r15,0x0100	# load A button
lis	r8,0x804c
stw	r15,0x20c4(r8)	# store A button to P1
CONTINUE:
REG_NOT_MAIN:
lbz	r8,0(r14)	# load current line number
stb	r8,-0x103(r16)	# store current line number
b END

SUB_SUBMENU:
mr r14,r15
lbz	r15,-0x102(r16) # load 3rd line item
rlwinm.	r8,r15,0,25,25	# contain (00000040)?
beq-	BUTTON_PRESS_END
rlwinm	r8,r15,0,26,31	# load line bytes (0000003f)
stb	r8,0(r14)
rlwinm.	r8,r15,0,24,24	# contain (00000080)?
beq-	BUTTON_PRESS_END
li	r15,0x0100	# load A button
lis	r8,0x804c
stw	r15,0x20c4(r8)	# store A button to P1
BUTTON_PRESS_END:
lbz	r8,0(r14)	# load current line number
stb	r8,-0x102(r16)	# store current line number
b END

END:
SKIP:
# default line
li r8,0
blr
