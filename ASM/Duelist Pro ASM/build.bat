@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building duelist pro.json...
gecko build -c duelistpro.json
echo.

echo Creating DP DAT...
java -jar CodeConverter.jar -c "..\Output\Duelist Pro.txt" -o "..\Files\Custom Code\DP.dat"
echo.
