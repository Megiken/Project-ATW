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

for /f "delims=" %%a in ('call ini.cmd ini.ini Path path') do (
    set val=%%a

)


set empty=""
if !val! == !empty! (
set pwshcmd=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
for /f "delims=" %%I in ('%pwshcmd%') do set "FileName=%%I"
)
echo.





pause
