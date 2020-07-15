@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building debugmenu.json...
gecko build -c debugmenu.json...
echo.

echo Creating Debug Menu DAT...
java -jar CodeConverter.jar -c "..\Output\DebugMenu.txt" -o "..\Files\Custom Code\DBM.dat" -d
echo.
