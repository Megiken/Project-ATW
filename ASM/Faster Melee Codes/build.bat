@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building slippi+extras.json...
gecko build -c slippi+extras.json...
echo.

echo Creating Slippi + Extras DAT...
java -jar CodeConverter.jar -c "..\Output\Slippi + Extras.txt" -o "..\Files\Custom Code\S+E.dat"
echo.
