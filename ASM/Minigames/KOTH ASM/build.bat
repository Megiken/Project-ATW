@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building koth.json...
gecko build -c koth.json
echo.

echo Creating KOTH DAT...
java -jar CodeConverter.jar -c "..\Output\KOTH.txt" -o "..\Files\Custom Code\KTH.dat"
echo.
