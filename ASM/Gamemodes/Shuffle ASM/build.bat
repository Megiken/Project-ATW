@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building shuffle.json...
gecko build -c shuffle.json
echo.

echo Creating Shuffle DAT...
java -jar CodeConverter.jar -c "..\Output\shuffle.txt" -o "..\Files\Custom Code\SFL.dat"
echo.
