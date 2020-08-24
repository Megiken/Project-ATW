@echo off

cd /d %~dp0
cd "../Scripts"

echo Building atw.json...
gecko build -c atw.json
echo.

echo Building ATWLite.json...
gecko build -c ATWLite.json...
echo.

echo Building ATWFreestyle.json...
gecko build -c ATWFreestyle.json...
echo.

echo Building duelist pro.json...
gecko build -c duelistpro.json
echo.

echo Building koth.json...
gecko build -c koth.json
echo.

echo Building ironman.json...
gecko build -c ironman.json
echo.

echo Building squadstrike.json...
gecko build -c squadstrike.json
echo.

echo Building Smash64.json...
gecko build -c Smash64.json
echo.

echo Building Brawl.json...
gecko build -c Brawl.json
echo.

echo Building tagteam.json...
gecko build -c tagteam.json
echo.

echo Building synergysingles.json
gecko build -c synergysingles.json
echo.

echo Building createyourownplatforms.json...
gecko build -c createyourownplatforms.json
echo.

echo Building brettsblastzonewarp.json...
gecko build -c brettsblastzonewarp.json
echo.

echo Building mrsaturnsoccer.json...
gecko build -c mrsaturnsoccer.json
echo.

echo Building snowbrawl.json...
gecko build -c snowbrawl.json
echo.

echo Building oneinthechamber.json...
gecko build -c oneinthechamber.json
echo.

echo Building infinitejumpzone.json...
gecko build -c infinitejumpzone.json
echo.

echo Building volleyball.json...
gecko build -c volleyball.json
echo.

echo Building basketball.json...
gecko build -c basketball.json
echo.

echo Building capturetheflag.json...
gecko build -c capturetheflag.json
echo.

echo Building chessmelee.json...
gecko build -c chessmelee.json
echo.

echo Building dual1v1.json...
gecko build -c dual1v1.json
echo.

echo Building tauntbattle.json...
gecko build -c tauntbattle.json
echo.

echo Building slippi+extras.json...
gecko build -c slippi+extras.json...
echo.

echo Building debugmenu.json...
gecko build -c debugmenu.json...
echo.

echo Building onboot.json...
gecko build -c onboot.json...
echo.

echo Creating ATW DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Codes.txt" -o "..\Files\Custom Code\ATW.dat"
echo.

echo Creating ATW Lite DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Lite.txt" -o "..\Files\Custom Code\AWL.dat"
echo.

echo Creating ATW Freestyle DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Freestyle.txt" -o "..\Files\Custom Code\AWF.dat"
echo.

echo Creating DP DAT...
java -jar CodeConverter.jar -c "..\Output\Duelist Pro.txt" -o "..\Files\Custom Code\DP.dat"
echo.

echo Creating KOTH DAT...
java -jar CodeConverter.jar -c "..\Output\KOTH.txt" -o "..\Files\Custom Code\KTH.dat"
echo.

echo Creating Iron Man DAT...
java -jar CodeConverter.jar -c "..\Output\ironman.txt" -o "..\Files\Custom Code\IM.dat"
echo.

echo Creating Squad Strike DAT...
java -jar CodeConverter.jar -c "..\Output\Squad strike.txt" -o "..\Files\Custom Code\SS.dat"
echo.

echo Creating Smash 64 DAT...
java -jar CodeConverter.jar -c "..\Output\Smash 64.txt" -o "..\Files\Custom Code\S64.dat"
echo.

echo Creating Brawl DAT...
java -jar CodeConverter.jar -c "..\Output\Brawl.txt" -o "..\Files\Custom Code\BRL.dat"
echo.

echo Creating Tag Team DAT...
java -jar CodeConverter.jar -c "..\Output\tagteam.txt" -o "..\Files\Custom Code\TT.dat"
echo.

echo Creating Synergy Singles DAT...
java -jar CodeConverter.jar -c "..\Output\synergysingles.txt" -o "..\Files\Custom Code\SYN.dat"
echo.

echo Creating Create your own Platforms DAT...
java -jar CodeConverter.jar -c "..\Output\cyop.txt" -o "..\Files\Custom Code\CYP.dat"
echo.

echo Creating Bretts Blastzone Warp DAT...
java -jar CodeConverter.jar -c "..\Output\brett.txt" -o "..\Files\Custom Code\BBW.dat"
echo.

echo Creating Mr Saturn Soccer DAT...
java -jar CodeConverter.jar -c "..\Output\soccer.txt" -o "..\Files\Custom Code\MSS.dat"
echo.

echo Creating Snowbrawl DAT...
java -jar CodeConverter.jar -c "..\Output\snowbrawl.txt" -o "..\Files\Custom Code\SB.dat"
echo.

echo Creating One in the Chamber DAT...
java -jar CodeConverter.jar -c "..\Output\chamber.txt" -o "..\Files\Custom Code\OTC.dat"
echo.

echo Creating Infinite Jump Zone DAT...
java -jar CodeConverter.jar -c "..\Output\infinitejumps.txt" -o "..\Files\Custom Code\IJZ.dat"
echo.

echo Creating Volleyball DAT...
java -jar CodeConverter.jar -c "..\Output\volleyball.txt" -o "..\Files\Custom Code\VB.dat"
echo.

echo Creating Basketball DAT...
java -jar CodeConverter.jar -c "..\Output\basketball.txt" -o "..\Files\Custom Code\BB.dat"
echo.

echo Creating Capture the Flag DAT...
java -jar CodeConverter.jar -c "..\Output\capturetheflag.txt" -o "..\Files\Custom Code\CTF.dat"
echo.

echo Creating Chess Melee DAT...
java -jar CodeConverter.jar -c "..\Output\chess melee.txt" -o "..\Files\Custom Code\CM.dat"
echo.

echo Creating Dual 1v1 DAT...
java -jar CodeConverter.jar -c "..\Output\dual 1v1.txt" -o "..\Files\Custom Code\1v1.dat"
echo.

echo Creating Taunt Battle DAT...
java -jar CodeConverter.jar -c "..\Output\taunt battle.txt" -o "..\Files\Custom Code\TB.dat"
echo.

echo Creating Slippi + Extras DAT...
java -jar CodeConverter.jar -c "..\Output\Slippi + Extras.txt" -o "..\Files\Custom Code\GNL.dat"
echo.

echo Creating Debug Menu DAT...
java -jar CodeConverter.jar -c "..\Output\DebugMenu.txt" -o "..\Files\Custom Code\DBM.dat" -d
echo.
