@echo off

cd /d %~dp0
cd "../Scripts"

echo Building atwmemcard.json...
gecko build -c memcard.json...
echo.
