@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building brettsblastzonewarp.json...
gecko build -c brettsblastzonewarp.json
echo.

echo Creating Bretts Blastzone Warp DAT...
java -jar CodeConverter.jar -c "..\Output\brett.txt" -o "..\Files\Custom Code\BBW.dat"
echo.
