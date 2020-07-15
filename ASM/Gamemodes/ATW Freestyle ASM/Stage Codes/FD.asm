#To be inserted at 8021A7C0
.include "Common/common.s"
  lis r31, 0x8049
  ori r31, r31, 0xED74
  lwz r31, 0(r31)
  lwz r31, 8(r31)
  li r29, 0xF
  stb r29, 15(r31)
  stb r29, 31(r31)
  stb r29, 47(r31)
  blr
