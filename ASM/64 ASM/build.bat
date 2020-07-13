@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building Smash64.json...
gecko build -c Smash64.json
echo.

echo Creating Smash 64 DAT...
java -jar CodeConverter.jar -c "..\Output\Smash 64.txt" -o "..\Files\Custom Code\S64.dat"
echo.
