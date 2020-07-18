@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building dual1v1.json...
gecko build -c dual1v1.json
echo.

echo Creating Dual 1v1 DAT...
java -jar CodeConverter.jar -c "..\Output\dual 1v1.txt" -o "..\Files\Custom Code\1v1.dat"
echo.
