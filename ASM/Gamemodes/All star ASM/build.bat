@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building All Star.json...
gecko build -c Allstar.json
echo.

echo Creating All Star DAT...
java -jar CodeConverter.jar -c "..\Output\Allstar.txt" -o "..\Files\Custom Code\AS.dat"
echo.
