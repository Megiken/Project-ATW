@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building shinebros.json...
gecko build -c shinebros.json
echo.

echo Creating Super Shine Bros DAT...
java -jar CodeConverter.jar -c "..\Output\shinebros.txt" -o "..\Files\Custom Code\SSB.dat"
echo.
