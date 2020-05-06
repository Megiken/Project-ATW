package Main;

public class menuItem {
	
	String text;
	int type;
	String functPointer;
	String[] listPointer;
	double LRItems;
	double valToInc;
	double defaultValue;
	int injectSpot;
	public menuItem() {
		
	}
	
	//0 or 1
	
	public menuItem(int i, String p) {
		type = i;
		text = p;
	}
	
	//2
	
	public menuItem(int i, String j, String[] k,int l) {
		type = i;
		text = j;
		listPointer = k;
		defaultValue = l;
	}
	
	//3
	
	public menuItem(int i, String j, int m,int k, int l) {
		type = i;
		text = j;
		defaultValue = m;
		LRItems = k;
		valToInc = l;
	}
	
	//7
	
	public menuItem(int i, String j,String k) {
		type = i;
		functPointer = j;
		text = k;
	}
	
	//8
	public menuItem(int i, String j, double m,double k, double l) {
		type = i;
		text = j;
		defaultValue = m;
		LRItems = k;
		valToInc = l;
		functPointer = "0";
	}
	
	public menuItem(int i, String p, String j, double m,double k, double l) {
		type = i;
		text = j;
		defaultValue = m;
		LRItems = k;
		valToInc = l;
		functPointer = p;
	}
	
	//9
	
	public menuItem(int i) {
		type = i;
	}

}
