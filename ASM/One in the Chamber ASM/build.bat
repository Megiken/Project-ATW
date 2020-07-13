@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building oneinthechamber.json...
gecko build -c oneinthechamber.json
echo.

echo Creating One in the Chamber DAT...
java -jar CodeConverter.jar -c "..\Output\chamber.txt" -o "..\Files\Custom Code\OTC.dat"
echo.
