@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building Brawl.json...
gecko build -c Brawl.json
echo.

echo Creating Brawl DAT...
java -jar CodeConverter.jar -c "..\Output\Brawl.txt" -o "..\Files\Custom Code\BRL.dat"
echo.
