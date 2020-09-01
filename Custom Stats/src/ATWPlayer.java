
public class ATWPlayer {
	String name;
	boolean wonPrevGame;
	double gamesPlayed;
	double[][] gameStats = new double[3][2];
	double damageDealt;
	double damageRecieved;
	double longestDrought;
	double numItemsPickedUp;
	double[][] charStats = new double [26][2];
	double [][] stageStats = new double [200][2];
	int currentCharsLeft;
	int pastCharsLeft;
	int currentCharacter;
	int pastCharacter;
	double playersKilled;
	double deaths;
	double SDs;
	
	
	


	public ATWPlayer(String pname) {
		this.name = pname;
	}
	
}
