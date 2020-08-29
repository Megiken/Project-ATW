@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building flightmode.json...
gecko build -c flightmode.json
echo.

echo Creating Flight Mode DAT...
java -jar CodeConverter.jar -c "..\Output\flightmode.txt" -o "..\Files\Custom Code\FM.dat"
echo.
