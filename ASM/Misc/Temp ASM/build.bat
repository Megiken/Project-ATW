@echo off

cd /d %~dp0
cd "../../../Scripts"

echo Building temp.json...
gecko build -c temp.json
echo.
