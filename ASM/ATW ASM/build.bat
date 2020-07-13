@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building atw.json...
gecko build -c atw.json
echo.

echo Creating ATW DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Codes.txt" -o "..\Files\Custom Code\ATW.dat"
echo.
