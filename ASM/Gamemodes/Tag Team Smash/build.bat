@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building tagteam.json...
gecko build -c tagteam.json
echo.

echo Creating Tag Team DAT...
java -jar CodeConverter.jar -c "..\Output\tagteam.txt" -o "..\Files\Custom Code\TT.dat"
echo.
