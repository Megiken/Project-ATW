@echo off

echo ###############################
echo ##                           ##
echo ##                           ##
echo ##  Project ATW ISO Creator  ##
echo ##                           ##
echo ##                           ##
echo ###############################
echo.

cd /d %~dp0
cd Stuff

echo Downloading xdelta patch...
echo This may take however long it takes you to download 400mb.
echo.

wget https://tny.sh/o6pkzUd -O patch.vcdiff

echo Applying patch...
echo This may take 1-2 minutes.
echo.

xdelta3.exe -d -vfs %1 "patch.vcdiff" "../Project ATW.iso"

del /f patch.vcdiff

echo.
echo Done!
echo The file is located in the folder. Enjoy!
echo You can close this window.

pause
