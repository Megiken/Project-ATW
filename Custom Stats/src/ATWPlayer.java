
public class ATWPlayer {
	String name;
	boolean wonPrevGame;
	int gamesPlayed;
	int[][] gameStats = new int[3][2];
	int damageDealt;
	int damageRecieved;
	int longestDrought;
	int numItemsPickedUp;
	int[][] charStats = new int [26][2];
	int currentCharsLeft;
	int pastCharsLeft;
	int currentCharacter;
	int pastCharacter;
	int playersKilled;
	int deaths;
	int SDs;
	
	
	


	public ATWPlayer(String pname) {
		this.name = pname;
	}
	
}
