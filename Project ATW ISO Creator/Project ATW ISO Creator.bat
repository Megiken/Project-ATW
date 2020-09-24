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

for /f "delims=" %%a in ('call ini.cmd projectatw.ini Path path') do (
    set val=%%a

)

set empty=""
if !val! == !empty! (
  echo Path is empty, please choose your Melee V1.02 ISO
  for /f "delims=" %%a in ('call thing.cmd') do (
      set val2=%%a
  )
) else if not exist !val! (
  echo Path is invalid, please choose your Melee V1.02 ISO
  for /f "delims=" %%a in ('call thing.cmd') do (
      set val2=%%a
  )
) else (
  set val2=%val%
  echo Found valid file %val2%
)

echo Using file !val2!
echo If the process fails from here, make sure that this file is a 1.02 version of melee.
echo.



wget https://tny.sh/o6pkzUd -O patch.vcdiff

echo Finding output file.


for /f "delims=" %%a in ('call ini.cmd projectatw.ini Output output') do (
    set val3=%%a

)

if !val3! == !empty! (
  echo Output is empty, please choose where you want to save your Project ATW ISO
  for /f "delims=" %%a in ('call folder.cmd') do (
      set val4=%%a
  )
) else if not exist !val3! (
  echo Output is invalid, please choose where you want to save your Project ATW ISO
  for /f "delims=" %%a in ('call folder.cmd') do (
      set val4=%%a
  )
) else (
  set val4=%val3%
  echo Found valid file %val4%
)

echo Saving to %val4%
echo.
echo Applying xdelta patch.
echo.

set val2=%val2:"=%
set val4=%val4:"=%

echo [Path]> projectatw.ini
echo path="%val2%">> projectatw.ini
echo [Output]>> projectatw.ini
echo output="%val4%">> projectatw.ini

xdelta3.exe -d -vfs "%val2%" "patch.vcdiff" "%val4%/Project ATW.iso"
del /f patch.vcdiff

echo The program has finished, a Project ATW.iso should be placed in your output folder.


pause
