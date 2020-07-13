@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building squadstrike.json...
gecko build -c squadstrike.json
echo.

echo Creating Squad Strike DAT...
java -jar CodeConverter.jar -c "..\Output\Squad strike.txt" -o "..\Files\Custom Code\SS.dat"
echo.
