@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building capturetheflag.json...
gecko build -c capturetheflag.json
echo.

echo Creating Capture the Flag DAT...
java -jar CodeConverter.jar -c "..\Output\capturetheflag.txt" -o "..\Files\Custom Code\CTF.dat"
echo.
