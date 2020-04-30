#Include json.ahk

FetchDTW(){
    global currentDTWWindow

    attempts := 100

    while (attempts > 0)
    {
            currentDTWWindow := WinExist("DAT Texture Wizard - v5.5")
            if(currentDTWWindow)
            {
                WinWaitActive , ahk_id %currentDTWWindow%, , 2
                Sleep 1

                    if !WinExist( "ahk_id" currentDTWWindow)
                    {
                        sleep 250
                        ;WinActivate
                    }
else{
return true
}
                }


        attempts--
        sleep 150
    }
    return false
}



WaitForGamesToBeLoaded(){
    global currentDTWWindow
    attempts := 1
    success := false

    while( attempts > 0 )
    {
        ControlGet, rowsInGameList, List,Count , TkChild1, ahk_id %currentDTWWindow%
        if (rowsInGameList != 0)
        {
            attempts := 0
            success := true

            break
        }
        else
        {

        }
        sleep 150
        attempts--
    }

    if(success)
    {
        return true
    }
    else
    {
        return false
    }
}

NavigateToActiveDTWMainWindow(){
    global currentDTWWindow
    ;WinActivate, ahk_id %currentDTWWindow% , , 2

    IfWinExist, ahk_id %currentDTWWindow%
    {
        return true
    }
    else
    {
        return false
    }

}


NavigateToSelectISO(){
	global currentDTWWindow
    attempts := 50
    while (attempts > 0)
    {

        if !NavigateToActiveDTWMainWindow()
        {
            attempts--
            sleep 250
            continue
        }

          clickedSelectISO := false

      		WinMenuSelectItem, DAT Texture Wizard - v5.5, , 1&, 3&
          clickedSelectISO := true
          return true



        if(!clickedSelectISO)
        {
            MsgBox, , Not like the others, Could not open the netplay window
            return false
        }


        sleep 1
    }
    return false
}
pasteText(textlol,path){
  lol :=
  lol2 := false
  while (!lol2){
  WinGetTitle, lol
  if(lol = DAT Texture Wizard - v5.5){
    sleep 50
}
  else{
    lol2 = true
  }
}
lolflag1 := false
while(!lolflag1){

ControlSetText, Edit1, %textlol%, %path%
text2 :=
ControlGetText, text2, Edit1, %path%
if(text2 = textlol){
  lolflag1 = true
}
else{
  sleep 50
}



}
return
}

clickButton(windowlol){
  lol :=
  WinGetTitle, lol
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
ControlClick, Button2,%windowlol%
lolflag := false
while(!lolflag){
  if(windowlol != lol){
    lolflag = true
  }
  else{
    sleep 50
  }
}
return
}
