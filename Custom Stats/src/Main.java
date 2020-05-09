import java.io.*;

public class Main {

	public static String thomasTag = "8190819081908190";
	public static String brettTag = "53544C4E00000000";
	public static String brunoTag = "";
	public static String braedenTag = "4141410000000000";
	public static String rayvaxTag = "";
	public static String elliotTag = "4849505900000000";
	
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
		
		byte[] search = {0x39,2,-1};
		byte[] search2 = {0x39,1,-1};
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
	    
	    if((p1charsLeft + p2charsLeft + p3charsLeft + p4charsLeft) == 4) {
	    	currentGame = 0;
	    }
	    else {
	    	currentGame++;
	    }
	    
	    if(numOfPlayers < 4) {
	    	return;
	    }
		
		
		for(int i = 0; i < 4; i++) {
			raf.seek(146 + (i * 36));
			String temp = "";
			temp = String.format("%02X", raf.readByte());
			if(temp.equals("00")) {
				raf.seek(statsOffset);
				ATWPlayers[players[i]].currentCharsLeft = charsLeft[i];
				writeStats(ATWPlayers[players[i]],file,raf,i,doublesBool);
			}
			raf.skipBytes(35);
		}
		
		
		
		
		
	}
	
	public static void writeStats(ATWPlayer player, File file, RandomAccessFile raf, int port, int gameType) throws IOException {
		boolean won = false;
		if(currentGame != 0) {
			player.gamesPlayed++;
			player.gameStats[gameType][0]++;
			if(!(player.currentCharsLeft > player.pastCharsLeft)){
				player.gameStats[gameType][1]++;
				won = true;
			}
			player.pastCharsLeft = player.currentCharsLeft;
		}
		else{
			player.pastCharsLeft = 1;
			player.currentCharsLeft = 1;
		}
		raf.skipBytes(8+port);
		player.numItemsPickedUp += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		raf.skipBytes(4);
		player.longestDrought += Integer.parseInt(String.format("%02X", raf.readByte()),16);
		for(int i = 0; i < 8; i++) {
			raf.skipBytes(4);
			int flag = Integer.parseInt(String.format("%02X", raf.readByte()),16);
			if(flag != 0) {
				player.itemStats[i][0]++;
			}
			if(won) {
				player.itemStats[i][1]++;
			}
		}
		

	}
	
	public static void printStats(ATWPlayer player) {
		
	}

	public static long bytesIndexOf(byte[] source, byte[] search, byte[] search2, long fromIndex) {
	    boolean find = false;
	    long i;
	    for (i = fromIndex; i < (source.length - search.length); i++) {
	        if (source[(int) i] == search[0] || source[(int) i] == search2[0]) {
	            find = true;
	            for (int j = 0; j < search.length; j++) {
	                if (source[(int) (i + j)] != search[j] && source[(int) (i + j)] != search2[j]) {
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

}
