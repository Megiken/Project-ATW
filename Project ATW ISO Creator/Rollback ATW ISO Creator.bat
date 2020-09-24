@echo off
setlocal EnableDelayedExpansion

echo ###############################
echo ##                           ##
echo ##                           ##
echo ##  Rollback ATW ISO Creator ##
echo ##                           ##
echo ##                           ##
echo ###############################
echo.

cd /d %~dp0
cd Stuff

echo If at any point the program appears to be frozen, try hitting enter.
echo.

for /f "delims=" %%a in ('call ini.cmd rollbackatw.ini Path path') do (
    set val=%%a

)

set empty=""
set var1=""
set var2=""
set var3="1"
set var4="1"


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



wget tny.sh/MyVlIs9 -O patch2.vcdiff

echo Finding output file.


for /f "delims=" %%a in ('call ini.cmd rollbackatw.ini Output output') do (
    set val3=%%a

)

if !val3! == !empty! (
  echo Output is empty, please choose where you want to save your Rollback ATW ISO
  for /f "delims=" %%a in ('call folder.cmd') do (
      set val4=%%a
  )
) else if not exist !val3! (
  echo Output is invalid, please choose where you want to save your Rollback ATW ISO
  for /f "delims=" %%a in ('call folder.cmd') do (
      set val4=%%a
  )
) else (
  set val4=%val3%
  echo Found valid file %val4%
)

set val2=%val2:"=%
set val4=%val4:"=%

echo [Path]> rollbackatw.ini
echo path="%val2%">> rollbackatw.ini
echo [Output]>> rollbackatw.ini
echo output="%val4%">> rollbackatw.ini

echo Saving to %val4%
echo.
echo Applying xdelta patch.
echo.



xdelta3.exe -d -vfs "%val2%" "patch2.vcdiff" "%val4%/Rollback ATW.iso"
del /f patch2.vcdiff

echo The program has finished, a Rollback ATW.iso should be placed in your output folder.


pause
