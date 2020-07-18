@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building chessmelee.json...
gecko build -c chessmelee.json
echo.

echo Creating Chess Melee DAT...
java -jar CodeConverter.jar -c "..\Output\chess melee.txt" -o "..\Files\Custom Code\CM.dat"
echo.
