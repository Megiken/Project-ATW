@echo off
setlocal EnableDelayedExpansion

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

echo If at any point the program appears to be frozen, try hitting enter.
echo.

for /f "delims=" %%a in ('call ini.cmd ini.ini Path path') do (
    set val=%%a

)

set empty=""
if !val! == !empty! (
  echo Path is empty, please choose your Melee V1.02 ISO
  echo.
  for /f "delims=" %%a in ('call thing.cmd') do (
      set val2=%%a
  )
) else if not exist !val! (
  echo Path is invalid, please choose your Melee V1.02 ISO
  echo.
  for /f "delims=" %%a in ('call thing.cmd') do (
      set val2=%%a
  )
) else (
  set val2=!val!
  echo Found valid file %val2%
  echo.
)

echo Using file !val2!
echo If the process fails from here, make sure that this file is a 1.02 version of melee.


echo [Path]> ini.ini
echo path=!val2!>> ini.ini

wget https://tny.sh/o6pkzUd -O patch.vcdiff
xdelta3.exe -d -vfs "%val2%" "patch.vcdiff" "../Project ATW.iso"
del /f patch.vcdiff

echo The program has finished, a Project ATW.iso should be placed in the main ISO creator folder.


pause
