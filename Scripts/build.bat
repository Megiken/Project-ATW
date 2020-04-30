@echo off

echo Building atw.json...
gecko build -c atw.json
echo.

echo Building duelist pro.json...
gecko build -c duelistpro.json
echo.

echo Building koth.json...
gecko build -c koth.json
echo.

echo Building ironman.json...
gecko build -c ironman.json
echo.

echo Building netplay.json...
gecko build -c netplay.json
echo.

echo Building slippi+extras.json...
gecko build -c slippi+extras.json...
echo.

echo Building onboot.json...
gecko build -c onboot.json...
echo.

echo Creating ATW DAT...
java -jar CodeConverter.jar -c "C:\Users\Thomas\Desktop\Project ATW\Output\ATW Codes.txt" -o "C:\Users\Thomas\Desktop\Project ATW\Files\ATW.dat"
echo.

echo Creating DP DAT...
java -jar CodeConverter.jar -c "C:\Users\Thomas\Desktop\Project ATW\Output\Duelist Pro.txt" -o "C:\Users\Thomas\Desktop\Project ATW\Files\DP.dat"
echo.

echo Creating KOTH DAT...
java -jar CodeConverter.jar -c "C:\Users\Thomas\Desktop\Project ATW\Output\KOTH.txt" -o "C:\Users\Thomas\Desktop\Project ATW\Files\KTH.dat"
echo.

echo Creating Iron Man DAT...
java -jar CodeConverter.jar -c "C:\Users\Thomas\Desktop\Project ATW\Output\ironman.txt" -o "C:\Users\Thomas\Desktop\Project ATW\Files\IM.dat"
echo.

echo Creating Slippi + Extras DAT...
java -jar CodeConverter.jar -c "C:\Users\Thomas\Desktop\Project ATW\Output\Slippi + Extras.txt" -o "C:\Users\Thomas\Desktop\Project ATW\Files\S+E.dat"
echo.
