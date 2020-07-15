@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building ATWFreestyle.json...
gecko build -c ATWFreestyle.json...
echo.

echo Creating ATW Freestyle DAT...
java -jar CodeConverter.jar -c "..\Output\ATW Freestyle.txt" -o "..\Files\Custom Code\AWF.dat"
echo.
