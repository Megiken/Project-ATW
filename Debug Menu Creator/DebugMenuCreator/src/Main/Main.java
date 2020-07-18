package Main;

import java.io.*;
import java.util.ArrayList;

public class Main{
	public static String[] functions = {"803001dc","8032C908","8032C908","8032C908","8032C908","8032C908"};

	final static String toCSS = "8032C90c";
	final static String toCSSClear = "8032C910";
	public static int spaceLOL = 0;
	public static int textSpace = 1650508;
	public static int originalTextSpace = 1650508;
	public static int subMenuSpace = 6671456;
	public static int varSpace = 1679180;
	public static int originalVarSpace = 1679180;
	public static int currentMenuSpace = subMenuSpace;
	public static String[][] done = new String[1000][1000];
	public static String[] doneoffset = new String[1000];
	public static String[] done2 = new String[1000];
	public static String[] doneoffset2 = new String[1000];
	public static int currentID = 0;
	public static int currentID2 = 0;
	public static File currentFile = new File("");
	public static String[] stages = {"Dummy","Test","Fountain Of Dreams","Pokemon Stadium","Peachs Castle","Kongo Jungle","Brinstar","Corneria","Yoshis Story","Onett","Mute City","Rainbow Cruise","Jungle Japes","Great Bay","Hyrule Temple","Brinstar Depths","Yoshis Island","Green Greens","Fourside","Mushroom Kingdom 1","Mushroom Kingdom 2","Akaneia","Venom","Poke Floats","Big Blue","Icicle Mountain","Icetop","Flatzone","Dreamland","Yoshis Island N64","Kongo Jungle N64","Battlefield","Final Destination","Mario Target Test","Captain Falcon Target Test","Young link Target Test","Donkey Kong Target Test","Dr Mario Target Test","Falco Target Test","Fox Target Test","Ice Climbers Target Test","Kirby Target Test","Bowser Target Test","Link Target Test","Luigi Target Test","Marth Target Test","Mewtwo Target Test","Ness Target Test","Peach Target Test","Pichu Target Test","Pikachu Target Test","Jigglypuff Target Test","Samus Target Test","Sheik Target Test","Yoshi Target Test","Zelda Target Test","Mr Game and watch Target Test","Roy Target Test","Ganondorf Target Test","Majoras Mask","Entei","Goomba","Mount Olympus","All star rest","Home run contest","Escape Shaft","Race to the finish","Duelist pro stage","Event 32 Corneria","Legal Green Greens","Legal big blue","Legal Peachs Castle","Legal Yoshis island","Legal Jungle Japes","Legal Great Bay","Legal Mushroom Kindom 2","Legal Yoshis Island N64","Legal Kongo Jungle","Smashville fourside","Skyrule","Kirby Ware","Lylat Cruise","Nintendo Gamecube","Kalos Pokemon League","Wario Ware Inc","Hyrule Castle","Suzaku Castle","Metal Cavern M","Metroid Lab","Battlefino Plaza","Smash 4 Battlefield","Miiverse","Splattlefino Plaza","Smash 4 FD","Saffron City","75m","Wario land"};
	public static String myFile = "C:\\Users\\Thomas\\Desktop\\Project-ATW\\ASM\\Misc\\Debug Menu\\Submenus\\";
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
	public static String[] nightDreamland = {"Enabled","ATW Only","Disabled"};
	public static String[] skins = {"Default","Custom 1","Custom 2","Custom 3"};

	public static void main(String[] args) throws InterruptedException, IOException {
		subMenu projectATW = new subMenu(1,"Main Menu");


		subMenu generalMain = new subMenu(1,"General");
		subMenu generalStages = new subMenu(1,"Stages");
		subMenu generalItems = new subMenu(1,"Items");
		subMenu generalMechanics = new subMenu(1,"Mechanics");
		subMenu generalGamemodes = new subMenu(1,"Gamemodes");
		subMenu generalVisuals = new subMenu(1,"Visuals");
		subMenu generalCredits = new subMenu(1,"Credits");

		generalCredits.menuItems[0] = new menuItem(0,"Credits");
		generalCredits.menuItems[1] = new menuItem(0);
		generalCredits.menuItems[2] = new menuItem(0,"Big money is the coolest");
		generalCredits.menuItems[3] = new menuItem(0,"Ill add more people later but no one is as cool as big money");


		generalVisuals.menuItems[0] = new menuItem(0,"Visual Settings");
		generalVisuals.menuItems[1] = new menuItem(0);
		generalVisuals.menuItems[2] = new menuItem(0,"You can add your own skins to the iso and select them here.");
		generalVisuals.menuItems[3] = new menuItem(0,"The files you want to replace end with .00t, .01t, etc.");
		generalVisuals.menuItems[4] = new menuItem(0,"As long as your new files dont edit the model, it wont even.");
		generalVisuals.menuItems[5] = new menuItem(0,"cause desyncs on netplay.");
		generalVisuals.menuItems[6] = new menuItem(2,"Battlefield skin: ",skins,0);
		generalVisuals.menuItems[7] = new menuItem(2,"FD skin: ",skins,0);
		generalVisuals.menuItems[8] = new menuItem(2,"Pokemon stadium skin: ",skins,0);
		generalVisuals.menuItems[9] = new menuItem(2,"Yoshis story skin: ",skins,0);
		generalVisuals.menuItems[10] = new menuItem(2,"FOD skin: ",skins,0);
		generalVisuals.menuItems[11] = new menuItem(2,"Dreamland skin: ",skins,0);
		generalVisuals.menuItems[12] = new menuItem(0);
		generalVisuals.menuItems[13] = new menuItem(2,"CSS skin: ",skins,0);
		generalVisuals.menuItems[14] = new menuItem(0);
		generalVisuals.menuItems[15] = new menuItem(2,"Costume Dependent Marth Sword Colours: ",ende,1);


		projectATW.menuItems[0] = new menuItem(0,"  /$$$$$$  /$$$$$$$$ /$$      /$$");
		projectATW.menuItems[1] = new menuItem(0," /$$__  $$1__  $$__/1 $$  /$ 1 $$");
		projectATW.menuItems[2] = new menuItem(0,"1 $$  7 $$   1 $$   1 $$ /$$$1 $$");
		projectATW.menuItems[3] = new menuItem(0,"1 $$$$$$$$   1 $$   1 $$/$$ $$ $$");
		projectATW.menuItems[4] = new menuItem(0,"1 $$__  $$   1 $$   1 $$$$_  $$$$");
		projectATW.menuItems[5] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$$/ 7  $$$");
		projectATW.menuItems[6] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$/   7  $$");
		projectATW.menuItems[7] = new menuItem(0,"1__/  1__/   1__/   1__/     7__/");
		projectATW.menuItems[8] = new menuItem(0);
		projectATW.menuItems[9] = generalMain;
		projectATW.menuItems[10] = generalStages;
		projectATW.menuItems[11] = generalItems;
		projectATW.menuItems[12] = generalMechanics;
		projectATW.menuItems[13] = generalGamemodes;
		projectATW.menuItems[14] = generalVisuals;
		projectATW.menuItems[15] = generalCredits;

		generalMechanics.menuItems[0] = new menuItem(0,"Mechanics Settings");
		generalMechanics.menuItems[1] = new menuItem(0);
		generalMechanics.menuItems[2] = new menuItem(2,"Air grabs: ",ende,1);
		generalMechanics.menuItems[3] = new menuItem(2,"Aerial taunts: ",ende,1);
		generalMechanics.menuItems[4] = new menuItem(2,"Taunt cancelling: ",ende,1);
		generalMechanics.menuItems[5] = new menuItem(2,"Fastfall whenever: ",ende,1);
		generalMechanics.menuItems[6] = new menuItem(2,"Invisible ceiling fix: ",ende,1);
		generalMechanics.menuItems[7] = new menuItem(2,"Remove grab infinites: ",ende,1);
		generalMechanics.menuItems[8] = new menuItem(2,"Wall bracing: ",ende,1);
		generalMechanics.menuItems[9] = new menuItem(2,"Auto L cancel: ",ende,1);
		generalMechanics.menuItems[10] = new menuItem(2,"Percent swap in doubles: ",ende,1);
		generalMechanics.menuItems[11] = new menuItem(2,"Any colours in doubles: ",ende,1);
		generalMechanics.menuItems[12] = new menuItem(2,"Everyone can walljump: ",ende,1);
		generalMechanics.menuItems[13] = new menuItem(2,"Climber clone: ",ende,1);
		generalMechanics.menuItems[14] = new menuItem(2,"Everyone is 2d: ",ende,1);
		generalMechanics.menuItems[15] = new menuItem(2,"Ledge invincibility attrition: ",ende,1);
		generalMechanics.menuItems[16] = new menuItem(2,"Random hit effects: ",ende,1);



		subMenu ATWstartMatch = new subMenu(1,"Start new atw");

		ATWstartMatch.menuItems[0] = new menuItem(0,"New game");
		ATWstartMatch.menuItems[1] = new menuItem(0);
		ATWstartMatch.menuItems[2] = new menuItem(1,"8032C914","Start new ATW");
		ATWstartMatch.menuItems[3] = new menuItem(0);
		ATWstartMatch.menuItems[4] = new menuItem(1,"8032C934","Start new ATW Lite");
		ATWstartMatch.menuItems[5] = new menuItem(0);
		ATWstartMatch.menuItems[6] = new menuItem(1,"8032C938","Start new ATW Freestyle");
		ATWstartMatch.menuItems[7] = new menuItem(0);
		ATWstartMatch.menuItems[8] = new menuItem(2,"Player 1 Character: ",chars,0);
		ATWstartMatch.menuItems[9] = new menuItem(2,"Player 2 Character: ",chars,0);
		ATWstartMatch.menuItems[10] = new menuItem(2,"Player 3 Character: ",chars,0);
		ATWstartMatch.menuItems[11] = new menuItem(2,"Player 4 Character: ",chars,0);


		subMenu ATWmatchSettings = new subMenu(1,"ATW Game Settings");

		ATWmatchSettings.menuItems[0] = new menuItem(0,"Game Settings");
		ATWmatchSettings.menuItems[1] = new menuItem(0);
		ATWmatchSettings.menuItems[2] = new menuItem(2,"Game Type: ",gameTypes,1);
		ATWmatchSettings.menuItems[3] = new menuItem(2,"Teams: ",teams,5);
		ATWmatchSettings.menuItems[4] = new menuItem(2,"Timer: ",timer,0);
		ATWmatchSettings.menuItems[5] = new menuItem(3,"Custom Timer: ",100,480,5);
		ATWmatchSettings.menuItems[6] = new menuItem(3,"Number of Characters: ",26,26,1);
		ATWmatchSettings.menuItems[7] = new menuItem(2,"Save stocks (iron man):",ende,1);


		subMenu atwInfo = new subMenu(1,"How to play ATW");

		atwInfo.menuItems[0] = new menuItem(0,"How to play");
		atwInfo.menuItems[1] = new menuItem(0);
		atwInfo.menuItems[2] = new menuItem(0,"Around the world is a game where you play through every character");
		atwInfo.menuItems[3] = new menuItem(0,"on random stages with items. It can be played 1v1, free for all,");
		atwInfo.menuItems[4] = new menuItem(0,"2v2, and even free for all with a mix of 2v2.");
		atwInfo.menuItems[5] = new menuItem(0,"On the character select screen, you can hit A to put yourself in");
		atwInfo.menuItems[6] = new menuItem(0,"the game, L to bring up the nametag screen, and R to bring up the");
		atwInfo.menuItems[7] = new menuItem(0,"rules.");
		atwInfo.menuItems[8] = new menuItem(0,"The regular ATW mode has set rules, changing the items does nothing");
		atwInfo.menuItems[9] = new menuItem(0,"ATW lite only changes your character after each match, it has none");
		atwInfo.menuItems[10] = new menuItem(0,"of the mods that change items, stages, etc. ATW Freestyle has all");
		atwInfo.menuItems[11] = new menuItem(0,"the item and stage mods, but gives you full access to the character");
		atwInfo.menuItems[12] = new menuItem(0,"select screen and rules.");


		subMenu ATWmainMenu = new subMenu(1, "Around the World");
		ATWmainMenu.menuItems[0] = new menuItem(0,"Around the world main menu");
		ATWmainMenu.menuItems[1] = new menuItem(0);
		ATWmainMenu.menuItems[2] = new menuItem(0,"8032c850"," ");
		ATWmainMenu.menuItems[3] = ATWstartMatch;
		ATWmainMenu.menuItems[4] = ATWmatchSettings;
		ATWmainMenu.menuItems[5] = atwInfo;

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

		DPMain.menuItems[0] = new menuItem(0,"Duelist Pro");
		DPMain.menuItems[1] = new menuItem(0);
		DPMain.menuItems[2] = new menuItem(1,"8032C918","Play");
		DPMain.menuItems[3] = DPsettings;
		DPMain.menuItems[4] = DPInfo;


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

		KOTHMain.menuItems[0] = new menuItem(0,"King of the hill");
		KOTHMain.menuItems[1] = new menuItem(0);
		KOTHMain.menuItems[2] = new menuItem(1,"8032C910","Play");
		KOTHMain.menuItems[3] = KOTHgameSettings;
		KOTHMain.menuItems[4] = KOTHInfo;

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
		ironManInfoR.menuItems[7] = new menuItem(0,"cannot transform or hold A. You can hit down on the dpad at any");
		ironManInfoR.menuItems[8] = new menuItem(0,"time to clear your roster and start over. Stocks automatically");
		ironManInfoR.menuItems[9] = new menuItem(0,"get carried over between games, stage selection is up to you.");
		ironManInfoR.menuItems[10] = new menuItem(0,"Sound effects will play to let you know when you have succeeded");
		ironManInfoR.menuItems[11] = new menuItem(0,"or failed to add a character to your roster.");

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
		ironManInfoB.menuItems[4] = new menuItem(0,"and hit X to ban a character for your opponent. The text over your");
		ironManInfoB.menuItems[5] = new menuItem(0,"character select profile will tell you if you are picking or");
		ironManInfoB.menuItems[6] = new menuItem(0,"banning.");


		subMenu ironManInfoM = new subMenu(1,"How to play big money");

	    ironManInfoM.menuItems[0] = new menuItem(0,"How to play money edition");
	    ironManInfoM.menuItems[1] = new menuItem(0);
	    ironManInfoM.menuItems[2] = new menuItem(0,"In this mode, every character costs a certain amount of money and");
	    ironManInfoM.menuItems[3] = new menuItem(0,"you buy a roster. Same controls as regular mode, clearing your");
	    ironManInfoM.menuItems[4] = new menuItem(0,"roster gives you your money back.");

		subMenu ironManMain = new subMenu(1,"Iron Man");

		subMenu ironManPlay = new subMenu(1,"Start new game");

		ironManPlay.menuItems[0] = new menuItem(0,"New game");
		ironManPlay.menuItems[1] = new menuItem(0);
		ironManPlay.menuItems[2] = new menuItem(1,"8032C8c8","New regular iron man");
		ironManPlay.menuItems[3] = ironManInfoR;
		ironManPlay.menuItems[4] = new menuItem(0);
		ironManPlay.menuItems[5] = new menuItem(1,"8032C8cc","New iron man with bans");
		ironManPlay.menuItems[6] = ironManInfoB;
		ironManPlay.menuItems[7] = new menuItem(0);
		ironManPlay.menuItems[8] = new menuItem(1,"8032C8d0","New big money iron man");
		ironManPlay.menuItems[9] = ironManInfoM;


		ironManMain.menuItems[0] = new menuItem(0,"Iron Man Main Menu");
		ironManMain.menuItems[1] = new menuItem(0);
		ironManMain.menuItems[2] = new menuItem(0,"8032c850"," ");
		ironManMain.menuItems[3] = ironManPlay;
		ironManMain.menuItems[4] = ironManSettings;
		ironManMain.menuItems[5] = ironManBuy;


		subMenu specialMelee = new subMenu(1,"Special Melee");

		specialMelee.menuItems[0] = new menuItem(0,"Special Melee");
		specialMelee.menuItems[1] = new menuItem(0);
		specialMelee.menuItems[2] = new menuItem(2,"Percent/Stamina",SM1,0);
		specialMelee.menuItems[3] = new menuItem(3,"Stamina Amount",150,500,1);
		specialMelee.menuItems[4] = new menuItem(2,"Size: ",SM2,0);
		specialMelee.menuItems[5] = new menuItem(2,"Head: ",SM3,0);
		specialMelee.menuItems[6] = new menuItem(2,"Body: ",SM4,0);
		specialMelee.menuItems[7] = new menuItem(2,"Status: ",SM5,0);
		specialMelee.menuItems[8] = new menuItem(2,"Gravity: ",SM6,0);
		specialMelee.menuItems[9] = new menuItem(2,"Speed: ",SM7,0);
		specialMelee.menuItems[10] = new menuItem(2,"Camera: ",SM8,0);



		subMenu ssMain = new subMenu(1,"Squad Strike");
		subMenu amMain = new subMenu(1,"Arms race");

		subMenu amSettings = new subMenu(1,"Arms race settings");
		subMenu amInfo = new subMenu(1,"How to play arms race");

		subMenu ssSettings = new subMenu(1,"Squad strike settings");
		subMenu ssInfo = new subMenu(1,"How to play squad strike");

		ssMain.menuItems[0] = new menuItem(0,"Squad strike main menu");
		ssMain.menuItems[1] = new menuItem(0);
		ssMain.menuItems[2] = new menuItem(1,"8032C920","Play");
		ssMain.menuItems[3] = ssSettings;
		ssMain.menuItems[4] = ssInfo;

		ssSettings.menuItems[0] = new menuItem(0,"Settings");
		ssSettings.menuItems[1] = new menuItem(0);
		ssSettings.menuItems[2] = new menuItem(3,"Number of characters: ",4,5,1,3);

		ssInfo.menuItems[0] = new menuItem(0,"How to play");
		ssInfo.menuItems[1] = new menuItem(0);
		ssInfo.menuItems[2] = new menuItem(0,"IDK im tired and i just want this done aaaaaaaaaaaa");

		amMain.menuItems[0] = new menuItem(0,"All star main menu");
		amMain.menuItems[1] = new menuItem(0);
		amMain.menuItems[2] = new menuItem(1,"8032C924","Play");
		amMain.menuItems[3] = amSettings;
		amMain.menuItems[4] = amInfo;

		amSettings.menuItems[0] = new menuItem(0,"Settings");
		amSettings.menuItems[1] = new menuItem(0);
		amSettings.menuItems[2] = new menuItem(3,"Number of characters: ",26,26,1,0);

		amInfo.menuItems[0] = new menuItem(0,"How to play");
		amInfo.menuItems[1] = new menuItem(0);
		amInfo.menuItems[2] = new menuItem(0,"IDK im tired and i just want this done aaaaaaaaaaaa");

		subMenu Smash64Main = new subMenu(1,"Smash 64");

		Smash64Main.menuItems[0] = new menuItem(0,"Smash 64 Main Menu");
		Smash64Main.menuItems[1] = new menuItem(0);
		Smash64Main.menuItems[2] = new menuItem(1,"8032C93c","Play");

		subMenu brawlMain = new subMenu(1,"Brawl");

		brawlMain.menuItems[0] = new menuItem(0,"Brawl Main Menu");
		brawlMain.menuItems[1] = new menuItem(0);
		brawlMain.menuItems[2] = new menuItem(1,"8032C940","Play");

		subMenu sixPlayerMain = new subMenu(1,"6 Player Smash Main Menu");

		sixPlayerMain.menuItems[0] = new menuItem(0,"6 Player Smash Main Menu");
		sixPlayerMain.menuItems[1] = new menuItem(0);
		sixPlayerMain.menuItems[2] = new menuItem(0,"Soon");


		subMenu shuffleMain = new subMenu(1,"Shuffle");

		shuffleMain.menuItems[0] = new menuItem(0,"Shuffle");
		shuffleMain.menuItems[1] = new menuItem(0);
		shuffleMain.menuItems[2] = new menuItem(0,"Soon");


		subMenu BBWSettings = new subMenu(1,"Bretts blastzone warp Settings");

		BBWSettings.menuItems[0] = new menuItem(0,"Bretts blastzone warp settings");
		BBWSettings.menuItems[1] = new menuItem(0);
		BBWSettings.menuItems[2] = new menuItem(3,"Damage per warp",20,100,1,0);
		BBWSettings.menuItems[3] = new menuItem(3,"Kill percent",1000,1000,5);

		subMenu BBWInfo = new subMenu(1,"How to play bretts blastzone warp");

		BBWInfo.menuItems[0] = new menuItem(0,"how to play bretts blastzone warp");
		BBWInfo.menuItems[1] = new menuItem(0);
		BBWInfo.menuItems[2] = new menuItem(0,"This is a very simple minigame, touching a blastzone warps you to");
		BBWInfo.menuItems[3] = new menuItem(0,"opposite blastzone, and gives you some percent. Once you reach the");
		BBWInfo.menuItems[4] = new menuItem(0,"kill percent, you lose your stock.");

		subMenu BBWMain = new subMenu(1,"Bretts blastzone warp");

		BBWMain.menuItems[0] = new menuItem(0,"Bretts blastzone warp main menu");
		BBWMain.menuItems[1] = new menuItem(0);
		BBWMain.menuItems[2] = new menuItem(1,"8032C944","Play");
		BBWMain.menuItems[3] = BBWSettings;
		BBWMain.menuItems[4] = BBWInfo;


		subMenu MRSSSettings = new subMenu(1,"Soccer Settings");

		MRSSSettings.menuItems[0] = new menuItem(0,"Mr saturn soccer settings");
		MRSSSettings.menuItems[1] = new menuItem(0);
		MRSSSettings.menuItems[2] = new menuItem(2,"Game type: ",kothgame,0);
		MRSSSettings.menuItems[3] = new menuItem(3,"Max score: ",7,50,1);
		MRSSSettings.menuItems[4] = new menuItem(8,"Mr saturn speed constant: ",0.87,4,0.01,0);

		subMenu MRSSInfo = new subMenu(1, "How to play soccer");

		MRSSInfo.menuItems[0] = new menuItem(0,"How to play mr saturn soccer");
		MRSSInfo.menuItems[1] = new menuItem(0);
		MRSSInfo.menuItems[2] = new menuItem(0,"Knock mr saturn into your opponents goal to score.");
		MRSSInfo.menuItems[3] = new menuItem(0,"By default, the first team to 7 points wins!");

		subMenu MRSSMain = new subMenu(1,"Mr Saturn Soccer");

		MRSSMain.menuItems[0] = new menuItem(0,"Mr saturn soccer main menu");
		MRSSMain.menuItems[1] = new menuItem(0);
		MRSSMain.menuItems[2] = new menuItem(1,"8032C948","Play");
		MRSSMain.menuItems[3] = MRSSSettings;
		MRSSMain.menuItems[4] = MRSSInfo;

		subMenu SBSettings = new subMenu(1,"Snowbrawl settings");

		SBSettings.menuItems[0] = new menuItem(0,"Mr saturn soccer settings");
		SBSettings.menuItems[1] = new menuItem(0);
		SBSettings.menuItems[2] = new menuItem(2,"Game type: ",kothgame,1);
		SBSettings.menuItems[3] = new menuItem(3,"Max score: ",50,500,5,0);
		SBSettings.menuItems[4] = new menuItem(3,"Penalty per death: ",4,15,1,0);
		SBSettings.menuItems[5] = new menuItem(2,"Reflections: ",ende,1);

		subMenu SBInfo = new subMenu(1,"How to play snowbrawl");

		SBInfo.menuItems[0] = new menuItem(0,"How to play snowbrawl");
		SBInfo.menuItems[1] = new menuItem(0);
		SBInfo.menuItems[2] = new menuItem(0,"Throw snowballs (eggs) at your oppoents for points.");
		SBInfo.menuItems[3] = new menuItem(0,"The person with the most points at the end of the match");
		SBInfo.menuItems[4] = new menuItem(0,"wins!");

		subMenu SBMain = new subMenu(1,"Snowbrawl");

		SBMain.menuItems[0] = new menuItem(0,"Snowbrawl main menu");
		SBMain.menuItems[1] = new menuItem(0);
		SBMain.menuItems[2] = new menuItem(1,"8032C94c","Play");
		SBMain.menuItems[3] = SBSettings;
		SBMain.menuItems[4] = SBInfo;

		subMenu OITCSettings = new subMenu(1,"One in the chamber settings");

		OITCSettings.menuItems[0] = new menuItem(0,"One in the chamber settings");
		OITCSettings.menuItems[1] = new menuItem(0);
		OITCSettings.menuItems[2] = new menuItem(2,"Infinite ammo: ",ende,1);
		OITCSettings.menuItems[3] = new menuItem(3,"Kill reward: ",1,5,1,0);
		OITCSettings.menuItems[4] = new menuItem(2,"Ledge grabs: ",ende,0);
		OITCSettings.menuItems[5] = new menuItem(2,"Reflections: ",ende,0);

		subMenu OITCInfo = new subMenu(1,"How to play one in the chamber");

		OITCInfo.menuItems[0] = new menuItem(0,"How to play one in the chamber");
		OITCInfo.menuItems[1] = new menuItem(0);
		OITCInfo.menuItems[2] = new menuItem(0,"You spawn with a ray gun with one shot, the only thing");
		OITCInfo.menuItems[3] = new menuItem(0,"you can do is shoot or grab. Ray gun shots and pummels");
		OITCInfo.menuItems[4] = new menuItem(0,"instantly kill and give you an extra shot for you ray gun.");


		subMenu OITCMain = new subMenu(1,"One in the chamber");

		OITCMain.menuItems[0] = new menuItem(0,"One in the chamber main menu");
		OITCMain.menuItems[1] = new menuItem(0);
		OITCMain.menuItems[2] = new menuItem(1,"8032C950","Play");
		OITCMain.menuItems[3] = OITCSettings;
		OITCMain.menuItems[4] = OITCInfo;

		subMenu IJZSettings = new subMenu(1,"Infinite jump zone settings");

		IJZSettings.menuItems[0] = new menuItem(0,"Infinite jump zone settings");
		IJZSettings.menuItems[1] = new menuItem(0);
		IJZSettings.menuItems[2] = new menuItem(8,"box x1:",-80,200,5,-200);
		IJZSettings.menuItems[3] = new menuItem(8,"box x2:",80,200,5,-200);
		IJZSettings.menuItems[4] = new menuItem(8,"box y1:",80,200,5,-200);
		IJZSettings.menuItems[5] = new menuItem(8,"box y2:",-25,200,5,-200);

		subMenu IJZInfo = new subMenu(1,"How to play infinite jump zone");

		IJZInfo.menuItems[0] = new menuItem(0,"How to play infinite jump zone");
		IJZInfo.menuItems[1] = new menuItem(0);
		IJZInfo.menuItems[2] = new menuItem(0,"Stay inside the box to receive infinite jumps, as well as");
		IJZInfo.menuItems[3] = new menuItem(0,"to get out of freefall. Leaving the box leaves you with");
		IJZInfo.menuItems[4] = new menuItem(0,"only one jump.");


		subMenu IJZMain = new subMenu(1,"Infinite Jump Zone");

		IJZMain.menuItems[0] = new menuItem(0,"Infinite Jump Zone main menu");
		IJZMain.menuItems[1] = new menuItem(0);
		IJZMain.menuItems[2] = new menuItem(1,"8032C954","Play");
		IJZMain.menuItems[3] = IJZSettings;
		IJZMain.menuItems[4] = IJZInfo;
		
		subMenu CYOPMain = new subMenu(1,"Create your own platforms");
		
		CYOPMain.menuItems[0] = new menuItem(0,"Create your own platforms main menu");
		CYOPMain.menuItems[1] = new menuItem(0);
		CYOPMain.menuItems[2] = new menuItem(1,"8032C968","Play");
		
		subMenu VolleyballMain = new subMenu(1,"Volleyball");
		
		VolleyballMain.menuItems[0] = new menuItem(0,"Volleyball main menu");
		VolleyballMain.menuItems[1] = new menuItem(0);
		VolleyballMain.menuItems[2] = new menuItem(1,"8032C978","Play");
		
		
		subMenu BasketballMain = new subMenu(1,"Basketball");
		
		BasketballMain.menuItems[0] = new menuItem(0,"Basketball main menu");
		BasketballMain.menuItems[1] = new menuItem(0);
		BasketballMain.menuItems[2] = new menuItem(1,"8032C97c","Play");
		
		subMenu CTFMain = new subMenu(1,"Capture the flag");
		
		CTFMain.menuItems[0] = new menuItem(0,"Capture the flag platforms main menu");
		CTFMain.menuItems[1] = new menuItem(0);
		CTFMain.menuItems[2] = new menuItem(1,"8032C980","Play");
		
		subMenu ChessMain = new subMenu(1,"Chess Melee");
		
		ChessMain.menuItems[0] = new menuItem(0,"Chess melee main menu");
		ChessMain.menuItems[1] = new menuItem(0);
		ChessMain.menuItems[2] = new menuItem(1,"8032C96c","Play");
		
		subMenu DualMain = new subMenu(1,"Dual 1v1");
		
		DualMain.menuItems[0] = new menuItem(0,"Dual 1v1 main menu");
		DualMain.menuItems[1] = new menuItem(0);
		DualMain.menuItems[2] = new menuItem(1,"8032C970","Play");
		
		subMenu TauntMain = new subMenu(1,"Taunt battle");
		
		TauntMain.menuItems[0] = new menuItem(0,"Taunt Battle main menu");
		TauntMain.menuItems[1] = new menuItem(0);
		TauntMain.menuItems[2] = new menuItem(1,"8032C974","Play");
		
		subMenu minigamesMain = new subMenu(1,"Minigames");

		minigamesMain.menuItems[0] = new menuItem(0,"Minigames");
		minigamesMain.menuItems[1] = new menuItem(0);
		minigamesMain.menuItems[2] = DPMain;
		minigamesMain.menuItems[3] = KOTHMain;
		minigamesMain.menuItems[4] = MRSSMain;
		minigamesMain.menuItems[5] = SBMain;
		minigamesMain.menuItems[6] = OITCMain;
		minigamesMain.menuItems[7] = IJZMain;
		minigamesMain.menuItems[8] = CYOPMain;
		minigamesMain.menuItems[9] = VolleyballMain;
		minigamesMain.menuItems[10] = BasketballMain;
		minigamesMain.menuItems[11] = CTFMain;

		subMenu extrasMain = new subMenu(1,"Extras");

		extrasMain.menuItems[0] = new menuItem(0,"Extras");
		extrasMain.menuItems[1] = new menuItem(0);
		extrasMain.menuItems[2] = ChessMain;
		extrasMain.menuItems[3] = DualMain;
		extrasMain.menuItems[4] = TauntMain;
		extrasMain.menuItems[5] = BBWMain;
		
		generalGamemodes.menuItems[0] = new menuItem(0,"Gamemodes");
		generalGamemodes.menuItems[1] = new menuItem(0);
		generalGamemodes.menuItems[2] = ATWmainMenu;
		generalGamemodes.menuItems[3] = ironManMain;
		generalGamemodes.menuItems[4] = ssMain;
		generalGamemodes.menuItems[5] = amMain;
		generalGamemodes.menuItems[6] = Smash64Main;
		generalGamemodes.menuItems[7] = brawlMain;
		generalGamemodes.menuItems[8] = sixPlayerMain;
		generalGamemodes.menuItems[9] = minigamesMain;
		generalGamemodes.menuItems[10] = shuffleMain;
		generalGamemodes.menuItems[11] = extrasMain;
		generalGamemodes.menuItems[12] = new menuItem(0);
		generalGamemodes.menuItems[13] = specialMelee;
		generalGamemodes.menuItems[14] = new menuItem(2,"Custom gamemodes: ",ende,0);

		subMenu playerAttributes = new subMenu(1,"Player Attributes");
		subMenu tourneyMods = new subMenu(1,"Tourney mods");

		generalMain.menuItems[0] = new menuItem(0,"General");
		generalMain.menuItems[1] = new menuItem(0);
		generalMain.menuItems[2] = playerAttributes;
		generalMain.menuItems[3] = tourneyMods;
		generalMain.menuItems[4] = new menuItem(0);
		generalMain.menuItems[5] = new menuItem(8,"Game speed mult: ",1,3,0.0625,0.0625);
		generalMain.menuItems[6] = new menuItem(2,"Disable Star KO: ",onoff,1);
		generalMain.menuItems[7] = new menuItem(2,"Melee Version: ",versions,0) ;
		generalMain.menuItems[8] = new menuItem(2,"Widescreen: ",onoff,1);
		generalMain.menuItems[9] = new menuItem(2,"Lag reduction: ",onoff,1);

		tourneyMods.menuItems[0] = new menuItem(0,"Tourney Mods");
		tourneyMods.menuItems[1] = new menuItem(0);
		tourneyMods.menuItems[2] = new menuItem(2,"C Stick in 1p modes: ",ende,0);
		tourneyMods.menuItems[3] = new menuItem(2,"Adjust Default CSS hand position: ",ende,1);
		tourneyMods.menuItems[4] = new menuItem(2,"Skip Results Screen: ",ende,0);
		tourneyMods.menuItems[5] = new menuItem(2,"Ledgegrab Limit: ",ende,1);
		tourneyMods.menuItems[6] = new menuItem(3,"Max Ledge Grabs: ",60,150,1);
		tourneyMods.menuItems[7] = new menuItem(2,"Wobbling Fix: ",ende,1);
		tourneyMods.menuItems[8] = new menuItem(2,"UCF",ende,0);
		tourneyMods.menuItems[9] = new menuItem(2,"Decreased Dreamland Volume: ",ende,1);

		playerAttributes.menuItems[0] = new menuItem(0,"Player Attributes");
		playerAttributes.menuItems[1] = new menuItem(0);
		playerAttributes.menuItems[2] = new menuItem(0,"Player 1 Scales:");
		playerAttributes.menuItems[3] = new menuItem(8,"Player: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[4] = new menuItem(8,"Offense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[5] = new menuItem(8,"Defense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[6] = new menuItem(0);
		playerAttributes.menuItems[7] = new menuItem(0,"Player 2 Scales:");
		playerAttributes.menuItems[8] = new menuItem(8,"Player: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[9] = new menuItem(8,"Offense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[10] = new menuItem(8,"Defense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[11] = new menuItem(0);
		playerAttributes.menuItems[12] = new menuItem(0,"Player 3 Scales:");
		playerAttributes.menuItems[13] = new menuItem(8,"Player: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[14] = new menuItem(8,"Offense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[15] = new menuItem(8,"Defense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[16] = new menuItem(0);
		playerAttributes.menuItems[17] = new menuItem(0,"Player 4 Scales:");
		playerAttributes.menuItems[18] = new menuItem(8,"Player: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[19] = new menuItem(8,"Offense: ",1,3,0.0625,0.0625);
		playerAttributes.menuItems[20] = new menuItem(8,"Defense: ",1,3,0.0625,0.0625);

		subMenu customItemSelectScreen = new subMenu(1,"Custom Choose Random Item Builder");
		subMenu customPokemonSelectScreen = new subMenu(1,"Custom Choose random pokemon builder");
		subMenu customItemSelectScreen2 = new subMenu(1,"Next Page ");
		subMenu customPokemonSelectScreen2 = new subMenu(1,"Next page");

		generalItems.menuItems[0] = new menuItem(0,"Items");
		generalItems.menuItems[1] = new menuItem(0);
		generalItems.menuItems[2] = new menuItem(2,"Custom item timer: ",ende,0);
		generalItems.menuItems[3] = new menuItem(3,"Custom Timer: ",800,2000,5);
		generalItems.menuItems[4] = new menuItem(0);
		generalItems.menuItems[5] = new menuItem(2,"Use Custom Item Spawn Rate: ", ende,1);
		generalItems.menuItems[6] = customItemSelectScreen;
		generalItems.menuItems[7] = new menuItem(2,"Use Custom Pokemon Spawn Rate: ", ende,1);
		generalItems.menuItems[8] = customPokemonSelectScreen;
		generalItems.menuItems[9] = new menuItem(0);
		generalItems.menuItems[10] = new menuItem(3,"Max items on screen: ",40,100,1);
		generalItems.menuItems[11] = new menuItem(2,"Fancy throwing: ",ende,1);
		generalItems.menuItems[12] = new menuItem(2,"Taunt to gain item: ",ende,1);


		customItemSelectScreen.menuItems[0] = new menuItem(0,"Custom Choose Random Item Builder");
		customItemSelectScreen.menuItems[1] = new menuItem(0);
		customItemSelectScreen.menuItems[2] = customItemSelectScreen2;
		customItemSelectScreen.menuItems[3] = new menuItem(8,"Red shell",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[4] = new menuItem(8,"Ray gun",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[5] = new menuItem(8,"Freezie",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[6] = new menuItem(8,"Food",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[7] = new menuItem(8,"Motion Mine",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[8] = new menuItem(8,"Flipper",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[9] = new menuItem(8,"Super scope",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[10] = new menuItem(8,"Star rod",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[11] = new menuItem(8,"Lips stick",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[12] = new menuItem(8,"Fan",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[13] = new menuItem(8,"Fire flower",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[14] = new menuItem(8,"Super mushroom",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[15] = new menuItem(8,"Poison Mushroom",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[16] = new menuItem(8,"Hammer",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[17] = new menuItem(8,"Warp star",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[18] = new menuItem(8,"Screw attack",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[19] = new menuItem(8,"Bunny hood",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[20] = new menuItem(8,"Metal box",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[21] = new menuItem(8,"Cloaking device",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[22] = new menuItem(8,"Pokeball",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[23] = new menuItem(8,"Yoshi egg",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[24] = new menuItem(8,"Barrel cannon",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[25] = new menuItem(8,"Party ball",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[26] = new menuItem(8,"Egg",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[27] = new menuItem(8,"Barrel",1,100,0.1,-0.1);
		customItemSelectScreen.menuItems[28] = new menuItem(8,"Box",1,100,0.1,-0.1);

		customItemSelectScreen2.menuItems[0] = new menuItem(0,"Custom Choose Random Item Builder");
		customItemSelectScreen2.menuItems[1] = new menuItem(0);
		customItemSelectScreen2.menuItems[2] = new menuItem(8,"Bob-omb",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[3] = new menuItem(8,"Mr saturn",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[4] = new menuItem(8,"Heart Canister",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[5] = new menuItem(8,"Maxim Tomato",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[6] = new menuItem(8,"Starman",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[7] = new menuItem(8,"Homerun bat",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[8] = new menuItem(8,"Beam sword",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[9] = new menuItem(8,"Parasol",1,100,0.1,-0.1);
		customItemSelectScreen2.menuItems[10] = new menuItem(8,"Green shell",1,100,0.1,-0.1);

		customItemSelectScreen2.menuItems[11] = new menuItem(0);
		customItemSelectScreen2.menuItems[12] = new menuItem(0,"Each of the numbers represents the % chance for the item to spawn.");
		customItemSelectScreen2.menuItems[13] = new menuItem(0,"The chance for capsule to spawn is the remaining amount if your");
		customItemSelectScreen2.menuItems[14] = new menuItem(0,"values add up to less than 100. If your values add up to over 100,");
		customItemSelectScreen2.menuItems[15] = new menuItem(0,"the items at the end of the list cannot spawn.");
		customItemSelectScreen2.menuItems[16] = new menuItem(0,"Its up to you to do the math.");

		customPokemonSelectScreen.menuItems[0] = new menuItem(0,"Custom Choose Random Pokemon Builder");
		customPokemonSelectScreen.menuItems[1] = new menuItem(0);
		customPokemonSelectScreen.menuItems[2] = customPokemonSelectScreen2;
		customPokemonSelectScreen.menuItems[3] = new menuItem(8,"Weezing",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[4] = new menuItem(8,"Charizard",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[5] = new menuItem(8,"Moltres",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[6] = new menuItem(8,"Zapdos",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[7] = new menuItem(8,"Articuno",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[8] = new menuItem(8,"Wobuffet",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[9] = new menuItem(8,"Scizor",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[10] = new menuItem(8,"Unown",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[11] = new menuItem(8,"Entei",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[12] = new menuItem(8,"Raikou",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[13] = new menuItem(8,"Suicune",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[14] = new menuItem(8,"Bellossom",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[15] = new menuItem(8,"Voltorb",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[16] = new menuItem(8,"Lugia",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[17] = new menuItem(8,"Hooh",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[18] = new menuItem(8,"Ditto",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[19] = new menuItem(8,"Clefairy",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[20] = new menuItem(8,"Togepi",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[21] = new menuItem(8,"Mew",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[22] = new menuItem(8,"Celebi",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[23] = new menuItem(8,"Staryu",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[24] = new menuItem(8,"Chansey",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[25] = new menuItem(8,"Porygon",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[26] = new menuItem(8,"Cyndaquil",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[27] = new menuItem(8,"Marill",1,100,0.1,-0.1);
		customPokemonSelectScreen.menuItems[28] = new menuItem(8,"Venusaur",1,100,0.1,-0.1);

		customPokemonSelectScreen2.menuItems[0] = new menuItem(0,"Custom Choose Random Pokemon Builder");
		customPokemonSelectScreen2.menuItems[1] = new menuItem(0);
		customPokemonSelectScreen2.menuItems[2] = new menuItem(8,"Chikorita",1,100,0.1,-0.1);
		customPokemonSelectScreen2.menuItems[3] = new menuItem(8,"Snorlax",1,100,0.1,-0.1);
		customPokemonSelectScreen2.menuItems[4] = new menuItem(8,"Blastoise",1,100,0.1,-0.1);
		customPokemonSelectScreen2.menuItems[5] = new menuItem(0);
		customPokemonSelectScreen2.menuItems[6] = new menuItem(0,"Each of the numbers represents the % chance for the item to spawn.");
		customPokemonSelectScreen2.menuItems[7] = new menuItem(0,"The chance for goldeen to spawn is the remaining amount if your");
		customPokemonSelectScreen2.menuItems[8] = new menuItem(0,"values add up to less than 100. If your values add up to over 100,");
		customPokemonSelectScreen2.menuItems[9] = new menuItem(0,"the pokemon at the end of the list cannot spawn.");
		customPokemonSelectScreen2.menuItems[10] = new menuItem(0,"Its up to you to do the math.");

		subMenu customStageSelectScreen = new subMenu(1,"Custom Stage Select Screen Builder");

		customStageSelectScreen.menuItems[0] = new menuItem(2,"Peachs Castle: ",stages,4);
		customStageSelectScreen.menuItems[1] = new menuItem(2,"Rainbow Cruise: ",stages,11);
		customStageSelectScreen.menuItems[2] = new menuItem(2,"Kongo Jungle: ",stages,5);
		customStageSelectScreen.menuItems[3] = new menuItem(2,"Jungle Japes: ",stages,12);
		customStageSelectScreen.menuItems[4] = new menuItem(2,"Great Bay: ",stages,13);
		customStageSelectScreen.menuItems[5] = new menuItem(2,"Hyrule Temple: ",stages,14);
		customStageSelectScreen.menuItems[6] = new menuItem(2,"Brinstar: ",stages,6);
		customStageSelectScreen.menuItems[7] = new menuItem(2,"Brinstar Depths: ",stages,15);
		customStageSelectScreen.menuItems[8] = new menuItem(2,"Yoshis Story: ",stages,8);
		customStageSelectScreen.menuItems[9] = new menuItem(2,"Yoshis Island: ",stages,16);
		customStageSelectScreen.menuItems[10] = new menuItem(2,"Fountain Of Dreams: ",stages,2);
		customStageSelectScreen.menuItems[11] = new menuItem(2,"Green Greens: ",stages,17);
		customStageSelectScreen.menuItems[12] = new menuItem(2,"Corneria: ",stages,7);
		customStageSelectScreen.menuItems[13] = new menuItem(2,"Venom: ",stages,22);
		customStageSelectScreen.menuItems[14] = new menuItem(2,"Pokemon Stadium: ",stages,3);
		customStageSelectScreen.menuItems[15] = new menuItem(2,"Poke Floats: ",stages,23);
		customStageSelectScreen.menuItems[16] = new menuItem(2,"Mute City: ",stages,10);
		customStageSelectScreen.menuItems[17] = new menuItem(2,"Big Blue: ",stages,24);
		customStageSelectScreen.menuItems[18] = new menuItem(2,"Onett: ",stages,9);
		customStageSelectScreen.menuItems[19] = new menuItem(2,"Fourside: ",stages,18);
		customStageSelectScreen.menuItems[20] = new menuItem(2,"Mushroom Kingdom 1: ",stages,19);
		customStageSelectScreen.menuItems[21] = new menuItem(2,"Mushroom Kingdom 2: ",stages,20);
		customStageSelectScreen.menuItems[22] = new menuItem(2,"Icicle Mountain: ",stages,25);
		customStageSelectScreen.menuItems[23] = new menuItem(2,"Flatzone: ",stages,27);
		customStageSelectScreen.menuItems[24] = new menuItem(2,"Battlefield: ",stages,31);
		customStageSelectScreen.menuItems[25] = new menuItem(2,"Final Destination: ",stages,32);
		customStageSelectScreen.menuItems[26] = new menuItem(2,"Dreamland: ",stages,28);
		customStageSelectScreen.menuItems[27] = new menuItem(2,"Yoshis Island 64: ",stages,29);
		customStageSelectScreen.menuItems[28] = new menuItem(2,"Kongo Jungle 64: ",stages,30);



		generalStages.menuItems[0] = new menuItem(0,"Stages");
		generalStages.menuItems[1] = new menuItem(0);
		generalStages.menuItems[2] = customStageSelectScreen;
		generalStages.menuItems[3] = new menuItem(0,"Custom Stage Select Screen does not work with auto random stage on");
		generalStages.menuItems[4] = new menuItem(0);
		generalStages.menuItems[5] = new menuItem(2,"Shy guys: ",ende,0);
		generalStages.menuItems[6] = new menuItem(2,"Pokemon Stadium Transformations: ",ende,1);
		generalStages.menuItems[7] = new menuItem(2,"Dreamland wind: ",ende,0);
		generalStages.menuItems[8] = new menuItem(2,"Brinstar lava: ",ende,0);
		generalStages.menuItems[9] = new menuItem(2,"FOD platforms and jets: ",ende,0);
		generalStages.menuItems[10] = new menuItem(2,"Corneria ships: ",ende,0);
		generalStages.menuItems[11] = new menuItem(2,"Corneria great gun: ",ende,0);
		generalStages.menuItems[12] = new menuItem(2,"Green Greens blocks: ",ende,0);
		generalStages.menuItems[13] = new menuItem(2,"Green Greens wind and apples: ",ende,0);
		generalStages.menuItems[14] = new menuItem(2,"Peachs Castle switches and bullets: ",ende,0);
		generalStages.menuItems[15] = new menuItem(2,"FD background transitions: ",ende,0);
		generalStages.menuItems[16] = new menuItem(2,"Mushroom Kingdom 1 Levers: ",ende,0);
		generalStages.menuItems[17] = new menuItem(2,"Mushroom Kingdom 1 blocks respawn: ",ende,0);
		generalStages.menuItems[18] = new menuItem(2,"Jungle Japes water and klap trap: ",ende,0);
		generalStages.menuItems[19] = new menuItem(2,"Onett Cars: ",ende,0);
		generalStages.menuItems[20] = new menuItem(2,"Onett drug store platforms: ",ende,0);
		generalStages.menuItems[21] = new menuItem(2,"Mute city cars: ",ende,0);
		generalStages.menuItems[22] = new menuItem(2,"Kongo Jungle Barrel: ",ende,0);
		generalStages.menuItems[23] = new menuItem(2,"Kongo Jungle 64 Barrel: ",ende,0);






		ArrayList<jsonObject> list = new ArrayList<jsonObject>();

		printMenu(projectATW,myFile,list,0);
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
		String thing = "";
		for(int i = 0; i < list.size(); i++) {
			jsonObject temp = list.get(i);
			thing += ("\n        {\n          \"type\": \"replaceCodeBlock\",\n          \"address\": \"" + temp.address + "\",\n          \"sourceFile\": \"" + temp.filelol + "\"\n        },");
		}
		thing = thing.replace("\\", "/");
		pr.print(thing);
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


		done2[currentID2] = message;
		doneoffset2[currentID2] = eighty + Integer.toHexString(textSpace);
		currentID2++;

		text += temp;
		String returned = eighty + Integer.toHexString(textSpace);
		textSpace += (message.length()) + (times);
		return returned;
	}
	public static String getListPointer(String[] list) {
		int currentTextSpace = textSpace;
		int backup = textSpace;


		for(int k = 0; k < currentID;k++) {
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

		done[currentID] = list;
		doneoffset[currentID] = eighty + Integer.toHexString(backup);
		currentID++;

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
		var += ".long 0x" + U32((int)value) + " # .set" + menu.text + ", debugSpace+" +  spaceLOL +"\n";
		spaceLOL+=4;
		return returns;
	}
	public static String getVarPointer(float value, menuItem menu) {
		String returns = eighty + Integer.toHexString(varSpace);
		varSpace += 4;
		var += ".long 0x" + getFloat(value) + " # .set" + menu.text + ", debugSpace+"+spaceLOL+ "\n";
		spaceLOL+=4;
		return returns;
	}


	public static int getNumOfMenuItems(subMenu current) {
		int num = 0;
		for(int i = 0; i < current.menuItems.length; i++ ) {
			if(current.menuItems[i] != null) {
				num++;
			}
		}
		return (num*4*8)+4;
	}


	public static void printMenu(subMenu menu, String filename, ArrayList<jsonObject> list, int deep) throws InterruptedException, IOException {
		String data = "";
		int backup = 0;
		File newFile = new File("");
		for(int i = 0; i < menu.menuItems.length; i++) {
			if(menu.menuItems[i] == null) {
				break;
			}
			if(i == 0) {
				data = "#To be inserted at " + eighty + Integer.toHexString(currentMenuSpace) + "\n";
				newFile = new File(myFile + menu.text + ".s");
				list.add(new jsonObject((eighty + Integer.toHexString(currentMenuSpace)),newFile));
				System.out.println(menu.text + " : " + data);
				currentMenuSpace+=getNumOfMenuItems(menu);
				backup = currentMenuSpace;
			}

			if(menu.menuItems[i] instanceof subMenu) {
				subMenu temp = (subMenu) menu.menuItems[i];
				printMenu(temp,filename,list,deep+1);
			}
			menu.menuItems[i].injectSpot = backup;
			backup = currentMenuSpace;
			switch (menu.menuItems[i].type) {
			case 0:
				data += "\n.long 0";
				if(menu.menuItems[i].functPointer != null) {
					data += "\n.long 0x" + menu.menuItems[i].functPointer;
				}else {
				data += "\n.long 0";
				}
				data += "\n.long 0x" + getTextPointer(menu.menuItems[i].text);
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				data += "\n.long 0";
				break;
			case 1:

				data += "\n.long 1";
				if(menu.menuItems[i].functPointer == null) {
					data += "\n.long 0x" + functions[deep];
				}
				else {
					data += "\n.long 0x" + menu.menuItems[i].functPointer;
				}
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
				data += "\n.long 0x" + getFloat((float) menu.menuItems[i].minValue);
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
