
public class ATWPlayer {
	String name;
	int gamesPlayed;
	int[][] gameStats = new int[2][2];
	int damageDealt;
	int damageRecieved;
	int longestDrought;
	int numItemsPickedUp;
	int[][] itemStats = new int [8][2];
	int[][] charStats = new int [26][2];
	int currentCharsLeft;
	int pastCharsLeft;
	
	
	


	public ATWPlayer(String pname) {
		this.name = pname;
	}
	
}
