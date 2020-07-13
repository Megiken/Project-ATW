@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building ironman.json...
gecko build -c ironman.json
echo.

echo Creating Iron Man DAT...
java -jar CodeConverter.jar -c "..\Output\ironman.txt" -o "..\Files\Custom Code\IM.dat"
echo.
