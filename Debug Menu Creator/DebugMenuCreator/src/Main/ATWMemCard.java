package Main;

public class ATWMemCard extends subMenu{
	public static String[] stages = {"Dummy","Test","Fountain Of Dreams","Pokemon Stadium","Peachs Castle","Kongo Jungle","Brinstar","Corneria","Yoshis Story","Onett","Mute City","Rainbow Cruise","Jungle Japes","Great Bay","Hyrule Temple","Brinstar Depths","Yoshis Island","Green Greens","Fourside","Mushroom Kingdom 1","Mushroom Kingdom 2","Akaneia","Venom","Poke Floats","Big Blue","Icicle Mountain","Icetop","Flatzone","Dreamland","Yoshis Island N64","Kongo Jungle N64","Battlefield","Final Destination","Mario Target Test","Captain Falcon Target Test","Young link Target Test","Donkey Kong Target Test","Dr Mario Target Test","Falco Target Test","Fox Target Test","Ice Climbers Target Test","Kirby Target Test","Bowser Target Test","Link Target Test","Luigi Target Test","Marth Target Test","Mewtwo Target Test","Ness Target Test","Peach Target Test","Pichu Target Test","Pikachu Target Test","Jigglypuff Target Test","Samus Target Test","Sheik Target Test","Yoshi Target Test","Zelda Target Test","Mr Game and watch Target Test","Roy Target Test","Ganondorf Target Test","Majoras Mask","Entei","Goomba","Mount Olympus","All star rest","Home run contest","Escape Shaft","Race to the finish","Duelist pro stage","Event 32 Corneria","Legal Green Greens","Legal big blue","Legal Peachs Castle","Legal Yoshis island","Legal Jungle Japes","Legal Great Bay","Legal Mushroom Kindom 2","Legal Yoshis Island N64","Legal Kongo Jungle","Smashville fourside","Skyrule","Kirby Ware","Lylat Cruise","Nintendo Gamecube","Kalos Pokemon League","Wario Ware Inc","Hyrule Castle","Suzaku Castle","Metal Cavern M","Metroid Lab","Battlefino Plaza","Smash 4 Battlefield","Miiverse","Splattlefino Plaza","Smash 4 FD","Saffron City","75m","Wario land"};
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
	public static String[] skins = {"Default","Custom 1","Custom 2","Custom 3","Custom 4","Custom 5","Shuffle"};
	public static String[] synTeams = {"P1 + P2","P1 + P3","P1 + P4"};
	public static subMenu getATWMemCard() {
		subMenu ATWMemCard = new subMenu(1,"Main Menu");	
		subMenu ATWstartMatch = new subMenu(1,"Start Match");
		subMenu ATWmatchSettings = new subMenu(1,"Settings");

		ATWstartMatch.menuItems[0] = new menuItem(0,"New game");
		ATWstartMatch.menuItems[1] = new menuItem(0);
		ATWstartMatch.menuItems[2] = new menuItem(1,"8032C914","Start new ATW");
		ATWstartMatch.menuItems[3] = new menuItem(0);
		ATWstartMatch.menuItems[4] = new menuItem(2,"Player 1 Character: ",chars,0);
		ATWstartMatch.menuItems[5] = new menuItem(2,"Player 2 Character: ",chars,0);
		ATWstartMatch.menuItems[6] = new menuItem(2,"Player 3 Character: ",chars,0);
		ATWstartMatch.menuItems[7] = new menuItem(2,"Player 4 Character: ",chars,0);
		
		subMenu atwInfo = new subMenu(1,"How to play ATW");

		atwInfo.menuItems[0] = new menuItem(0,"How to play");
		atwInfo.menuItems[1] = new menuItem(0);
		atwInfo.menuItems[2] = new menuItem(0,"Around the world is a game where you play through every character");
		atwInfo.menuItems[3] = new menuItem(0,"on random stages with items. It can be played 1v1, free for all,");
		atwInfo.menuItems[4] = new menuItem(0,"2v2, and even free for all with a mix of 2v2.");
		atwInfo.menuItems[5] = new menuItem(0,"On the character select screen, you can hit A to put yourself in");
		atwInfo.menuItems[6] = new menuItem(0,"the game, L to bring up the nametag screen, and R to bring up the");
		atwInfo.menuItems[7] = new menuItem(0,"rules.");
		

		ATWmatchSettings.menuItems[0] = new menuItem(0,"Game Settings");
		ATWmatchSettings.menuItems[1] = new menuItem(0);
		ATWmatchSettings.menuItems[2] = new menuItem(2,"Game Type: ",gameTypes,1);
		ATWmatchSettings.menuItems[3] = new menuItem(2,"Teams: ",teams,5);
		ATWmatchSettings.menuItems[4] = new menuItem(2,"Timer: ",timer,0);
		ATWmatchSettings.menuItems[5] = new menuItem(3,"Custom Timer: ",100,480,5);
		ATWmatchSettings.menuItems[6] = new menuItem(3,"Number of Characters: ",26,26,1);
		ATWmatchSettings.menuItems[7] = new menuItem(2,"Save stocks (iron man):",ende,1);
		
		ATWMemCard.menuItems[0] = new menuItem(0,"  /$$$$$$  /$$$$$$$$ /$$      /$$");
		ATWMemCard.menuItems[1] = new menuItem(0," /$$__  $$1__  $$__/1 $$  /$ 1 $$");
		ATWMemCard.menuItems[2] = new menuItem(0,"1 $$  7 $$   1 $$   1 $$ /$$$1 $$");
		ATWMemCard.menuItems[3] = new menuItem(0,"1 $$$$$$$$   1 $$   1 $$/$$ $$ $$");
		ATWMemCard.menuItems[4] = new menuItem(0,"1 $$__  $$   1 $$   1 $$$$_  $$$$");
		ATWMemCard.menuItems[5] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$$/ 7  $$$");
		ATWMemCard.menuItems[6] = new menuItem(0,"1 $$  1 $$   1 $$   1 $$/   7  $$");
		ATWMemCard.menuItems[7] = new menuItem(0,"1__/  1__/   1__/   1__/     7__/");
		ATWMemCard.menuItems[8] = new menuItem(0);
		ATWMemCard.menuItems[9] = ATWstartMatch;
		ATWMemCard.menuItems[10] = ATWmatchSettings;
		ATWMemCard.menuItems[11] = atwInfo;
		
		
		
		
		return ATWMemCard;
	}
}
