@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building onboot.json...
gecko build -c onboot.json...
echo.
