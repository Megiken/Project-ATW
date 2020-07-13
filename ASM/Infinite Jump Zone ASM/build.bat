@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building infinitejumpzone.json...
gecko build -c infinitejumpzone.json
echo.

echo Creating Infinite Jump Zone DAT...
java -jar CodeConverter.jar -c "..\Output\infinitejumps.txt" -o "..\Files\Custom Code\IJZ.dat"
echo.
