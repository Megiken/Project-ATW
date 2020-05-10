import java.io.*;

public class Main {

	public static String thomasTag = "8190819081908190";
	public static String brettTag = "53544C4E00000000";
	public static String brunoTag = "";
	public static String braedenTag = "4141410000000000";
	public static String rayvaxTag = "";
	public static String elliotTag = "4849505900000000";

	public static byte[] search = {0x39,2,-1};
	public static byte[] search2 = {0x39,1,-1};
	public static byte[] search3 = {0x39,3,-1};

    public static int gameType = 0;
    public static int prevGameType = 0;


	public static ATWPlayer unknown = new ATWPlayer("Unknown");
	public static ATWPlayer thomas = new ATWPlayer("Thomas");
	public static ATWPlayer brett = new ATWPlayer("Brett");
	public static ATWPlayer bruno = new ATWPlayer("Bruno");
	public static ATWPlayer braeden = new ATWPlayer("Braeden");
	public static ATWPlayer rayvax = new ATWPlayer("Rayvax");
	public static ATWPlayer elliot = new ATWPlayer("Elliot");

	public static int currentGame = 0;

	public static int[] stageData = new int[29];

	public static ATWPlayer[] ATWPlayers = {unknown,thomas,brett,bruno,braeden,rayvax,elliot};

	public static String[] tags = {thomasTag,brettTag,brunoTag,braedenTag,rayvaxTag,elliotTag};

	public static void main(String[] args) throws IOException {

		File slippiDir = new File("C:\\Users\\Thomas\\Downloads\\Dolphins\\FM-v5.9-Slippi-r18-Win\\FM-v5.9-Slippi-r18-Win\\Slippi");

		parseDirectory(slippiDir);




	}

	public static void parseDirectory(File file) throws IOException {
		if(!file.isDirectory()) {
			return;
		}
		File[] files = file.listFiles();
		for(int i = 0; i < files.length; i++){
			parseFile(files[i]);
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
			for(int j = 0; j < 6; j++) {
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
	    long statsOffset = bytesIndexOf(fileData,search,search2,file.length()-1200)-64;
	    raf.seek(statsOffset);
	    raf.skipBytes(1);
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
	    }else if(timeoutBool != 0) {
	    	gameType = 2;
	    }else {
	    	gameType = 0;
	    }

	    if((p1charsLeft + p2charsLeft + p3charsLeft + p4charsLeft) == 4) {
	    	currentGame = 0;
	    }
	    else {
	    	currentGame++;
	    }

	    if(numOfPlayers < 4) {
			for(int i = 0; i < 4; i++) {
		    	raf.seek(146 + (i * 36));
				String temp = String.format("%02X", raf.readByte());
				if(temp.equals("00")) {
					setEndWinnings(ATWPlayers[players[i]]);
				}
			}
			return;
	    }


	    for(int i = 0; i < 4; i++) {
			raf.seek(145 + (i * 36));
			int charID = Integer.parseInt(String.format("%02X", raf.readByte()),16);
			String temp = String.format("%02X", raf.readByte());
			if(temp.equals("00")) {
				raf.seek(statsOffset);
				ATWPlayers[players[i]].currentCharacter = charID;
				ATWPlayers[players[i]].currentCharsLeft = charsLeft[i];
				writeStats(ATWPlayers[players[i]],file,raf,i);
			}
			raf.skipBytes(35);
		}


		prevGameType = gameType;




	}

	public static void writeStats(ATWPlayer player, File file, RandomAccessFile raf, int port) throws IOException {
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
		}
		else{
			player.pastCharacter = player.currentCharacter;
			player.pastCharsLeft = player.currentCharsLeft;
		}
		raf.skipBytes(8+port);

		player.numItemsPickedUp += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		raf.skipBytes(4);
		player.longestDrought += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		raf.skipBytes(8);
		for(int i = 0; i < 8; i++) {
			int temp = 0;
			temp = Integer.parseInt(String.format("%02X", raf.readByte()),16);
			if(temp != 0) {
				player.itemStats[i][0]++;
				if(player.wonPrevGame) {
					player.itemStats[i][1]++;
				}
			}
			raf.skipBytes(4);

		}
	}

	public static void printStats() {
		for(int i = 0; i < ATWPlayers.length; i++) {
			if(ATWPlayers[i].gamesPlayed != 0) {
				System.out.println("Player's name: " + ATWPlayers[i].name);
				System.out.println("	Games played: " + ATWPlayers[i].gamesPlayed);
				System.out.println("	FFA games played: " + ATWPlayers[i].gameStats[0][0]);
				System.out.println("	FFA games won: " + ATWPlayers[i].gameStats[0][1]);
				System.out.println("	Doubles games played: " + ATWPlayers[i].gameStats[1][0]);
				System.out.println("	Doubles games Won: " + ATWPlayers[i].gameStats[1][1]);
				System.out.println("	Timout games played: " + ATWPlayers[i].gameStats[2][0]);
				System.out.println("	Timeout games won: " + ATWPlayers[i].gameStats[2][1]);
				System.out.println("	Average item pickups per game: " + ATWPlayers[i].numItemsPickedUp/ATWPlayers[i].gamesPlayed);
				System.out.println("	Average longest drought per game: " + ATWPlayers[i].longestDrought/ATWPlayers[i].gamesPlayed);
			}
		}
	}

	public static long bytesIndexOf(byte[] source, byte[] search, byte[] search2, long fromIndex) {
	    boolean find = false;
	    long i;
	    for (i = fromIndex; i < (source.length - search.length); i++) {
	        if (source[(int) i] == search[0] || source[(int) i] == search2[0]) {
	            find = true;
	            for (int j = 0; j < search.length; j++) {
	                if (source[(int) (i + j)] != search[j] && source[(int) (i + j)] != search2[j] && source[(int) (i + j)] != search3[j]) {
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