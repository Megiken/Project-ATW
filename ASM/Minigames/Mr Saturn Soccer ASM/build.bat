@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building mrsaturnsoccer.json...
gecko build -c mrsaturnsoccer.json
echo.

echo Creating Mr Saturn Soccer DAT...
java -jar CodeConverter.jar -c "..\Output\soccer.txt" -o "..\Files\Custom Code\MSS.dat"
echo.
