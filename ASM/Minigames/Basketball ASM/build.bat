@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building basketball.json...
gecko build -c basketball.json
echo.

echo Creating Basketball DAT...
java -jar CodeConverter.jar -c "..\Output\basketball.txt" -o "..\Files\Custom Code\BB.dat"
echo.
