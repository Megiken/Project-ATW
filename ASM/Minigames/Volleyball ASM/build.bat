@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building volleyball.json...
gecko build -c volleyball.json
echo.

echo Creating Volleyball DAT...
java -jar CodeConverter.jar -c "..\Output\volleyball.txt" -o "..\Files\Custom Code\VB.dat"
echo.
