#Include dtwfunctions.ahk

Run, "C:\Users\Thomas\Downloads\Melee Modding\DAT Texture Wizard - v5.5 (x64)\DAT Texture Wizard - v5.5 (x64)\DAT Texture Wizard.exe"

WaitForGamesToBeLoaded()

FetchDTW()
NavigateToActiveDTWMainWindow()
NavigateToSelectISO()
path1 := "C:\Users\Thomas\Downloads\ISOs\Beta ATW.iso"
window1 := "Choose an ISO or GCM file to open."
path2 := "C:\Users\Thomas\Desktop\Project ATW\ATW.dat"
window2 := "Choose a file to import."
pasteText(path1,window1)
clickButton(window1)
sleep 1000
ControlClick, x401 y500,,,WD,30
Click 300,340
WinMenuSelectItem, DAT Texture Wizard - v5.5, , 3&, 3&
pasteText(path2,window2)
clickButton(window2)
WinMenuSelectItem, DAT Texture Wizard - v5.5, , 1&, 8&
sleep 1000
WinMenuSelectItem, DAT Texture Wizard - v5.5, , 1&, 11&
