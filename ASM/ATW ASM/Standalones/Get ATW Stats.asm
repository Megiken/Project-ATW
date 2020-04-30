#To be inserted at 8032c8a0

.include "Common/common.s"

blrl
#General Stats, 0x0 = stage ID, 0x1 = num of players, 0x2 = did time out bool, 0 = no, 1 = yes 0x3 = ??
.long 0
#Win bool
.long 0
#Character ID
.long 0
#Num of items picked up
.long 0
#Longest Drought (seconds)
.long 0
#Num of kills
.long 0
#Player ID (-1 if no custom ID)
.long 0
#Picked up hammer bool
.long 0
#Picked up starman bool
.long 0
#Picked up Turbo bool
.long 0
#Picked up lightning bolt bool
.long 0
#Picked up heart canister bool
.long 0
#Picked up screw atttack bool
.long 0
#Touched poison mushroom bool
.long 0
#Touched super mushroom bool
.long 0

#Damage given (half)
.long 0
.long 0

#Damage taken (half)
.long 0
.long 0
