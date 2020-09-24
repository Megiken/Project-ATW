package Main;

import java.io.*;
import java.util.ArrayList;

public class Main{
	public static String[] functions = {"803001dc","8032C908","8032C908","8032C908","8032C908","8032C908"};
	final static String toCSS = "8032C90c";
	final static String toCSSClear = "8032C910";
	public static int spaceLOL = 0;
	//public static int textSpace = 1650508;
	//public static int originalTextSpace = 1650508;
	//public static int subMenuSpace = 6671456;
	//public static int varSpace = 1679180;
	public static int varSpace = 4171872;
	public static int subMenuSpace = 4170976;
	public static int textSpace = 4171968;
	public static int originalTextSpace = 4171968;
	//public static int originalVarSpace = 1679180;
	public static int originalVarSpace = 4171872;
	public static int currentMenuSpace = subMenuSpace;
	public static String[][] done = new String[1000][1000];
	public static String[] doneoffset = new String[1000];
	public static String[] done2 = new String[1000];
	public static String[] doneoffset2 = new String[1000];
	public static int currentID = 0;
	public static int currentID2 = 0;
	public static File currentFile = new File("");
	public static String atwFilee = "C:\\Users\\Thomas\\Desktop\\Project-ATW\\ASM\\Misc\\Debug Menu\\Submenus\\ ";
	public static String memcardFile = "C:\\Users\\Thomas\\Desktop\\Project-ATW\\ATW Memory Card\\ASM\\Debug Menu\\ ";
	public static String text = "";
	public static String var = "";
	public static String eighty = "80";

	public static void main(String[] args) throws InterruptedException, IOException {
		
		subMenu projectATW = ProjectATW.getProjectATW();
		ArrayList<jsonObject> list = new ArrayList<jsonObject>();
		subMenu atwMemCard = ATWMemCard.getATWMemCard();
		//createDebugMenu(projectATW,atwFilee,list);
		createDebugMenu(atwMemCard,memcardFile,list);


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
	
	public static void createDebugMenu(subMenu menu, String filename, ArrayList<jsonObject> list) throws IOException, InterruptedException {

		printMenu(menu,filename,list,0);
		
		
		String data2 = "#To be inserted at " + eighty + Integer.toHexString(originalTextSpace) + "\n";
		File newFile = new File(filename + "Text" + ".s");
		FileWriter writer = new FileWriter(newFile);
		PrintWriter pr = new PrintWriter(writer);
		pr.print(data2 + text);
		pr.close();

		list.add(new jsonObject((eighty + Integer.toHexString(originalTextSpace)),newFile));

		data2 = "#To be inserted at " + eighty + Integer.toHexString(originalVarSpace) + "\n";
		newFile = new File(filename + "Variables" + ".s");
		writer = new FileWriter(newFile);
		pr = new PrintWriter(writer);
		pr.print(data2 + var);
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


	public static void printMenu(subMenu menu, String filename, ArrayList<jsonObject> list, int deep) throws InterruptedException, IOException {
		File backupFile = new File(filename);
		String data = "";
		int backup = 0;
		File newFile = new File("");
		for(int i = 0; i < menu.menuItems.length; i++) {
			if(menu.menuItems[i] == null) {
				break;
			}
			if(i == 0) {
				data = "#To be inserted at " + eighty + Integer.toHexString(currentMenuSpace) + "\n";
				newFile = new File(backupFile + menu.text + ".s");
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
