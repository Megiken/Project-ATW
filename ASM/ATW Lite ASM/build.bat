@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building ATWLite.json...
gecko build -c ATWLite.json...
echo.

echo Creating ATW Lite DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Lite.txt" -o "..\Files\Custom Code\AWL.dat"
echo.
