#To be inserted at 80219D50
.include "Common/common.s"
  load r31,battlefieldFlag
  lwz r31,0(r31)
  cmpwi r31,1
  bne END
  lis r31, 0x8049
  ori r31, r31, 0xED74
  lwz r31, 0(r31)
  lwz r31, 8(r31)
  li r29, 0x0
  stb r29, 14(r31)
  stb r29, 94(r31)
  END:
  blr
