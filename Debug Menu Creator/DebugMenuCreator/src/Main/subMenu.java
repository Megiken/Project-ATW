package Main;

public class subMenu extends menuItem{
	public menuItem[] menuItems = new menuItem[100];
	int injectSpot;
	public subMenu(int i, String name) {
		super(i,name);
	}
	public subMenu(int i, int j) {
		super(i);
		this.injectSpot = j;
	}
	public subMenu() {
		super();
	}
}
