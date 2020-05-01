package Main;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Main{
	public static int textSpace = 1651108;
	public static int originalTextSpace = 1651108;
	public static int subMenuSpace = 1662796;
	public static int varSpace = 1650508;
	public static int originalVarSpace = 1650508;
	public static int currentMenuSpace = subMenuSpace;
	public static String[][] done = new String[100][100];
	public static String[] doneoffset = new String[100];
	public static int currentID = 0;
	public static File currentFile = new File("");
	public static String[] stages = {"Dummy","Test","Fountain Of Dreams","Pokemon Stadium","Peach's Castle","Kongo Jungle","Brinstar","Corneria","Yoshi's Story","Onett","Mute City","Rainbow Cruise","Jungle Japes","Great Bay","Hyrule Temple","Brinstar Depths","Yoshi's Island","Green Greens","Fourside","Mushroom Kingdom 1","Mushroom Kingdom 2","Akaneia","Venom","Poke Floats","Big Blue","Icicle Mountain","Icetop","Flatzone","Dreamland","Yoshi's Island N64","Kongo Jungle N64","Battlefield","Final Destination","Mario Target Test","Captain Falcon Target Test","Young link Target Test","Donkey Kong Target Test","Dr Mario Target Test","Falco Target Test","Fox Target Test","Ice Climbers Target Test","Kirby Target Test","Bowser Target Test","Link Target Test","Luigi Target Test","Marth Target Test","Mewtwo Target Test","Ness Target Test","Peach Target Test","Pichu Target Test","Pikachu Target Test","Jigglypuff Target Test","Samus Target Test","Sheik Target Test","Yoshi Target Test","Zelda Target Test","Mr Game and watch Target Test","Roy Target Test","Ganondorf Target Test","Majoras Mask","Entei","Goomba","Mount Olympus","All star rest","Home run contest","Escape Shaft","Race to the finish","Duelist pro stage","Event 32 Corneria","Legal Rainbow Cruise","Legal Green Greens","Legal big blue","Legal Peach's Castle","Legal Yoshi's island","Legal Jungle Japes","Legal Great Bay","Legal Mushroom Kindom 2","Legal Yoshi's Island N64","Legal Kongo Jungle","Smashville fourside","Skyrule","Kirby Ware","Long FD","Lylat Cruise","Nintendo Gamecube","Kalos Pokemon League","Wario Ware Inc","Hyrule Castle","Suzaku Castle","Metal Cavern M","Metroid Lab","Battlefino Plaza","Smash 4 Battlefield","Miiverse","Splattlefino Plaza","Smash 4 FD","Saffron City","75m","Wario land"};
	public static String myFile = "C:/Users/Thomas/Desktop/Project ATW/ASM/Faster Melee Codes/Addons/Debug Menu/";
	public static String text = "";
	public static String var = "";
	public static String eighty = "80";
	public static String[] chars = {"Random","Kirby","Bowser","Pichu","Ness","Zelda","Mewtwo","Roy","Mr Game and Watch","Link","Donkey Kong","Young Link","Mario","Ganondorf","Luigi","Yoshi","Doctor Mario","Samus","Pikachu","Captain Falcon","Ice Climbers","Peach","Jigglypuff","Sheik","Marth","Falco","Fox"};
	public static String[] gameTypes = {"Losers Switch", "Losers Switch Full Random","Winner Switches", "Winner Switches Full Random"};
	public static String[] teams = {"Off","P1 + P2","P1 + P3","P1 + P4","Random","Mario Party"};
	public static String[] timer = {"ATW Algorithm","Custom (Below)"};
	public static String[] ende = {"Enabled","Disabled"};
	public static String[] dpchars = {"Young Link","Yoshi"};
	public static String[] kothgame = {"First to X","Highest Score",};
	public static String[] onoff = {"On","Off"};
	public static String[] charOrder = {"Back to front","Front to back"};
	public static String[] pickOrder = {"Any","Alternating"};
	public static String[] banOrder = {"Before pick","After pick"};
	public static String[] SM1 = {"Off","300%","Stamina"};
	public static String[] SM2 = {"Off","Mega","Mini"};
	public static String[] SM3 = {"Off","Flower","Bunny hood"};
	public static String[] SM4 = {"Off","Metal","Invisible"};
	public static String[] SM5 = {"Off","Screw","Turbo"};
	public static String[] SM6 = {"Off","Light","Heavy"};
	public static String[] SM7 = {"Off","Slow","Fast"};
	public static String[] SM8 = {"Off","Fixed"};
	public static String[] versions = {"1.02","PAL","SD Remix"};
	public static String[] widescreen = {"Off","Analog","True"};
	public static String[] lagreduction = {"Off","Half frame","Full frame"};
	public static String[] yesno = {"Yes","No"};

	public static void main(String[] args) throws InterruptedException, IOException {
		subMenu projectATW = new subMenu(1,"Main Menu");


		subMenu generalMain = new subMenu(1,"General");
		subMenu generalStages = new subMenu(1,"Stages");
		subMenu generalItems = new subMenu(1,"Items");
		subMenu generalMechanics = new subMenu(1,"Mechanics");
		subMenu generalGamemodes = new subMenu(1,"Gamemodes");
		subMenu generalVisuals = new subMenu(1,"Visuals");
		subMenu generalCredits = new subMenu(1,"Credits");




		projectATW.menuItems[0] = new menuItem(0,"Hi, this is the temporaray debug menu!");
		projectATW.menuItems[1] = new menuItem(0);
		projectATW.menuItems[2] = generalMain;
		projectATW.menuItems[3] = generalItems;
		projectATW.menuItems[4] = generalMechanics;
		projectATW.menuItems[5] = generalGamemodes;
		projectATW.menuItems[6] = generalVisuals;
		projectATW.menuItems[7] = generalCredits;




		subMenu ATWstartMatch = new subMenu(1,"Starting Characters");

		ATWstartMatch.menuItems[0] = new menuItem(0,"Starting Characters");
		ATWstartMatch.menuItems[1] = new menuItem(0);
		ATWstartMatch.menuItems[2] = new menuItem(2,"Player 1 Character: ",chars,0);
		ATWstartMatch.menuItems[3] = new menuItem(2,"Player 2 Character: ",chars,0);
		ATWstartMatch.menuItems[4] = new menuItem(2,"Player 3 Character: ",chars,0);
		ATWstartMatch.menuItems[5] = new menuItem(2,"Player 4 Character: ",chars,0);


		subMenu ATWmatchSettings = new subMenu(1,"ATW Game Settings");

		ATWmatchSettings.menuItems[0] = new menuItem(0,"Game Settings");
		ATWmatchSettings.menuItems[1] = new menuItem(0);
		ATWmatchSettings.menuItems[2] = new menuItem(2,"Game Type: ",gameTypes,1);
		ATWmatchSettings.menuItems[3] = new menuItem(2,"Teams: ",teams,5);
		ATWmatchSettings.menuItems[4] = new menuItem(2,"Percent Swap: ",ende,0);
		ATWmatchSettings.menuItems[5] = new menuItem(2,"Timer: ",timer,0);
		ATWmatchSettings.menuItems[6] = new menuItem(3,"Custom Timer: ",100,480,5);
		ATWmatchSettings.menuItems[7] = new menuItem(3,"Number of Characters: ",26,26,1);
		ATWmatchSettings.menuItems[8] = new menuItem(2,"Save stocks (iron man):",ende,1);


		subMenu ATWstageSettings = new subMenu(1,"ATW Stage Settings");

		ATWstageSettings.menuItems[0] = new menuItem(0,"Stage Settings");
		ATWstageSettings.menuItems[1] = new menuItem(0);
		ATWstageSettings.menuItems[2] = new menuItem(2,"Battlefield Ledges: ",onoff,1);
		ATWstageSettings.menuItems[3] = new menuItem(2,"Slippery FD: ",onoff,0);
		ATWstageSettings.menuItems[4] = new menuItem(2,"Shy guys: ",onoff,0);
		ATWstageSettings.menuItems[5] = new menuItem(2,"Dreamland Redeads: ",onoff,0);
		ATWstageSettings.menuItems[6] = new menuItem(3,"Redead Timer: ",900,1800,15);


		subMenu atwInfo = new subMenu(1,"How to play ATW");

		atwInfo.menuItems[0] = new menuItem(0,"How to play");
		atwInfo.menuItems[1] = new menuItem(0);
		atwInfo.menuItems[2] = new menuItem(0,"Around the world is a game where you play through every character");
		atwInfo.menuItems[3] = new menuItem(0,"on random stages with items. It can be played 1v1, free for all,");
		atwInfo.menuItems[4] = new menuItem(0,"2v2, and even free for all with a mix of 2v2. Your character is");
		atwInfo.menuItems[5] = new menuItem(0,"automatically changed after each game, and you will automatically");
		atwInfo.menuItems[6] = new menuItem(0,"be taken out of when you are out of characters. On the character");
		atwInfo.menuItems[7] = new menuItem(0,"select screen, you can hit A to put yourself in the game, L to");
		atwInfo.menuItems[8] = new menuItem(0,"bring up the nametag screen, and R to bring up the rules. It's");
		atwInfo.menuItems[9] = new menuItem(0,"recommended that you do not change the item settings, ");
		atwInfo.menuItems[10] = new menuItem(0,"everything else should be ok to change though.");



		subMenu ATWmainMenu = new subMenu(1, "Around the World");
		ATWmainMenu.menuItems[0] = new menuItem(0,"  /$$$$$$  /$$$$$$$$ /$$      /$$");
		ATWmainMenu.menuItems[1] = new menuItem(0," /$$__  $$1__  $$__/1 $$  /$ 1 $$");
		ATWmainMenu.menuItems[2] = new menuItem(0,"1 $$  7 $$   1 $$   1 $$ /$$$1 $$");
		ATWmainMenu.menuItems[3] = new menuItem(0,"1 $$$$$$$$   1 $$   1 $$/$$ $$ $$");
		ATWmainMenu.menuItems[4] = new menuItem(0,"1 $$__  $$   1 $$   1 $$$$_  $$$$");
		ATWmainMenu.menuItems[5] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$$/ 7  $$$");
		ATWmainMenu.menuItems[6] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$/   7  $$");
		ATWmainMenu.menuItems[7] = new menuItem(0,"1__/  1__/   1__/   1__/     7__/");
		ATWmainMenu.menuItems[8] = new menuItem(0);
		ATWmainMenu.menuItems[9] = new menuItem(0);
		ATWmainMenu.menuItems[10] = ATWstartMatch;
		ATWmainMenu.menuItems[11] = ATWmatchSettings;
		ATWmainMenu.menuItems[12] = ATWstageSettings;
		ATWmainMenu.menuItems[13] = atwInfo;

		subMenu DPsettings = new subMenu(1,"DP Settings");

		DPsettings.menuItems[0] = new menuItem(0,"Settings");
		DPsettings.menuItems[1] = new menuItem(0);
		DPsettings.menuItems[2] = new menuItem(3,"Bomb Impact Damage: ",10,25,1);
		DPsettings.menuItems[3] = new menuItem(3,"Bomb Explosion Damage: ",10,25,1);
		DPsettings.menuItems[4] = new menuItem(3,"Gravity/100: ",11,25,1);
		DPsettings.menuItems[5] = new menuItem(3,"Terminal Velocity/100: ",115,250,1);



		subMenu DPInfo = new subMenu(1,"How to play DP");
		DPInfo.menuItems[0] = new menuItem(0,"How to play");
		DPInfo.menuItems[1] = new menuItem(0);
		DPInfo.menuItems[2] = new menuItem(0,"Stay alive by pulling bombs as young link and teching on the");
		DPInfo.menuItems[3] = new menuItem(0,"walls and ceiling! Hit A to initialize yourself on the character");
		DPInfo.menuItems[4] = new menuItem(0,"select screen, hit L to bring up the nametag screen, and hit R to");
		DPInfo.menuItems[5] = new menuItem(0,"change the rules.");

		subMenu DPMain = new subMenu(1,"Duelist Pro");

		DPMain.menuItems[0] = new menuItem(0," /$$$$$$$  /$$$$$$$ ");
		DPMain.menuItems[1] = new menuItem(0,"1 $$__  $$1 $$__  $$");
		DPMain.menuItems[2] = new menuItem(0,"1 $$  7 $$1 $$  7 $$");
		DPMain.menuItems[3] = new menuItem(0,"1 $$  1 $$1 $$$$$$$/");
		DPMain.menuItems[4] = new menuItem(0,"1 $$  1 $$1 $$____/ ");
		DPMain.menuItems[5] = new menuItem(0,"1 $$  1 $$1 $$      ");
		DPMain.menuItems[6] = new menuItem(0,"1 $$$$$$$/1 $$      ");
		DPMain.menuItems[7] = new menuItem(0,"1_______/ 1__/      ");
		DPMain.menuItems[8] = new menuItem(0);
		DPMain.menuItems[9]  = DPsettings;
		DPMain.menuItems[10] = DPInfo;


		subMenu KOTHgameSettings = new subMenu(1,"KOTH Settings");

		KOTHgameSettings.menuItems[0] = new menuItem(0,"Game Settings");
		KOTHgameSettings.menuItems[1] = new menuItem(0);
		KOTHgameSettings.menuItems[2] = new menuItem(2,"Game Type: ",kothgame,0);
		KOTHgameSettings.menuItems[3] = new menuItem(3,"Max Score: ",2500,20000,25);
		KOTHgameSettings.menuItems[4] = new menuItem(3,"Time per Hill: ",30,120,1);



		subMenu KOTHInfo = new subMenu(1,"How to play KOTH");
		KOTHInfo.menuItems[0] = new menuItem(0,"How to play");
		KOTHInfo.menuItems[1] = new menuItem(0);
		KOTHInfo.menuItems[2] = new menuItem(0,"King of the hill is a game about stage control. The hill is marked");
		KOTHInfo.menuItems[3] = new menuItem(0,"by a piece of food, and you get points by standing on the hill.");
		KOTHInfo.menuItems[4] = new menuItem(0,"The person who has the most points at the end of the game, or");
		KOTHInfo.menuItems[5] = new menuItem(0,"reaches the max score first, wins. You can pick any character and");
		KOTHInfo.menuItems[6] = new menuItem(0,"play on one of three stages, other stages will not work.");

		subMenu KOTHMain = new subMenu(1,"King of the hill");

		KOTHMain.menuItems[0] = new menuItem(0," /$$   /$$  /$$$$$$  /$$$$$$$$ /$$   /$$");
		KOTHMain.menuItems[1] = new menuItem(0,"1 $$  /$$/ /$$__  $$1__  $$__/1 $$  1 $$");
		KOTHMain.menuItems[2] = new menuItem(0,"1 $$ /$$/ 1 $$  7 $$   1 $$   1 $$  1 $$");
		KOTHMain.menuItems[3] = new menuItem(0,"1 $$$$$/  1 $$  1 $$   1 $$   1 $$$$$$$$");
		KOTHMain.menuItems[4] = new menuItem(0,"1 $$  $$  1 $$  1 $$   1 $$   1 $$__  $$");
		KOTHMain.menuItems[5] = new menuItem(0,"1 $$7  $$ 1 $$  1 $$   1 $$   1 $$  1 $$");
		KOTHMain.menuItems[6] = new menuItem(0,"1 $$ 7  $$1  $$$$$$/   1 $$   1 $$  1 $$");
		KOTHMain.menuItems[7] = new menuItem(0,"1__/  7__/ 7______/    1__/   1__/  1__/");
		KOTHMain.menuItems[8] = new menuItem(0);
		KOTHMain.menuItems[9] = KOTHgameSettings;
		KOTHMain.menuItems[10] = KOTHInfo;

		subMenu ironManSettings = new subMenu(1,"Iron Man Settings");

		ironManSettings.menuItems[0] = new menuItem(0,"Settings");
		ironManSettings.menuItems[1] = new menuItem(0);
		ironManSettings.menuItems[2] = new menuItem(3,"Number of Characters: ",5,26,1);
		ironManSettings.menuItems[3] = new menuItem(2,"Character order: ",charOrder,0);
		ironManSettings.menuItems[4] = new menuItem(2,"Ban order: ",banOrder,0);



		subMenu ironManInfoR = new subMenu(1,"How to play regular");

		ironManInfoR.menuItems[0] = new menuItem(0,"How to play regular");
		ironManInfoR.menuItems[1] = new menuItem(0);
		ironManInfoR.menuItems[2] = new menuItem(0,"Build a roster of characters, the first person to lose all their");
		ironManInfoR.menuItems[3] = new menuItem(0,"characters loses. Hit A to initialize yourself on the character");
		ironManInfoR.menuItems[4] = new menuItem(0,"select screen, select a character, then hold L and press Y to");
		ironManInfoR.menuItems[5] = new menuItem(0,"add it to your roster. Hold L and Z then press Y to add zelda");
		ironManInfoR.menuItems[6] = new menuItem(0,"when zelda is selected, you will get sheik by default and you");
		ironManInfoR.menuItems[7] = new menuItem(0,"cannot transform or hold A. Initializing and picking will happen");
		ironManInfoR.menuItems[8] = new menuItem(0,"in an alternating order, so you have to wait for your opponent");
		ironManInfoR.menuItems[9] = new menuItem(0,"to select their first character before you can initialize");
		ironManInfoR.menuItems[10] = new menuItem(0,"yourself. Sound effects will play to let you know when you have");
		ironManInfoR.menuItems[11] = new menuItem(0,"succeeded or failed to add a character to your roster.");

		subMenu ironManBuy = new subMenu(1,"Buy settings");

		ironManBuy.menuItems[0] = new menuItem(0,"Buy settings");
		ironManBuy.menuItems[1] = new menuItem(0);
		ironManBuy.menuItems[2] = new menuItem(3,"Money per person: ",1000,10000,10);
		ironManBuy.menuItems[3] = new menuItem(3,"Captain Falcon cost: ",250,1000,5);
		ironManBuy.menuItems[4] = new menuItem(3,"Donkey Kong cost: ",150,1000,5);
		ironManBuy.menuItems[5] = new menuItem(3,"Fox cost: ",250,1000,5);
		ironManBuy.menuItems[6] = new menuItem(3,"Mr Game and Watch cost: ",125,1000,5);
		ironManBuy.menuItems[7] = new menuItem(3,"Kirby cost: ",100,1000,5);
		ironManBuy.menuItems[8] = new menuItem(3,"Bowser cost: ",100,1000,5);
		ironManBuy.menuItems[9] = new menuItem(3,"Link cost: ",150,1000,5);
		ironManBuy.menuItems[10] = new menuItem(3,"Luigi cost: ",200,1000,5);
		ironManBuy.menuItems[11] = new menuItem(3,"Mario cost: ",150,1000,5);
		ironManBuy.menuItems[12] = new menuItem(3,"Marth cost: ",250,1000,5);
		ironManBuy.menuItems[13] = new menuItem(3,"Mewtwo cost: ",100,1000,5);
		ironManBuy.menuItems[14] = new menuItem(3,"Ness cost: ",100,1000,5);
		ironManBuy.menuItems[15] = new menuItem(3,"Peach cost: ",250,1000,5);
		ironManBuy.menuItems[16] = new menuItem(3,"Pikachu cost: ",200,1000,5);
		ironManBuy.menuItems[17] = new menuItem(3,"Ice Climbers cost: ",250,1000,5);
		ironManBuy.menuItems[18] = new menuItem(3,"Jigglypuff cost: ",250,1000,5);
		ironManBuy.menuItems[19] = new menuItem(3,"Samus cost: ",200,1000,5);
		ironManBuy.menuItems[20] = new menuItem(3,"Yoshi cost: ",175,1000,5);
		ironManBuy.menuItems[21] = new menuItem(3,"Zelda cost: ",125,1000,5);
		ironManBuy.menuItems[22] = new menuItem(3,"Sheik cost: ",250,1000,5);
		ironManBuy.menuItems[23] = new menuItem(3,"Falco cost: ",250,1000,5);
		ironManBuy.menuItems[24] = new menuItem(3,"Young Link cost: ",150,1000,5);
		ironManBuy.menuItems[25] = new menuItem(3,"Doctor Mario cost: ",200,1000,5);
		ironManBuy.menuItems[26] = new menuItem(3,"Roy cost: ",125,1000,5);
		ironManBuy.menuItems[27] = new menuItem(3,"Pichu cost: ",125,1000,5);
		ironManBuy.menuItems[28] = new menuItem(3,"Ganondorf cost: ",175,1000,5);





		subMenu ironManInfoB = new subMenu(1,"How to play with bans");


		ironManInfoB.menuItems[0] = new menuItem(0,"How to play with bans");
		ironManInfoB.menuItems[1] = new menuItem(0);
		ironManInfoB.menuItems[2] = new menuItem(0,"Similar to the regular mode where you build a roster of characters");
		ironManInfoB.menuItems[3] = new menuItem(0,"but this time there are rounds of bans in between picking. Hold L");
		ironManInfoB.menuItems[4] = new menuItem(0,"and hit X to ban a character for your opponent. Text over your");
		ironManInfoB.menuItems[5] = new menuItem(0,"character select profile will tell you if you are picking or");
		ironManInfoB.menuItems[6] = new menuItem(0,"banning.");


		subMenu ironManInfoM = new subMenu(1,"How to play big money");

	    ironManInfoM.menuItems[0] = new menuItem(0,"How to play money edition");
	    ironManInfoM.menuItems[1] = new menuItem(0);
	    ironManInfoM.menuItems[2] = new menuItem(0,"In this mode, every character costs a certain amount of money and");
	    ironManInfoM.menuItems[3] = new menuItem(0,"you buy a roster. Same controls as regular mode but now you pick");
	    ironManInfoM.menuItems[4] = new menuItem(0,"characters in any order, and you can hit down on the dpad to sell");
	    ironManInfoM.menuItems[5] = new menuItem(0,"your roster and start over.");

		subMenu ironManMain = new subMenu(1,"Iron Man");

		ironManMain.menuItems[0] = new menuItem(0,"/$$$$$$ /$$      /$$ ");
		ironManMain.menuItems[1] = new menuItem(0,"1_  $$_/1 $$$    /$$$");
		ironManMain.menuItems[2] = new menuItem(0,"  1 $$  1 $$$$  /$$$$");
		ironManMain.menuItems[3] = new menuItem(0,"  1 $$  1 $$ $$/$$ $$");
		ironManMain.menuItems[4] = new menuItem(0,"  1 $$  1 $$  $$$1 $$");
		ironManMain.menuItems[5] = new menuItem(0,"  1 $$  1 $$7  $ 1 $$");
		ironManMain.menuItems[6] = new menuItem(0," /$$$$$$1 $$ 7/  1 $$");
		ironManMain.menuItems[7] = new menuItem(0,"1______/1__/     1__/");
		ironManMain.menuItems[8] = new menuItem(0);
		ironManMain.menuItems[9] = new menuItem(0);
		ironManMain.menuItems[10] = ironManSettings;
		ironManMain.menuItems[11] = ironManBuy;
		ironManMain.menuItems[12] = ironManInfoR;
		ironManMain.menuItems[13] = ironManInfoB;
		ironManMain.menuItems[14] = ironManInfoM;

		subMenu specialMelee = new subMenu(1,"Special Melee");

		specialMelee.menuItems[0] = new menuItem(0,"Special Melee");
		specialMelee.menuItems[1] = new menuItem(0);
		specialMelee.menuItems[2] = new menuItem(2,"%Stamina",SM1,0);
		specialMelee.menuItems[3] = new menuItem(3,"Stamina Amount",150,500,1);
		specialMelee.menuItems[4] = new menuItem(2,"Size: ",SM2,0);
		specialMelee.menuItems[5] = new menuItem(2,"Head: ",SM3,0);
		specialMelee.menuItems[6] = new menuItem(2,"Body: ",SM4,0);
		specialMelee.menuItems[7] = new menuItem(2,"Status: ",SM5,0);
		specialMelee.menuItems[8] = new menuItem(2,"Gravity: ",SM6,0);
		specialMelee.menuItems[9] = new menuItem(2,"Speed: ",SM7,0);
		specialMelee.menuItems[10] = new menuItem(2,"Camera: ",SM8,0);


		generalGamemodes.menuItems[0] = new menuItem(0,"Gamemodes");
		generalGamemodes.menuItems[1] = new menuItem(0);
		generalGamemodes.menuItems[2] = ATWmainMenu;
		generalGamemodes.menuItems[3] = DPMain;
		generalGamemodes.menuItems[4] = KOTHMain;
		generalGamemodes.menuItems[5] = ironManMain;
		generalGamemodes.menuItems[6] = new menuItem(0);
		generalGamemodes.menuItems[7] = specialMelee;
		generalGamemodes.menuItems[8] = new menuItem(2,"Custom gamemodes: ",ende,0);

		subMenu playerAttributes = new subMenu(1,"Player Attributes");
		subMenu tourneyMods = new subMenu(1,"Tourney mods");

		generalMain.menuItems[0] = new menuItem(0,"General");
		generalMain.menuItems[1] = new menuItem(0);
		generalMain.menuItems[2] = playerAttributes;
		generalMain.menuItems[3] = tourneyMods;
		generalMain.menuItems[4] = new menuItem(0);
		generalMain.menuItems[5] = new menuItem(8,"Game speed mult: ",1,3,0.0625);
		generalMain.menuItems[6] = new menuItem(2,"Disable Star KO: ",ende,1);
		generalMain.menuItems[7] = new menuItem(2,"Melee Version: ",versions,0) ;
		generalMain.menuItems[8] = new menuItem(2,"Widescreen: ",widescreen,0);
		generalMain.menuItems[9] = new menuItem(2,"Lag reduction: ",lagreduction,0);



		generalItems.menuItems[0] = new menuItem(0,"Items");
		generalItems.menuItems[1] = new menuItem(0);
		generalItems.menuItems[2] = new menuItem(2,"Use custom item timer: ",yesno,0);
		generalItems.menuItems[3] = new menuItem(3,"Custom item timer: ",750,2000,5);

		subMenu customStageSelectScreen = new subMenu(1,"Custom Stage Select Screen Builder");

		customStageSelectScreen.menuItems[0] = new menuItem(2,"Peach's Castle: ",stages,4);
		customStageSelectScreen.menuItems[1] = new menuItem(2,"Rainbow Cruise: ",stages,11);
		customStageSelectScreen.menuItems[2] = new menuItem(2,"Kongo Jungle: ",stages,5);
		customStageSelectScreen.menuItems[3] = new menuItem(2,"Jungle Japes: ",stages,12);
		customStageSelectScreen.menuItems[4] = new menuItem(2,"Great Bay: ",stages,13);
		customStageSelectScreen.menuItems[5] = new menuItem(2,"Hyrule Temple: ",stages,14);
		customStageSelectScreen.menuItems[6] = new menuItem(2,"Yoshi's Story: ",stages,8);
		customStageSelectScreen.menuItems[7] = new menuItem(2,"Yoshi's Island: ",stages,16);
		customStageSelectScreen.menuItems[8] = new menuItem(2,"Fountain Of Dreams: ",stages,2);
		customStageSelectScreen.menuItems[9] = new menuItem(2,"Green Greens: ",stages,17);
		customStageSelectScreen.menuItems[10] = new menuItem(2,"Corneria: ",stages,7);
		customStageSelectScreen.menuItems[11] = new menuItem(2,"Venom: ",stages,22);
		customStageSelectScreen.menuItems[12] = new menuItem(2,"Brinstar: ",stages,6);
		customStageSelectScreen.menuItems[13] = new menuItem(2,"Brinstar Depths: ",stages,14);
		customStageSelectScreen.menuItems[14] = new menuItem(2,"Onett: ",stages,9);
		customStageSelectScreen.menuItems[15] = new menuItem(2,"Fourside: ",stages,18);
		customStageSelectScreen.menuItems[16] = new menuItem(2,"Mute City: ",stages,10);
		customStageSelectScreen.menuItems[17] = new menuItem(2,"Big Blue: ",stages,24);
		customStageSelectScreen.menuItems[18] = new menuItem(2,"Pokemon Stadium: ",stages,3);
		customStageSelectScreen.menuItems[19] = new menuItem(2,"Poke Floats: ",stages,23);
		customStageSelectScreen.menuItems[20] = new menuItem(2,"Mushroom Kingdom 1: ",stages,19);
		customStageSelectScreen.menuItems[21] = new menuItem(2,"Mushroom Kingdom 2: ",stages,20);
		customStageSelectScreen.menuItems[22] = new menuItem(2,"Icicle Mountain: ",stages,25);
		customStageSelectScreen.menuItems[23] = new menuItem(2,"Flatzone: ",stages,27);
		customStageSelectScreen.menuItems[24] = new menuItem(2,"Battlefield: ",stages,31);
		customStageSelectScreen.menuItems[25] = new menuItem(2,"Final Destination: ",stages,32);
		customStageSelectScreen.menuItems[26] = new menuItem(2,"Dreamland: ",stages,28);
		customStageSelectScreen.menuItems[27] = new menuItem(2,"Yoshi's Island 64: ",stages,29);
		customStageSelectScreen.menuItems[28] = new menuItem(2,"Kongo Jungle 64: ",stages,30);


		generalStages.menuItems[0] = new menuItem(0,"Stages");
		generalStages.menuItems[1] = new menuItem(0);
		generalStages.menuItems[2] = customStageSelectScreen;
		generalStages.menuItems[3] = new menuItem(0);




		generalMechanics.menuItems[0] = new menuItem(0,"General");
		generalVisuals.menuItems[0] = new menuItem(0,"General");
		generalCredits.menuItems[0] = new menuItem(0,"General");

		ArrayList<jsonObject> list = new ArrayList<jsonObject>();

		printMenu(projectATW,myFile,list);
		String data = "#To be inserted at " + eighty + Integer.toHexString(originalTextSpace) + "\n";
		File newFile = new File(myFile + "Text" + ".s");
		FileWriter writer = new FileWriter(newFile);
		PrintWriter pr = new PrintWriter(writer);
		pr.print(data + text);
		pr.close();

		list.add(new jsonObject((eighty + Integer.toHexString(originalTextSpace)),newFile));

		data = "#To be inserted at " + eighty + Integer.toHexString(originalVarSpace) + "\n";
		newFile = new File(myFile + "Variables" + ".s");
		writer = new FileWriter(newFile);
		pr = new PrintWriter(writer);
		pr.print(data + var);
		pr.close();

		list.add(new jsonObject((eighty + Integer.toHexString(originalVarSpace)),newFile));

		File json = new File("C:\\Users\\Thomas\\Desktop\\thing.txt");
		writer = new FileWriter(json);
		pr = new PrintWriter(writer);

		for(int i = 0; i < list.size(); i++) {
			jsonObject temp = list.get(i);
			pr.print("\n        {\n          \"type\": \"replaceCodeBlock\",\n          \"address\": \"" + temp.address + "\",\n          \"sourceFile\": \"" + temp.filelol + "\"\n        },");
		}
		pr.close();


	}



	public static String U32(int num) {
		return ("00000000" + Integer.toHexString(num)).substring(Integer.toHexString(num).length());
	}

	public static String getFloat(Float i) {
		return Long.toHexString(Float.floatToIntBits(i));
	}
	public static String getTextPointer(String message) {
		if(message == null) {
			return "0";
		}
		int tempint = 0;
		String temp = "";
	    for(int i = 0; i < message.length() ; i+=4){   // while counting characters if less than the length add one
        	temp += "\n.long 0x";
	    	for(int j = 0; j < 4;j++) {
	    		try {
		        char character = message.charAt(i+j); // start on the first character
		        int ascii = (int) character; //convert the first character
		        temp += Integer.toHexString(ascii);
	    		}
	    		catch (StringIndexOutOfBoundsException e) {

	    		}


	    	}
	        	tempint++;
	    }
	    int num = (temp.length()-tempint)/2;
	    int times = 0;
	    if(num%4 == 0) {
	    	times = 4;
	    	temp+="\n.long 0x";
	    }
	    else {
	    	times = 4-num%4;
	    }
	    int times2 = times;
	    while(times2>0) {
	    	temp += "00";
	    	times2 --;
	    }
		text += temp;
		String returned = eighty + Integer.toHexString(textSpace);
		textSpace += (message.length()) + (times);
		return returned;
	}
	public static String getListPointer(String[] list) {
		int currentTextSpace = textSpace;
		int backup = textSpace;


		for(int k = 0; k <= currentID;k++) {
			if(done[k].equals(list)) {
				return doneoffset[k];
			}
		}
		textSpace += list.length*4;
		textSpace += 4;
		currentTextSpace += list.length*4;
		currentTextSpace+=4;
		text += "\n.long 0x" + eighty + Integer.toHexString(currentTextSpace);
		for(int i = 1; i < list.length;i++) {
			text += "\n.long 0x" + eighty + Integer.toHexString((currentTextSpace+=getinc(list[i-1])));
		}
		text += "\n.long 0";
		currentTextSpace+=4;
		for(int i = 0; i < list.length;i++) {
			getTextPointer(list[i]);
		}

		currentID++;
		done[currentID] = list;
		doneoffset[currentID] = eighty + Integer.toHexString(backup);

		return eighty + Integer.toHexString(backup);
	}
	public static int getinc(String message) {
		String temp = "";
		int tempint = 0;
	    for(int i = 0; i < message.length() ; i++){   // while counting characters if less than the length add one
	        char character = message.charAt(i); // start on the first character
	        int ascii = (int) character; //convert the first character
	        temp += Integer.toHexString(ascii);
	        if(temp.length()%8-tempint==0) {
	        	temp += "\n";
	        	tempint++;
	        }
	    }
	    int num = (temp.length()-tempint)/2;
	    int times = 0;
	    if(num%4 == 0) {
	    	times = 4;
	    }
	    else {
	    	times = 4-num%4;
	    }
	    while(times>0) {
	    	temp += "00";
	    	times --;
	    }
	    temp += "\n";
	    return (temp.length()-tempint-1)/2;
	}

	public static String getVarPointer(double value, menuItem menu) {
		String returns = eighty + Integer.toHexString(varSpace);
		varSpace += 4;
		var += ".long 0x" + U32((int)value) + " #" + menu.text + "\n";
		return returns;
	}
	public static String getVarPointer(float value, menuItem menu) {
		String returns = eighty + Integer.toHexString(varSpace);
		varSpace += 4;
		var += ".long 0x" + getFloat(value) + " #" + menu.text + "\n";
		return returns;
	}


	public static int getNumOfMenuItems(subMenu current) {
		int num = 0;
		for(int i = 0; i < current.menuItems.length; i++ ) {
			if(current.menuItems[i] != null) {
				num++;
			}
		}
		return (num+2)*4*8;
	}


	public static void printMenu(subMenu menu, String filename, ArrayList<jsonObject> list) throws InterruptedException, IOException {
		String data = "";
		int backup = 0;
		File newFile = new File("");
		for(int i = 0; i < menu.menuItems.length; i++) {
			if(menu.menuItems[i] == null) {
				break;
			}
			if(menu.menuItems[i] instanceof subMenu) {
				subMenu temp = (subMenu) menu.menuItems[i];
				currentMenuSpace+=getNumOfMenuItems(menu);
				backup = currentMenuSpace;
				printMenu(temp,filename,list);
			}
			menu.menuItems[i].injectSpot = backup;
			if(i == 0) {
				backup = currentMenuSpace;
				data = "#To be inserted at " + eighty + Integer.toHexString(currentMenuSpace) + "\n";
				newFile = new File(myFile + menu.text + ".s");
				list.add(new jsonObject((eighty + Integer.toHexString(currentMenuSpace)),newFile));
			}
			switch (menu.menuItems[i].type) {
			case 0:
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				break;
			case 1:

				data += "\n.long 1";
				data += "\n.long 0x" + menu.menuItems[i].functPointer;
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0x" + eighty + Integer.toHexString(menu.menuItems[i].injectSpot);
				data += "\n.long 0";
				data += "\n.long 0";
				break;
			case 2:
				data += "\n.long 2";
				data += "\n.long 0";
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0x" + getListPointer(menu.menuItems[i].listPointer);
				data += "\n.long 0x" + getVarPointer(menu.menuItems[i].defaultValue, menu.menuItems[i]);
				data += "\n.long 0";
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].listPointer.length);
				data += "\n.long 0x" + getFloat((float) 1);
				break;
			case 3:
				data += "\n.long 3";
				data += "\n.long 0";
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0";
				data += "\n.long 0x" + getVarPointer(menu.menuItems[i].defaultValue, menu.menuItems[i]);
				data += "\n.long 0";
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].LRItems);
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].valToInc);
				break;
			case 8:
				data += "\n.long 8";
				data += "\n.long 0";
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0";
				data += "\n.long 0x" + getVarPointer((float)menu.menuItems[i].defaultValue, menu.menuItems[i]);
				data += "\n.long 0";
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].LRItems);
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].valToInc);
				break;
			}


			

			if(menu.menuItems[i+1] == null) {
				newFile.createNewFile();
				FileWriter fr = new FileWriter(newFile);
				PrintWriter pr = new PrintWriter(fr);
				data += "\n.long 9";
				pr.print(data);
				pr.close();
			}

		}

	}

}
