import java.io.*;
import java.util.Arrays;

public class Main {

	public static double[][] timeOuts = new double[3][2];
	
	public static boolean gameEnd = true;
	
	public static String thomasTag = "8190819081908190";
	public static String brettTag = "53544C4E00000000";
	public static String brunoTag = "4A415A5A00000000";
	public static String braedenTag = "4141410000000000";
	public static String rayvaxTag = "4242420000000000";
	public static String elliotTag = "4849505900000000";
	public static String jamesTag = "4D44510000000000";
	public static String zachbtag = "444B000000000000";
	
	public static byte[] search = {0x37,0x69,0x42,0x00};


    public static int gameType = 0;
    public static int prevGameType = 0;


	public static ATWPlayer unknown = new ATWPlayer("Unknown");
	public static ATWPlayer thomas = new ATWPlayer("Thomas");
	public static ATWPlayer brett = new ATWPlayer("Brett");
	public static ATWPlayer bruno = new ATWPlayer("Bruno");
	public static ATWPlayer braeden = new ATWPlayer("Braeden");
	public static ATWPlayer rayvax = new ATWPlayer("Rayvax");
	public static ATWPlayer elliot = new ATWPlayer("Elliot");
	public static ATWPlayer james = new ATWPlayer("James");
	public static ATWPlayer zachb = new ATWPlayer("Zacb B");

	public static int currentGame = 0;

	public static int[] stageData = new int[29];

	public static ATWPlayer[] ATWPlayers = {unknown,thomas,brett,bruno,braeden,rayvax,elliot,james,zachb};

	public static String[] tags = {thomasTag,brettTag,brunoTag,braedenTag,rayvaxTag,elliotTag,jamesTag,zachbtag};

	public static void main(String[] args) throws IOException {

		File currentDir = new File("C:\\Users\\Thomas\\Downloads\\Dolphins\\FM-v5.9-Slippi-r18-Win\\FM-v5.9-Slippi-r18-Win\\Slippi");

		File totalDir = new File("C:\\Users\\Thomas\\Desktop\\file backups");
		
		parseDirectory(currentDir);




	}

	public static void parseDirectory(File file) throws IOException {
		if(!file.isDirectory()) {
			return;
		}
		File[] files = file.listFiles();
		for(int i = 0; i < files.length; i++){
			parseFile(files[i]);
			System.out.println(files[i].getName());
		}
		printStats();

	}

	public static void parseFile(File file) throws IOException {
		int player1ID = 0;
		int player2ID = 0;
		int player3ID = 0;
		int player4ID = 0;
		int[] players = {player1ID,player2ID,player3ID,player4ID};
		RandomAccessFile raf = new RandomAccessFile(file,"r");
		raf.seek(397);
		for(int i = 0; i < 4; i++) {
			String temp = "";
			for(int j = 0; j < 8;j++) {
				temp += String.format("%02X", raf.readByte());
			}
			int found = 0;
			for(int j = 0; j < tags.length; j++) {
				if(temp.contentEquals(tags[j])) {
					found = j+1;
				}
			}
			players[i] = found;
			raf.skipBytes(8);
		}

		byte[] fileData = new byte[(int) file.length()];
	    DataInputStream dis = new DataInputStream(new FileInputStream(file));
	    dis.readFully(fileData);
	    dis.close();
	    long statsOffset = bytesIndexOf(fileData,search,file.length()-1200)+4;
	    if(statsOffset < 20) {
	    	return;
	    }
	    raf.seek(statsOffset);
	    int stageID = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int numOfPlayers = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int timeoutBool = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int doublesBool = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    if(doublesBool != 255) {
	    	doublesBool = 1;
	    }
	    else {
	    	doublesBool = 0;
	    }
	    int p1charsLeft = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int p2charsLeft = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int p3charsLeft = Integer.parseInt(String.format("%02X", raf.readByte()),16);
	    int p4charsLeft = Integer.parseInt(String.format("%02X", raf.readByte()),16);

	    int[] charsLeft = {p1charsLeft,p2charsLeft,p3charsLeft,p4charsLeft};

	    
		if(doublesBool != 0) {
	    	gameType = 1;
	    }else {
	    	gameType = 0;
	    }
		if(timeoutBool != 0) {
			timeOuts[numOfPlayers-2][1]++;
		}
		else {
			timeOuts[numOfPlayers-2][0]++;
		}

	    if((p1charsLeft + p2charsLeft + p3charsLeft + p4charsLeft) == 4) {
	    	currentGame = 0;
	    }
	    else {
	    	currentGame++;
	    }

	    if(numOfPlayers < 4) {
	    	if(gameEnd == false && currentGame != 0) {
	    		gameEnd = true;
				for(int i = 0; i < 4; i++) {
			    	raf.seek(146 + (i * 36));
					String temp = String.format("%02X", raf.readByte());
					if(temp.equals("00")) {
						setEndWinnings(ATWPlayers[players[i]]);
					}
				}
	    	}
			return;
	    }


	    for(int i = 0; i < 4; i++) {
			raf.seek(145 + (i * 36));
			int charID = Integer.parseInt(String.format("%02X", raf.readByte()),16);
			String temp = String.format("%02X", raf.readByte());
			long backup = raf.getFilePointer();
			if(temp.equals("00")) {
				raf.seek(statsOffset);
				ATWPlayers[players[i]].currentCharacter = charID;
				ATWPlayers[players[i]].currentCharsLeft = charsLeft[i];
				writeStats(ATWPlayers[players[i]],file,raf,i);
			}
			raf.seek(backup);
			raf.skipBytes(35);
		}


		prevGameType = gameType;




	}

	public static void writeStats(ATWPlayer player, File file, RandomAccessFile raf, int port) throws IOException {
		gameEnd = false;
		if(currentGame != 0) {
			player.gamesPlayed++;
			player.gameStats[prevGameType][0]++;
			player.charStats[player.pastCharacter][0]++;
			if(player.currentCharsLeft == player.pastCharsLeft) {
				player.gameStats[prevGameType][1]++;
				player.charStats[player.pastCharacter][1]++;
				player.wonPrevGame = true;
			}
			
			else {
				player.wonPrevGame = false;
			}
			player.pastCharacter = player.currentCharacter;
			player.pastCharsLeft = player.currentCharsLeft;
		}
		else{
			player.pastCharacter = player.currentCharacter;
			player.pastCharsLeft = player.currentCharsLeft;
		}
		raf.skipBytes(8+port);

		player.numItemsPickedUp += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		raf.skipBytes(3);
		player.longestDrought += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		raf.skipBytes(3);
		player.playersKilled += Integer.parseInt(String.format("%02X", raf.readByte()));
		raf.skipBytes(3);
		player.deaths += Integer.parseInt(String.format("%02X", raf.readByte()));
		raf.skipBytes(3);
		player.SDs += Integer.parseInt(String.format("%02X", raf.readByte()));
		raf.skipBytes((3-port)+(port*2));
		String temp = "" + Byte.toUnsignedInt(raf.readByte()) + Byte.toUnsignedInt(raf.readByte());
		player.damageDealt += Integer.parseInt(temp);
		raf.skipBytes(6);
		temp = "" + Byte.toUnsignedInt(raf.readByte()) + Byte.toUnsignedInt(raf.readByte());
		player.damageRecieved += Integer.parseInt(temp);
	}

	public static void printStats() {
		for(int i = 0; i < ATWPlayers.length; i++) {
			if(ATWPlayers[i].gamesPlayed != 0) {
				System.out.println("Player's name: " + ATWPlayers[i].name);
				try {
				System.out.println("	Games played: " + String.format("%.0f", ATWPlayers[i].gamesPlayed));	
				System.out.println("	FFA Win Rate: " + String.format("%.2f", (ATWPlayers[i].gameStats[0][1]/ATWPlayers[i].gameStats[0][0])*100)+ "%");
				System.out.println("	Doubles Win Rate: " +String.format("%.2f", (ATWPlayers[i].gameStats[1][1]/ATWPlayers[i].gameStats[1][0])*100)+ "%");
				System.out.println("	KDR: " +String.format("%.2f", ATWPlayers[i].playersKilled/ATWPlayers[i].deaths));
				System.out.println("	SD%: " + String.format("%.2f", (ATWPlayers[i].SDs/ATWPlayers[i].deaths)*100));
				System.out.println("	Damage dealt/damage received: " + String.format("%.2f", ATWPlayers[i].damageDealt/ATWPlayers[i].damageRecieved));
				System.out.println("	Average longest drought per game: " + String.format("%.2f", ATWPlayers[i].longestDrought/ATWPlayers[i].gamesPlayed));
				}
				catch (ArithmeticException e) {
					System.out.println("Not enough data");
				}
			}
		}
		System.out.println("Timeout % in 2 player games: " + (timeOuts[0][1]/timeOuts[0][0])*100);
		System.out.println("Timeout % in 3 player games: " + (timeOuts[1][1]/timeOuts[1][0])*100);
		System.out.println("Timeout % in 4 player games: " + (timeOuts[2][1]/timeOuts[2][0])*100);
	}

	public static long bytesIndexOf(byte[] source, byte[] search, long fromIndex) {
	    boolean find = false;
	    long i;
	    for (i = fromIndex; i < (source.length - search.length); i++) {
	        if (source[(int) i] == search[0]) {
	            find = true;
	            for (int j = 0; j < search.length; j++) {
	                if (source[(int) (i + j)] != search[j]) {
	                    find = false;
	                }
	            }
	        }
	        if (find) {
	            break;
	        }
	    }
	    if (!find) {
	        return -1;
	    }
	    return i;
	}

	public static void setEndWinnings(ATWPlayer player) {
		player.gamesPlayed++;
		player.gameStats[prevGameType][0]++;
		player.charStats[player.pastCharacter][0]++;
		if(player.currentCharsLeft == player.pastCharsLeft) {
			player.gameStats[prevGameType][1]++;
			player.charStats[player.pastCharacter][1]++;
		}
	}

}
