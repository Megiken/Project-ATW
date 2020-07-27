@echo off

cd /d %~dp0
cd "../../Scripts"

echo Building dependencies.json...
gecko build -c dependencies.json...
echo.
