@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building createyourownplatforms.json...
gecko build -c createyourownplatforms.json
echo.

echo Creating Create your own Platforms DAT...
java -jar CodeConverter.jar -c "..\Output\cyop.txt" -o "..\Files\Custom Code\CYP.dat"
echo.
