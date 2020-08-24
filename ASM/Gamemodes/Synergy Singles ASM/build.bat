@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building synergysingles.json...
gecko build -c synergysingles.json
echo.

echo Creating Tag Team DAT...
java -jar CodeConverter.jar -c "..\Output\synergysingles.txt" -o "..\Files\Custom Code\SYN.dat"
echo.
