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

################################################################################
# Static Function Locations
################################################################################

.set randomI,0x80380580
.set copymem,0x80003244
.set zeromem,0x8000c160
.set playsfx,0x8038cff4
.set countPlayersInMatch,0x8016b558
.set getCharID,0x80032330
.set PlayerBlock_LoadSlotType,0x8003241c
.set PlayerBlock_LoadFalls,0x80034d78
.set PlayerBlock_LoadSDs,0x8003521c
.set CSS_UpdateCSPInfo,0x8025db34
.set DestroyItem,0x8026a8ec
.set EntityItemSpawn,0x80268B18
.set getStageGObj,0x801c2ba4
.set setStageGObj,0x801c2bbc
.set GObjRemove,0x8038fed4


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
.set createGObj,functSpace+0x110



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
.set customStageData, debugSpace+100
.set yoshisFlag, debugSpace+216
.set frozenPokemon, debugSpace+220
.set dreamLandWind, debugSpace+224
.set brinstarLava, debugSpace+228
.set FODflag, debugSpace+232
.set corneriaShips, debugSpace+236
.set corneriaGun, debugSpace+240
.set greenGreensBlocks, debugSpace+244
.set greenGreensTree, debugSpace+248
.set peachCastle, debugSpace+252
.set fdBackground, debugSpace+256
.set mushroomKingdom1Levers, debugSpace+260
.set mushroomKingdom1Blocks, debugSpace+264
.set jungleJapesFlag, debugSpace+268
.set onettCars, debugSpace+272
.set onettDrugstore, debugSpace+276
.set muteCityCars, debugSpace+280
.set kongoJungleBarrel, debugSpace+284
.set kongoJungle64Barrel, debugSpace+288
.set customItemSpawnFlag, debugSpace+292
.set itemSpawnRate, debugSpace+296
.set itemRates, debugSpace+300
.set pokemonRates, debugSpace+440
.set maxItemsOnScreen, debugSpace+556
.set fancyThrowingFlag, debugSpace+560
.set tauntToGainItem, debugSpace+564
.set airGrabs, debugSpace+568
.set airTaunts, debugSpace+572
.set tauntCancel, debugSpace+576
.set fastFallFlag, debugSpace+580
.set invisCeiling, debugSpace+584
.set grabInfinites, debugSpace+588
.set wallBracing, debugSpace+592
.set autoLCancel, debugSpace+596
.set percentSwapFlag , debugSpace+600
.set doublesColours, debugSpace+604
.set walljumpFlag, debugSpace+608
.set climberCloneFlag, debugSpace+612
.set TWODFlag, debugSpace+616
.set ledgeInvincibility, debugSpace+620
.set firstChars, debugSpace+624
.set gameType, debugSpace+640
.set doublesType, debugSpace+644
.set timerVar, debugSpace+648
.set customTimer, debugSpace+652
.set numOfChars, debugSpace+656
.set saveStocks, debugSpace+660
.set IMnumOfChars, debugSpace+664
.set IMcharOrder, debugSpace+668
.set IMbanOrder, debugSpace+672
.set IMplayerMoney, debugSpace+676
.set IMcharCost, debugSpace+680
.set SSnumOfChars, debugSpace+784
.set ARnumOfChars, debugSpace+788
.set bombImpact, debugSpace+792
.set bombExplosion, debugSpace+796
.set gravity, debugSpace+800
.set terminalVelocity, debugSpace+804
.set KOTHgameType, debugSpace+808
.set KOTHmaxScore, debugSpace+812
.set KOTHhillTime, debugSpace+816
.set percentStaminaFlag, debugSpace+820
.set staminaAmount, debugSpace+824
.set sizeFlag, debugSpace+828
.set headFlag, debugSpace+832
.set bodyFlag, debugSpace+836
.set statusFlag, debugSpace+840
.set gravityFlag, debugSpace+844
.set speedFlag, debugSpace+848
.set cameraFlag, debugSpace+852
.set customGamemodeFlag, debugSpace+856
.set BFSkin, debugSpace+860
.set FDSkin, debugSpace+864
.set PSSkin, debugSpace+868
.set YSSkin, debugSpace+872
.set FODSkin, debugSpace+876
.set DreamlandSkin, debugSpace+880
.set CSSSkin, debugSpace+884
.set swordColoursFlag, debugSpace+888











#Other

.set heapStart,0x8065cc60
.set stageData,0x8049e6c8
.set stageID,0x88
.set doublesByte,0x804807c8
.set playerCSSdata1,0x803F0E08
.set playerCSSdata2,0x80480820
.set cssID,0x804a04f3
.set numOfFiles,0x4
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

.set ATWsubmenu,0x8065ea54
.set IMsubmenu,0x8065ef44
.set squadStrikesubmenu,0x8065f8a0
.set allStarsubmenu,0x8065fa0c
.set smash64submenu,0x8065fb78
.set brawlsubmenu,0x8065fbdc
.set sixPlayeMenu,0x8065fc40
.set minigamesMenu,0x8065fca4
.set shuffleMenu,0x80660414
.set extrasMenu,0x80660478

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
.set free2,-0x7c7c
.set free3,-0x7c40
.set free4,-0x7c3c

################################################################################
# rtoc Offsets
################################################################################

.set rtoczero,-0x778c
.set rtocone,-0x76ac
.set rtocnegone,-0x7658
.set rtoctwo,-0x3C30

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
