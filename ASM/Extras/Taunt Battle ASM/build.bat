@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building tauntbattle.json...
gecko build -c tauntbattle.json
echo.

echo Creating Taunt Battle DAT...
java -jar CodeConverter.jar -c "..\Output\taunt battle.txt" -o "..\Files\Custom Code\TB.dat"
echo.
