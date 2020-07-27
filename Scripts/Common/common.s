################################################################################
# Macros
################################################################################

.macro branchl reg, address
lis \reg, \address @h
ori \reg,\reg,\address @l
mtlr \reg
blrl
.endm

.macro branch reg, address
lis \reg, \address @h
ori \reg,\reg,\address @l
mtctr \reg
bctr
.endm

.macro load reg, address
lis \reg, \address @h
ori \reg, \reg, \address @l
.endm

.macro backup
mflr r0
stw r0, 0x4(r1)
stwu r1,-0xB0(r1)	# make space for 12 registers
stmw r20,0x8(r1)
.endm

.macro restore
lmw r20,0x8(r1)
lwz r0, 0xB4(r1)
addi r1,r1,0xB0	# release the space
mtlr r0
.endm

.macro backupall
mflr r0
stw r0, 0x4(r1)
stwu    r1,-0x100(r1)    # make space for 12 registers
stmw  r3,0x8(r1)
.endm

.macro restoreall
lmw  r3,0x8(r1)
lwz r0, 0x104(r1)
addi    r1,r1,0x100    # release the space
mtlr r0
.endm

.macro backupallnor0
stwu    r1,-0x100(r1)    # make space for 12 registers
stmw  r3,0x8(r1)
.endm

.macro restoreallnor0
lmw  r3,0x8(r1)
addi    r1,r1,0x100    # release the space
.endm

.macro backupallnomflr
stw r0, 0x4(r1)
stwu    r1,-0x100(r1)    # make space for 12 registers
stmw  r3,0x8(r1)
.endm

.macro restoreallnomtlr
lmw  r3,0x8(r1)
lwz r0, 0x104(r1)
addi    r1,r1,0x100    # release the space
.endm

.macro loadfloat regf,reg,address
lis \reg, \address @h
ori \reg, \reg, \address @l
stw \reg,-0x4(sp)
lfs \regf,-0x4(sp)
.endm

.macro loadfz regf,reg,address
lis \reg, \address @h
ori \reg, \reg, \address @l
lfs \regf,0(\reg)
.endm

.macro loadwz reg, address
lis \reg, \address @h
ori \reg, \reg, \address @l
lwz \reg, 0(\reg)
.endm

.macro loadhz reg, address
lis \reg, \address @h
ori \reg, \reg, \address @l
lhz \reg, 0(\reg)
.endm

.macro loadbz reg, address
lis \reg, \address @h
ori \reg, \reg, \address @l
lbz \reg, 0(\reg)
.endm

.macro convToFloat reg, freg
lfd f19,-0x8000(rtoc)
stfd f19,0x20(rtoc)
sth \reg,0x26(rtoc)
lfd \freg,0x20(rtoc)
fsubs \freg,\freg,f19
.endm

.macro convToInt reg, freg
fctiwz \freg, \freg
stfd \freg,0x20(rtoc)
lwz \reg,0x24(rtoc)
.endm


################################################################################
# Static Function Locations
################################################################################

.set randomI,0x80380580
.set copymem,0x80003244
.set zeromem,0x8000c160
.set memset,0x80003100
.set allocateMem,0x8037f1e4
.set playsfx,0x801c53ec
.set countPlayersInMatch,0x8016b558
.set applyInvincibility,0x8007b7a4
.set removeColourOverlay,0x800c0200
.set applyColourOverlay,0x800bffd0
.set getCharID,0x80032330
.set PlayerBlock_LoadSlotType,0x8003241c
.set PlayerBlock_LoadFalls,0x80034d78
.set PlayerBlock_LoadSDs,0x8003521c
.set getPlayerHeldInputs,0x801a3680
.set getPlayerInstantInputs,0x801a36a0
.set CSS_UpdateCSPInfo,0x8025db34
.set DestroyItem,0x8026a8ec
.set EntityItemSpawn,0x80268B18
.set GObjCreate,0x803901f0
.set GObjaddProc,0x8038fd54
.set GObjaddMem,0x80390b68
.set GObjremoveProc,0x8038fed4
.set GObjDestroy,0x80390228
.set createTextStruct,0x803a6754
.set initSubtext,0x803a6b98
.set updateSubtextSize,0x803a7548
.set updateSubtextPos,0x803a746c
.set updateSubtextContent,0x803a70a0
.set changeTextColor,0x803a74f0
.set removeText,0x803a5cc4
.set sin,0x803263d4
.set cos,0x80326240
.set tan,0x803261bc
.set asin,0x80022dbc
.set acos,0x80022d1c
.set atan,0x80022e68
.set log,0x803265a8
.set createCamera,0x80029020
.set removeCamera,0x800290d4

.set functSpace,0x8032C848

#0x218 bytes avaiable, 134 custom functions before I need new space

.set Int2Float,functSpace+0x0
.set getCharData,functSpace+0x4
.set resumeGame,functSpace+0x8
.set checkInput,functSpace+0xc
.set getCharStruct,functSpace+0x10
.set removePlayerCheck,functSpace+0x14
.set removeCharacter,functSpace+0x18
.set swapCharacter,functSpace+0x1c
.set getPlayerData,functSpace+0x20
.set getPlayerEntity,functSpace+0x24
.set getPlayerStatic,functSpace+0x28
.set absoluteValueByte,functSpace+0x2c
.set Float2Int,functSpace+0x30
.set getItemVars,functSpace+0x34
.set getItemFunctions,functSpace+0x38
.set CIHealing,functSpace+0x3c
.set CIYoshiArmor,functSpace+0x40
.set CITurbo,functSpace+0x44
.set CIScrewAttack,functSpace+0x48
.set CIHealingSprout,functSpace+0x4c
.set loadbackupstoreGCT,functSpace+0x50
.set removerestoreGCT,functSpace+0x54
.set getATWstats,functSpace+0x58
.set getCSSplayers,functSpace+0x5c
.set getKOTHdata,functSpace+0x60
.set KOTHThink,functSpace+0x64
.set KOTHInit,functSpace+0x68
.set IMgetFirst,functSpace+0x6c
.set IMgetSecond,functSpace+0x70
.set getCorrectData,functSpace+0x74
.set checkData,functSpace+0x78
.set checkClone,functSpace+0x7c
.set IMregularInit,functSpace+0x80
.set IMbansInit,functSpace+0x84
.set IMmoneyInit,functSpace+0x88
.set IMclearStruct,functSpace+0x8c
.set IMhardClearStruct,functSpace+0x90
.set storeAscii,functSpace+0x94
.set getMoneyText,functSpace+0x98
.set IMupdateText,functSpace+0x9c
.set IMgetFirstBans,functSpace+0xa0
.set IMgetSecondBans,functSpace+0xa4
.set IMgetCorrectBans,functSpace+0xa8
.set checkBanClone,functSpace+0xac
.set updateBanText,functSpace+0xb0
.set getCustomStageByte,functSpace+0xb4
.set removePlayerFromCSS,functSpace+0xb8
.set getCustomEntityStruct,functSpace+0xbc
.set secondLevelDebugMenu,functSpace+0xc0
.set goToCSS,functSpace+0xc4
.set KOTHGameInit,functSpace+0xc8
.set ATWInit,functSpace+0xcc
.set DPInit,functSpace+0xd0
.set IMinit,functSpace+0xd4
.set SSinit,functSpace+0xd8
.set ARinit,functSpace+0xdc
.set updateSFX,functSpace+0xe0
.set loadCharacter,functSpace+0xe4
.set getOppositeData,functSpace+0xe8
.set ATWliteInit,functSpace+0xec
.set ATWfreeeInit,functSpace+0xf0
.set Smash64Init,functSpace+0xf4
.set BrawlInit,functSpace+0xf8
.set BBWInit,functSpace+0xfc
.set MRSSInit,functSpace+0x100
.set SBInit,functSpace+0x104
.set OITCInit,functSpace+0x108
.set IJZInit,functSpace+0x10c
.set createCustomGObj,functSpace+0x110
.set spawnMrSaturn,functSpace+0x114
.set resetpos,functSpace+0x118
.set scoregoal,functSpace+0x11c
.set CYOPInit,functSpace+0x120
.set ChessInit,functSpace+0x124
.set DualInit,functSpace+0x128
.set TauntInit,functSpace+0x12c
.set VolleyballInit,functSpace+0x130
.set BasketballInit,functSpace+0x134
.set CTFInit,functSpace+0x138


.set prim.new,0x804dd84c
.set prim.close,0x804dd848
################################################################################
# Offsets
################################################################################

#Debug menu

.set debugSpace,2149162828

.set IMmoneyOffset,0x70

.set playerAttributes,debugSpace
.set CstickFlag, debugSpace+48
.set defaultHandsFlag, debugSpace+52
.set skipResultsFlag, debugSpace+56
.set ledgeGrabLimitFlag, debugSpace+60
.set maxLedgeGrabs, debugSpace+64
.set wobblingFlag, debugSpace+68
.set UCFflag, debugSpace+72
.set dreamlandVolumeFlag, debugSpace+76
.set gameSpeedMult, debugSpace+80
.set starKOFlag, debugSpace+84
.set meleeVersion, debugSpace+88
.set wideScreenFlag, debugSpace+92
.set lagReduction, debugSpace+96
.set customStageData,  debugSpace+100
.set yoshisFlag,  debugSpace+216
.set frozenPokemon,  debugSpace+220
.set dreamLandWind,  debugSpace+224
.set brinstarLava,  debugSpace+228
.set FODflag,  debugSpace+232
.set corneriaShips,  debugSpace+236
.set corneriaGun,  debugSpace+240
.set greenGreensBlocks,  debugSpace+244
.set greenGreensTree,  debugSpace+248
.set peachCastle,  debugSpace+252
.set fdBackground,  debugSpace+256
.set mushroomKingdom1Levers,  debugSpace+260
.set mushroomKingdom1Blocks,  debugSpace+264
.set jungleJapesFlag,  debugSpace+268
.set onettCars,  debugSpace+272
.set onettDrugstore,  debugSpace+276
.set muteCityCars,  debugSpace+280
.set kongoJungleBarrel,  debugSpace+284
.set kongoJungle64Barrel,  debugSpace+288
.set customItemSpawnFlag,  debugSpace+292
.set itemSpawnRate,  debugSpace+296
.set customItemFlag, debugSpace+300
.set itemRates,  debugSpace+304
.set customPokemonFlag, debugSpace+444
.set pokemonRates,  debugSpace+448
.set maxItemsOnScreen,  debugSpace+564
.set fancyThrowingFlag,  debugSpace+568
.set tauntToGainItem,  debugSpace+572
.set airGrabs,  debugSpace+576
.set airTaunts,  debugSpace+580
.set tauntCancel,  debugSpace+584
.set fastFallFlag,  debugSpace+588
.set invisCeiling,  debugSpace+592
.set grabInfinites,  debugSpace+596
.set wallBracing,  debugSpace+600
.set autoLCancel,  debugSpace+604
.set percentSwapFlag ,  debugSpace+608
.set doublesColours,  debugSpace+612
.set walljumpFlag,  debugSpace+616
.set climberCloneFlag,  debugSpace+620
.set TWODFlag,  debugSpace+624
.set ledgeInvincibility,  debugSpace+628
.set randomEffects, debugSpace+632
.set firstChars,  debugSpace+636
.set gameType,  debugSpace+652
.set doublesType,  debugSpace+656
.set timerVar,  debugSpace+660
.set customTimer,  debugSpace+664
.set numOfChars,  debugSpace+668
.set saveStocks,  debugSpace+672
.set IMnumOfChars,  debugSpace+676
.set IMcharOrder,  debugSpace+680
.set IMbanOrder,  debugSpace+684
.set IMplayerMoney,  debugSpace+688
.set IMcharCost,  debugSpace+692
.set SSnumOfChars,  debugSpace+796
.set ARnumOfChars,  debugSpace+800
.set bombImpact,  debugSpace+804
.set bombExplosion,  debugSpace+808
.set gravity,  debugSpace+812
.set terminalVelocity,  debugSpace+816
.set KOTHgameType,  debugSpace+820
.set KOTHmaxScore,  debugSpace+824
.set KOTHhillTime,  debugSpace+828
.set mrssType, debugSpace+832
.set mrssMaxScore, debugSpace+836
.set saturnSpeed, debugSpace+840
.set sbType, debugSpace+844
.set sbMaxScore, debugSpace+848
.set sbPenalty, debugSpace+852
.set sbReflections, debugSpace+856
.set infiniteAmmo, debugSpace+860
.set oitcReward, debugSpace+864
.set oitcLedge, debugSpace+868
.set oitcReflections, debugSpace+872
.set boxCoordinates, debugSpace+876
.set warpDamage, debugSpace+892
.set killPercent, debugSpace+896
.set percentStaminaFlag,  debugSpace+900
.set staminaAmount,  debugSpace+904
.set sizeFlag,  debugSpace+908
.set headFlag,  debugSpace+912
.set bodyFlag,  debugSpace+916
.set statusFlag,  debugSpace+920
.set gravityFlag,  debugSpace+924
.set speedFlag,  debugSpace+928
.set cameraFlag,  debugSpace+932
.set customGamemodeFlag,  debugSpace+936
.set BFSkin,  debugSpace+940
.set FDSkin,  debugSpace+944
.set PSSkin,  debugSpace+948
.set YSSkin,  debugSpace+952
.set FODSkin,  debugSpace+956
.set DreamlandSkin,  debugSpace+960
.set CSSSkin,  debugSpace+964
.set swordColoursFlag, debugSpace+968

#Other

.set heapStart,0x8065cc60
.set stageData,0x8049e6c8
.set stageID,0x88
.set doublesByte,0x804807c8
.set playerCSSdata1,0x803F0E08
.set playerCSSdata2,0x80480820
.set cssID,0x804a04f3
.set timerSeconds,0x8046b6c8
.set timerMilli,0x8046b6cc #half
.set ylDat,0x804d76bc
.set bombImpactOffset,0x4434
.set bombExplosionOffset,0x445c
.set gravityOffset,0x35fc
.set terminalVelocityOffset,0x3600
.set cssStruct,0x804d6cbc
.set digitalData,0x804C1FAC
.set cssStruct2,0x8043208c
.set frameRate,0x80432a2c

.set ATWsubmenu,0x8065eab4
.set IMsubmenu,0x8065efa4
.set squadStrikesubmenu,0x8065f900
.set allStarsubmenu,0x8065fa6c
.set smash64submenu,0x8065fbd8
.set brawlsubmenu,0x8065fc3c
.set sixPlayeMenu,0x8065fca0
.set minigamesMenu,0x8065fd04
.set shuffleMenu,0x80660c60
.set extrasMenu,0x80660cc4

################################################################################
# Mytoc Offsets
################################################################################

.set spawnVar,-0x7f98
.set prevMenuFlag,-0x7f94
.set playerIDs,-0x7e90
.set firstFileInHeap,-0x7e8c
.set thirdFileInHeap,-0x7e18
.set redTeamMate,-0x7e14
.set gameID,-0x7DB0
.set IMcount,-0x7dac
.set IMp1Stocks,-0x7d88
.set IMp2Stocks,-0x7d84
.set IMgameOverFlag,-0x7d80
.set IMtype,-0x7d7c
.set IMpickban,-0x7d38
.set ATWstocks,-0x7d34
.set secondFileInHeap,-0x7d10
.set IMmoneyTextStruct,-0x7d0c
.set tempStageAdr,-0x7cf0
.set tempBackupAscii,-0x7cec
.set suddenDeathItem,-0x7ce8
.set mrsaturndata,-0x7c78
.set numOfPlatforms,-0x7c7c
.set free3,-0x7c40
.set free4,-0x7c3c

################################################################################
# rtoc Offsets
################################################################################

.set rtoczero,-0x778c
.set rtocone,-0x76ac
.set rtocnegone,-0x7658
.set rtoctwo,-0x3C30
.set rtocrad,-0x7510

################################################################################
# Values
################################################################################

.set allocSpace,0x28000
.set debugMenuValues,0x80bdcd40+allocSpace+0x520

################################################################################
# Custom Stat Offsets
################################################################################

.set Stats_length,0x2c

.set Stats_stageID,0x0
.set Stats_numofplayers,0x1
.set Stats_timeoutbool,0x2
.set Stats_doublesbool,0x3

.set Stats_charsLeft,0x4
.set Stats_numitemspickedup,0x8
.set Stats_longestdrought,0xc
.set Stats_kills,0x10
.set Stats_deaths,0x14
.set Stats_SDs,0x18
.set Stats_DamageGiven,0x1c
.set Stats_DamageTaken,0x24


################################################################################
# Pokemon IDs
################################################################################

.set GoldeenID,0
.set ChikoritaID,1
.set SnorlaxID, 2
.set BlastoiseID, 3
.set WeezingID, 4
.set CharizardID, 5
.set MoltresID, 6
.set ZapdosID, 7
.set ArticunoID, 8
.set WobuffetID, 9
.set ScizorID, 10
.set UnownID, 11
.set EnteiID, 12
.set RaikouID, 13
.set SuicuneID, 14
.set BellossomID, 15
.set VoltorbID, 16
.set LugiaID, 17
.set HoOhID, 18
.set DittoID, 19
.set ClefairyID, 20
.set TogepiID, 21
.set MewID, 22
.set CelebiID, 23
.set StaryuID, 24
.set ChanseyID, 25
.set Porygon2ID, 26
.set CyndaquilID, 27
.set MarillID, 28
.set VenusaurID,29


################################################################################
# Item IDs
################################################################################

.set Capsule,0
.set Crate,1
.set Barrel,2
.set Egg,3
.set Partyball,4
.set Barrelcannon,5
.set Bobomb,6
.set MrSaturn,7
.set Heart,8
.set Maximtomato,9
.set Starman,10
.set Homerunbat,11
.set Beamsword,12
.set Parasol,13
.set Greenshell,14
.set Redshell,15
.set Raygun,16
.set Freezie,17
.set Food,18
.set Motionmine,19
.set Flipper,20
.set Superscope,21
.set Starrod,22
.set Lipstick,23
.set Fan,24
.set Fireflower,25
.set Supermushroom,26
.set Poisonmushroom,27
.set Hammer,28
.set Warpstar,29
.set Screwattack,30
.set Bunnyhood,31
.set MetalBox,32
.set CloakingDevice,33
.set Pokeball,34
.set yoshiEgg,0x2a


################################################################################
# Character ex IDs
################################################################################

.set CaptainFalconexID,0x00
.set DonkeyKongexID,0x01
.set FoxexID,0x02
.set MrGameNWatchexID,0x03
.set KirbyexID,0x04
.set BowserexID,0x05
.set LinkexID,0x06
.set LuigiexID,0x07
.set MarioexID,0x08
.set MarthexID,0x09
.set MewtwoexID,0x0A
.set NessexID,0x0B
.set PeachexID,0x0C
.set PikachuexID,0x0D
.set IceClimbersexID,0x0E
.set JigglypuffexID,0x0F
.set SamusexID,0x10
.set YoshiexID,0x11
.set ZeldaexID,0x12
.set SheikexID,0x13
.set FalcoexID,0x14
.set YoungLinkexID,0x15
.set DrMarioexID,0x16
.set RoyexID,0x17
.set PichuexID,0x18
.set GanondorfexID,0x19

################################################################################
# Character in IDs
################################################################################

.set MarioinID,0x00
.set FoxinID,0x01
.set CaptainFalconinID,0x02
.set DonkeyKonginID,0x03
.set KirbyinID,0x04
.set BowserinID,0x05
.set LinkinID,0x06
.set SheikinID,0x07
.set NessinID,0x08
.set PeachinID,0x09
.set PopoinID,0x0A
.set NanainID,0x0B
.set PikachuinID,0x0C
.set SamusinID,0x0D
.set YoshiinID,0x0E
.set JigglypuffinID,0x0F
.set MewtwoinID,0x10
.set LuigiinID,0x11
.set MarthinID,0x12
.set ZeldainID,0x13
.set YoungLinkinID,0x14
.set DrMarioinID,0x15
.set FalcoinID,0x16
.set PichuinID,0x17
.set MrGameNWatchinID,0x18
.set GanondorfinID,0x19
.set RoyinID,0x1A

################################################################################
# Stage ex IDs
################################################################################

.set FountainexID,0x002
.set StadiumexID,0x003
.set CastleexID,0x004
.set KongoJungleexID,0x005
.set BrinstarexID,0x006
.set CorneriaexID,0x007
.set YoshiStoryexID,0x008
.set OnettexID,0x009
.set MuteCityexID,0x00a
.set RainbowCruiseexID,0x00b
.set JungleJapesexID,0x00c
.set GreatBayexID,0x00d
.set TempleexID,0x00e
.set DepthsexID,0x00f
.set YoshiIslandexID,0x010
.set GreensexID,0x011
.set FoursideexID,0x012
.set MK1exID,0x013
.set MK2exID,0x014
.set AkaneiexID,0x015
.set VenomexID,0x016
.set PokeFloatsexID,0x017
.set BigBlueexID,0x018
.set IcemntexID,0x019
.set IcetopexID,0x01a
.set FlatZoneexID,0x01b
.set DreamLand64exID,0x01c
.set YoshiIsland64exID,0x01d
.set Kongo64exID,0x01e
.set BattlefieldexID,0x01f
.set FinalDestexID,0x020

################################################################################
# Stage in IDs
################################################################################

.set CastleinID,0x02
.set RainbowCruiseinID,0x03
.set KongoJungleinID,0x04
.set JungleJapesinID,0x05
.set GreatBayinID,0x06
.set TempleinID,0x07
.set BrinstarinID,0x08
.set BrinstarDepthsinID,0x09
.set YoshiStoryinID,0x0A
.set YoshiIslandinID,0x0B
.set FountaininID,0x0C
.set GreenGreensinID,0x0D
.set CorneriainID,0x0E
.set VenominID,0x0F
.set PokemonStadiuminID,0x10
.set PokeFloatsinID,0x11
.set MuteCityinID,0x12
.set BigBlueinID,0x13
.set OnettinID,0x14
.set FoursideinID,0x15
.set IcicleMountaininID,0x16
.set MushroomKingdominID,0x18
.set MushroomKingdomIIinID,0x19
.set FlatZoneinID,0x1B
.set DreamLandinID,0x1C
.set YoshiIsland64inID,0x1D
.set KongoJungle64inID,0x1E
.set BattlefieldinID,0x24
.set FinalDestinationinID,0x25

################################################################################
# Action state IDs
################################################################################

.set AS_DeadDown, 0x00
.set AS_DeadLeft, 0x01
.set AS_DeadRight, 0x02
.set AS_DeadUp, 0x03
.set AS_DeadUpStar, 0x04
.set AS_DeadUpStarIce, 0x05
.set AS_DeadUpFall, 0x06
.set AS_DeadUpFallHitCamera, 0x07
.set AS_DeadUpFallHitCameraFlat, 0x08
.set AS_DeadUpFallIce, 0x09
.set AS_DeadUpFallHitCameraIce, 0x0A
.set AS_Sleep, 0x0B
.set AS_Rebirth, 0x0C
.set AS_RebirthWait, 0x0D
.set AS_Wait, 0x0E
.set AS_WalkSlow, 0x0F
.set AS_WalkMiddle, 0x10
.set AS_WalkFast, 0x11
.set AS_Turn, 0x12
.set AS_TurnRun, 0x13
.set AS_Dash, 0x14
.set AS_Run, 0x15
.set AS_RunDirect, 0x16
.set AS_RunBrake, 0x17
.set AS_KneeBend, 0x18
.set AS_JumpF, 0x19
.set AS_JumpB, 0x1A
.set AS_JumpAerialF, 0x1B
.set AS_JumpAerialB, 0x1C
.set AS_Fall, 0x1D
.set AS_FallF, 0x1E
.set AS_FallB, 0x1F
.set AS_FallAerial, 0x20
.set AS_FallAerialF, 0x21
.set AS_FallAerialB, 0x22
.set AS_FallSpecial, 0x23
.set AS_FallSpecialF, 0x24
.set AS_FallSpecialB, 0x25
.set AS_DamageFall, 0x26
.set AS_Squat, 0x27
.set AS_SquatWait, 0x28
.set AS_SquatRv, 0x29
.set AS_Landing, 0x2A
.set AS_LandingFallSpecial, 0x2B
.set AS_Attack11, 0x2C
.set AS_Attack12, 0x2D
.set AS_Attack13, 0x2E
.set AS_Attack100Start, 0x2F
.set AS_Attack100Loop, 0x30
.set AS_Attack100End, 0x31
.set AS_AttackDash, 0x32
.set AS_AttackS3Hi, 0x33
.set AS_AttackS3HiS, 0x34
.set AS_AttackS3S, 0x35
.set AS_AttackS3LwS, 0x36
.set AS_AttackS3Lw, 0x37
.set AS_AttackHi3, 0x38
.set AS_AttackLw3, 0x39
.set AS_AttackS4Hi, 0x3A
.set AS_AttackS4HiS, 0x3B
.set AS_AttackS4S, 0x3C
.set AS_AttackS4LwS, 0x3D
.set AS_AttackS4Lw, 0x3E
.set AS_AttackHi4, 0x3F
.set AS_AttackLw4, 0x40
.set AS_AttackAirN, 0x41
.set AS_AttackAirF, 0x42
.set AS_AttackAirB, 0x43
.set AS_AttackAirHi, 0x44
.set AS_AttackAirLw, 0x45
.set AS_LandingAirN, 0x46
.set AS_LandingAirF, 0x47
.set AS_LandingAirB, 0x48
.set AS_LandingAirHi, 0x49
.set AS_LandingAirLw, 0x4A
.set AS_DamageHi1, 0x4B
.set AS_DamageHi2, 0x4C
.set AS_DamageHi3, 0x4D
.set AS_DamageN1, 0x4E
.set AS_DamageN2, 0x4F
.set AS_DamageN3, 0x50
.set AS_DamageLw1, 0x51
.set AS_DamageLw2, 0x52
.set AS_DamageLw3, 0x53
.set AS_DamageAir1, 0x54
.set AS_DamageAir2, 0x55
.set AS_DamageAir3, 0x56
.set AS_DamageFlyHi, 0x57
.set AS_DamageFlyN, 0x58
.set AS_DamageFlyLw, 0x59
.set AS_DamageFlyTop, 0x5A
.set AS_DamageFlyRoll, 0x5B
.set AS_LightGet, 0x5C
.set AS_HeavyGet, 0x5D
.set AS_LightThrowF, 0x5E
.set AS_LightThrowB, 0x5F
.set AS_LightThrowHi, 0x60
.set AS_LightThrowLw, 0x61
.set AS_LightThrowDash, 0x62
.set AS_LightThrowDrop, 0x63
.set AS_LightThrowAirF, 0x64
.set AS_LightThrowAirB, 0x65
.set AS_LightThrowAirHi, 0x66
.set AS_LightThrowAirLw, 0x67
.set AS_HeavyThrowF, 0x68
.set AS_HeavyThrowB, 0x69
.set AS_HeavyThrowHi, 0x6A
.set AS_HeavyThrowLw, 0x6B
.set AS_LightThrowF4, 0x6C
.set AS_LightThrowB4, 0x6D
.set AS_LightThrowHi4, 0x6E
.set AS_LightThrowLw4, 0x6F
.set AS_LightThrowAirF4, 0x70
.set AS_LightThrowAirB4, 0x71
.set AS_LightThrowAirHi4, 0x72
.set AS_LightThrowAirLw4, 0x73
.set AS_HeavyThrowF4, 0x74
.set AS_HeavyThrowB4, 0x75
.set AS_HeavyThrowHi4, 0x76
.set AS_HeavyThrowLw4, 0x77
.set AS_SwordSwing1, 0x78
.set AS_SwordSwing3, 0x79
.set AS_SwordSwing4, 0x7A
.set AS_SwordSwingDash, 0x7B
.set AS_BatSwing1, 0x7C
.set AS_BatSwing3, 0x7D
.set AS_BatSwing4, 0x7E
.set AS_BatSwingDash, 0x7F
.set AS_ParasolSwing1, 0x80
.set AS_ParasolSwing3, 0x81
.set AS_ParasolSwing4, 0x82
.set AS_ParasolSwingDash, 0x83
.set AS_HarisenSwing1, 0x84
.set AS_HarisenSwing3, 0x85
.set AS_HarisenSwing4, 0x86
.set AS_HarisenSwingDash, 0x87
.set AS_StarRodSwing1, 0x88
.set AS_StarRodSwing3, 0x89
.set AS_StarRodSwing4, 0x8A
.set AS_StarRodSwingDash, 0x8B
.set AS_LipStickSwing1, 0x8C
.set AS_LipStickSwing3, 0x8D
.set AS_LipStickSwing4, 0x8E
.set AS_LipStickSwingDash, 0x8F
.set AS_ItemParasolOpen, 0x90
.set AS_ItemParasolFall, 0x91
.set AS_ItemParasolFallSpecial, 0x92
.set AS_ItemParasolDamageFall, 0x93
.set AS_LGunShoot, 0x94
.set AS_LGunShootAir, 0x95
.set AS_LGunShootEmpty, 0x96
.set AS_LGunShootAirEmpty, 0x97
.set AS_FireFlowerShoot, 0x98
.set AS_FireFlowerShootAir, 0x99
.set AS_ItemScrew, 0x9A
.set AS_ItemScrewAir, 0x9B
.set AS_DamageScrew, 0x9C
.set AS_DamageScrewAir, 0x9D
.set AS_ItemScopeStart, 0x9E
.set AS_ItemScopeRapid, 0x9F
.set AS_ItemScopeFire, 0xA0
.set AS_ItemScopeEnd, 0xA1
.set AS_ItemScopeAirStart, 0xA2
.set AS_ItemScopeAirRapid, 0xA3
.set AS_ItemScopeAirFire, 0xA4
.set AS_ItemScopeAirEnd, 0xA5
.set AS_ItemScopeStartEmpty, 0xA6
.set AS_ItemScopeRapidEmpty, 0xA7
.set AS_ItemScopeFireEmpty, 0xA8
.set AS_ItemScopeEndEmpty, 0xA9
.set AS_ItemScopeAirStartEmpty, 0xAA
.set AS_ItemScopeAirRapidEmpty, 0xAB
.set AS_ItemScopeAirFireEmpty, 0xAC
.set AS_ItemScopeAirEndEmpty, 0xAD
.set AS_LiftWait, 0xAE
.set AS_LiftWalk1, 0xAF
.set AS_LiftWalk2, 0xB0
.set AS_LiftTurn, 0xB1
.set AS_GuardOn, 0xB2
.set AS_Guard, 0xB3
.set AS_GuardOff, 0xB4
.set AS_GuardSetOff, 0xB5
.set AS_GuardReflect, 0xB6
.set AS_DownBoundU, 0xB7
.set AS_DownWaitU, 0xB8
.set AS_DownDamageU, 0xB9
.set AS_DownStandU, 0xBA
.set AS_DownAttackU, 0xBB
.set AS_DownFowardU, 0xBC
.set AS_DownBackU, 0xBD
.set AS_DownSpotU, 0xBE
.set AS_DownBoundD, 0xBF
.set AS_DownWaitD, 0xC0
.set AS_DownDamageD, 0xC1
.set AS_DownStandD, 0xC2
.set AS_DownAttackD, 0xC3
.set AS_DownFowardD, 0xC4
.set AS_DownBackD, 0xC5
.set AS_DownSpotD, 0xC6
.set AS_Passive, 0xC7
.set AS_PassiveStandF, 0xC8
.set AS_PassiveStandB, 0xC9
.set AS_PassiveWall, 0xCA
.set AS_PassiveWallJump, 0xCB
.set AS_PassiveCeil, 0xCC
.set AS_ShieldBreakFly, 0xCD
.set AS_ShieldBreakFall, 0xCE
.set AS_ShieldBreakDownU, 0xCF
.set AS_ShieldBreakDownD, 0xD0
.set AS_ShieldBreakStandU, 0xD1
.set AS_ShieldBreakStandD, 0xD2
.set AS_FuraFura, 0xD3
.set AS_Catch, 0xD4
.set AS_CatchPull, 0xD5
.set AS_CatchDash, 0xD6
.set AS_CatchDashPull, 0xD7
.set AS_CatchWait, 0xD8
.set AS_CatchAttack, 0xD9
.set AS_CatchCut, 0xDA
.set AS_ThrowF, 0xDB
.set AS_ThrowB, 0xDC
.set AS_ThrowHi, 0xDD
.set AS_ThrowLw, 0xDE
.set AS_CapturePulledHi, 0xDF
.set AS_CaptureWaitHi, 0xE0
.set AS_CaptureDamageHi, 0xE1
.set AS_CapturePulledLw, 0xE2
.set AS_CaptureWaitLw, 0xE3
.set AS_CaptureDamageLw, 0xE4
.set AS_CaptureCut, 0xE5
.set AS_CaptureJump, 0xE6
.set AS_CaptureNeck, 0xE7
.set AS_CaptureFoot, 0xE8
.set AS_EscapeF, 0xE9
.set AS_EscapeB, 0xEA
.set AS_Escape, 0xEB
.set AS_EscapeAir, 0xEC
.set AS_ReboundStop, 0xED
.set AS_Rebound, 0xEE
.set AS_ThrownF, 0xEF
.set AS_ThrownB, 0xF0
.set AS_ThrownHi, 0xF1
.set AS_ThrownLw, 0xF2
.set AS_ThrownLwWomen, 0xF3
.set AS_Pass, 0xF4
.set AS_Ottotto, 0xF5
.set AS_OttottoWait, 0xF6
.set AS_FlyReflectWall, 0xF7
.set AS_FlyReflectCeil, 0xF8
.set AS_StopWall, 0xF9
.set AS_StopCeil, 0xFA
.set AS_MissFoot, 0xFB
.set AS_CliffCatch, 0xFC
.set AS_CliffWait, 0xFD
.set AS_CliffClimbSlow, 0xFE
.set AS_CliffClimbQuick, 0xFF
.set AS_CliffAttackSlow, 0x100
.set AS_CliffAttackQuick, 0x101
.set AS_CliffEscapeSlow, 0x102
.set AS_CliffEscapeQuick, 0x103
.set AS_CliffJumpSlow1, 0x104
.set AS_CliffJumpSlow2, 0x105
.set AS_CliffJumpQuick1, 0x106
.set AS_CliffJumpQuick2, 0x107
.set AS_AppealR, 0x108
.set AS_AppealL, 0x109
.set AS_ShoulderedWait, 0x10A
.set AS_ShoulderedWalkSlow, 0x10B
.set AS_ShoulderedWalkMiddle, 0x10C
.set AS_ShoulderedWalkFast, 0x10D
.set AS_ShoulderedTurn, 0x10E
.set AS_ThrownFF, 0x10F
.set AS_ThrownFB, 0x110
.set AS_ThrownFHi, 0x111
.set AS_ThrownFLw, 0x112
.set AS_CaptureCaptain, 0x113
.set AS_CaptureYoshi, 0x114
.set AS_YoshiEgg, 0x115
.set AS_CaptureKoopa, 0x116
.set AS_CaptureDamageKoopa, 0x117
.set AS_CaptureWaitKoopa, 0x118
.set AS_ThrownKoopaF, 0x119
.set AS_ThrownKoopaB, 0x11A
.set AS_CaptureKoopaAir, 0x11B
.set AS_CaptureDamageKoopaAir, 0x11C
.set AS_CaptureWaitKoopaAir, 0x11D
.set AS_ThrownKoopaAirF, 0x11E
.set AS_ThrownKoopaAirB, 0x11F
.set AS_CaptureKirby, 0x120
.set AS_CaptureWaitKirby, 0x121
.set AS_ThrownKirbyStar, 0x122
.set AS_ThrownCopyStar, 0x123
.set AS_ThrownKirby, 0x124
.set AS_BarrelWait, 0x125
.set AS_Bury, 0x126
.set AS_BuryWait, 0x127
.set AS_BuryJump, 0x128
.set AS_DamageSong, 0x129
.set AS_DamageSongWait, 0x12A
.set AS_DamageSongRv, 0x12B
.set AS_DamageBind, 0x12C
.set AS_CaptureMewtwo, 0x12D
.set AS_CaptureMewtwoAir, 0x12E
.set AS_ThrownMewtwo, 0x12F
.set AS_ThrownMewtwoAir, 0x130
.set AS_WarpStarJump, 0x131
.set AS_WarpStarFall, 0x132
.set AS_HammerWait, 0x133
.set AS_HammerWalk, 0x134
.set AS_HammerTurn, 0x135
.set AS_HammerKneeBend, 0x136
.set AS_HammerFall, 0x137
.set AS_HammerJump, 0x138
.set AS_HammerLanding, 0x139
.set AS_KinokoGiantStart, 0x13A
.set AS_KinokoGiantStartAir, 0x13B
.set AS_KinokoGiantEnd, 0x13C
.set AS_KinokoGiantEndAir, 0x13D
.set AS_KinokoSmallStart, 0x13E
.set AS_KinokoSmallStartAir, 0x13F
.set AS_KinokoSmallEnd, 0x140
.set AS_KinokoSmallEndAir, 0x141
.set AS_Entry, 0x142
.set AS_EntryStart, 0x143
.set AS_EntryEnd, 0x144
.set AS_DamageIce, 0x145
.set AS_DamageIceJump, 0x146
.set AS_CaptureMasterhand, 0x147
.set AS_CapturedamageMasterhand, 0x148
.set AS_CapturewaitMasterhand, 0x149
.set AS_ThrownMasterhand, 0x14A
.set AS_CaptureKirbyYoshi, 0x14B
.set AS_KirbyYoshiEgg, 0x14C
.set AS_CaptureLeadead, 0x14D
.set AS_CaptureLikelike, 0x14E
.set AS_DownReflect, 0x14F
.set AS_CaptureCrazyhand, 0x150
.set AS_CapturedamageCrazyhand, 0x151
.set AS_CapturewaitCrazyhand, 0x152
.set AS_ThrownCrazyhand, 0x153
.set AS_BarrelCannonWait, 0x154

################################################################################
# Scene IDs
################################################################################

.set titleScreenID,0x00
.set mainMenuID,0x01
.set VSModeID,0x02
.set classicModeID,0x03
.set adventureModeID,0x04
.set allStarModeID,0x05
.set mainDebugMenuID,0x06
.set soundTestDebugMenuID,0x07
.set hanyuTestCSSID,0x08
.set hanyuTestSSSID,0x09
.set cameraModeMemcardPromptID,0x0A
.set trophyGalleryID,0x0B
.set trophyLotteryID,0x0C
.set trophyCollectionID,0x0D
.set debugDiarantouID,0x0E
.set targetTestID,0x0F
.set superSuddenDeathID,0x10
.set invisibleMeleeID,0x11
.set sloMoMeleeID,0x12
.set lightningMeleeID,0x13
.set challengerApproachingID,0x14
.set classicModeEndingID,0x15
.set adventureModeEndingID,0x16
.set allStarModeEndingID,0x17
.set openingMovieID,0x18
.set visualSceneDebugID,0x19
.set onePEndingDebugID,0x1A
.set tournamentModeID,0x1B
.set trainingModeID,0x1C
.set tinyMeleeID,0x1D
.set giantMeleeID,0x1E
.set staminaModeID,0x1F
.set homeRunContestID,0x20
.set tenManMeleeID,0x21
.set hundredManMeleeID,0x22
.set threeMinuteMeleeID,0x23
.set fifteenMinuteMeleeID,0x24
.set endlessMeleeID,0x25
.set cruelMeleeID,0x26
.set progressiveScanPromptID,0x27
.set bootUpID,0x28
.set memcardPropmtID,0x29
.set fixedCameraID,0x2A
.set eventModeID,0x2B
.set singleButtonID,0x2C











































































































































































































































#Slippi stuff lol

.macro getMinorMajor reg
lis \reg, 0x8048 # load address to offset from for scene controller
lwz \reg, -0x62D0(\reg) # Load from 0x80479D30 (scene controller)
rlwinm \reg, \reg, 8, 0xFFFF # Loads major and minor scene into bottom of reg
.endm

################################################################################
# Settings
################################################################################
# STG_EXIIndex is now set during build with arg -defsym STG_EXIIndex=1
#.set STG_EXIIndex, 1 # 0 is SlotA, 1 is SlotB. Indicates which slot to use

.set STG_DesyncDebug, 0 # Debug flag for OSReporting desyncs

################################################################################
# Static Function Locations
################################################################################
# Local functions (added by us)
.set FN_EXITransferBuffer,0x800055f0
.set FN_GetIsFollower,0x800055f8
.set FN_ProcessGecko,0x800055fc

# The rest of these are NTSC v1.02 functions
## HSD functions
.set HSD_Randi,0x80380580
.set HSD_MemAlloc,0x8037f1e4
.set HSD_Free,0x8037f1b0
.set HSD_PadFlushQueue,0x80376d04
.set HSD_StartRender,0x80375538
.set HSD_VICopyXFBASync,0x803761c0
.set HSD_PadRumbleActiveID,0x80378430

## GObj functions
.set GObj_Create,0x803901f0
.set GObj_Initialize,0x80390b68
.set GObj_Destroy,0x80390228
.set GObj_AddProc,0x8038fd54
.set GObj_RemoveProc,0x8038fed4

## Text functions
.set Text_CreateStruct,0x803a6754
.set Text_InitializeSubtext,0x803a6b98
.set Text_UpdateSubtextSize,0x803a7548
.set Text_ChangeTextColor,0x803a74f0
.set Text_DrawEachFrame,0x803a84bc
.set Text_UpdateSubtextContents,0x803a70a0
.set Text_RemoveText,0x803a5cc4

## EXI functions
.set EXIAttach,0x803464c0
.set EXILock,0x80346d80
.set EXISelect,0x80346688
.set EXIDma,0x80345e60
.set EXISync,0x80345f4c
.set EXIDeselect,0x803467b4
.set EXIUnlock,0x80346e74
.set EXIDetach,0x803465cc

## Nametag data functions
.set Nametag_LoadSlotText,0x8023754c
.set Nametag_SetNameAsInUse,0x80237a04
.set Nametag_GetNametagBlock,0x8015cc9c

## VI/GX functions
.set GXInvalidateVtxCache,0x8033c898
.set GXInvalidateTexAll,0x8033f270
.set VIWaitForRetrace,0x8034f314
.set VISetBlack,0x80350100

## Common/memory management
.set OSReport,0x803456a8
.set memcpy,0x800031f4
.set strcpy,0x80325a50
.set Zero_AreaLength,0x8000c160
.set TRK_flush_cache,0x80328f50
.set FileLoad_ToPreAllocatedSpace,0x80016580
.set DiscError_ResumeGame,0x80024f6c

## PlayerBlock/game-state related functions
.set PlayerBlock_LoadStaticBlock,0x80031724
.set PlayerBlock_UpdateCoords,0x80032828
.set PlayerBlock_LoadExternalCharID,0x80032330
.set PlayerBlock_LoadRemainingStocks,0x80033bd8
.set PlayerBlock_LoadSlotType,0x8003241c
.set PlayerBlock_LoadDataOffsetStart,0x8003418c
.set PlayerBlock_LoadTeamID,0x80033370
.set PlayerBlock_StoreInitialCoords,0x80032768
.set PlayerBlock_LoadPlayerXPosition,0x800326cc
.set PlayerBlock_UpdateFacingDirection,0x80033094
.set PlayerBlock_LoadMainCharDataOffset,0x80034110
.set SpawnPoint_GetXYZFromSpawnID,0x80224e64
.set Damage_UpdatePercent,0x8006cc7c
.set MatchEnd_GetWinningTeam,0x801654a0

## Camera functions
.set Camera_UpdatePlayerCameraBox,0x800761c8
.set Camera_CorrectPosition,0x8002f3ac

## Audio/SFX functions
.set Audio_AdjustMusicSFXVolume,0x80025064
.set SFX_Menu_CommonSound,0x80024030

## Scene/input-related functions
.set MenuController_ChangeScreenMinor,0x801a4b60
.set SinglePlayerModeCheck,0x8016b41c
.set CheckIfGameEnginePaused,0x801a45e8
.set Inputs_GetPlayerHeldInputs,0x801a3680
.set Rumble_StoreRumbleFlag,0x8015ed4c

## Miscellenia/Unsorted
.set fetchAnimationHeader,0x80085fd4
.set Obj_ChangeRotation_Yaw,0x8007592c
.set NoContestOrRetry_,0x8016cf4c
.set Character_GetMaxCostumeCount,0x80169238


################################################################################
# Const Definitions
################################################################################
# For EXI transfers
.set CONST_ExiRead, 0 # arg value to make an EXI read
.set CONST_ExiWrite, 1 # arg value to make an EXI write

.set GeckoCodeSectionStart,0x800028c0

.set RtocAddress, 0x804df9e0

.set ControllerFixOptions,0xDD8 # Each byte at offset is a player's setting
.set UCFTextPointers,0x4fa0

.set DashbackOptions,0xDD4 # Offset for dashback-specific settings (playback)
.set ShieldDropOptions,0xDD0 # Offset for shielddrop-specific settings (playback)

.set PALToggle,-0xDCC   #offset for whether or not the replay is played with PAL modifications
.set PSPreloadToggle,-0xDC8   #offset for whether or not the replay is played with PS Preload Behavior
.set FSToggle,-0xDC4    #offset for whether or not the replay is played with the Frozen PS toggle
.set HideWaitingForGame,-0xDC0   #offset for whether or not to display the waiting for game text

.set PALToggleAddr, RtocAddress + PALToggle
.set PSPreloadToggleAddr, RtocAddress + PSPreloadToggle
.set FSToggleAddr, RtocAddress + FSToggle
.set HideWaitingForGameAddress, RtocAddress + HideWaitingForGame
.set CFOptionsAddress, RtocAddress - ControllerFixOptions

################################################################################
# Offsets
################################################################################
.set primaryDataBuffer,-0x49b4
.set bufferOffset,-0x49b0
.set frameIndex,-0x49ac

.set STG_EXIIndex,1
