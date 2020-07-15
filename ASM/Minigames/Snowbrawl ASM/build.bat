@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building snowbrawl.json...
gecko build -c snowbrawl.json
echo.

echo Creating Snowbrawl DAT...
java -jar CodeConverter.jar -c "..\Output\snowbrawl.txt" -o "..\Files\Custom Code\SB.dat"
echo.
