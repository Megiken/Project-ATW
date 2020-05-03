#To be inserted at 801D1548

.include "Common/common.s"

load r20,frozenPokemon
lwz r20,0(r20)
cmpwi r20,0
bne END
branchl r12,0x801d4548

END:
