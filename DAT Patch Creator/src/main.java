import java.io.*;
import java.util.*;

public class main {

	public static void main(String[] args) throws IOException {
		File file1 = new File("C:\\Users\\Thomas\\Desktop\\ItCo.usd");
		File file2 = new File("C:\\Users\\Thomas\\Desktop\\atw ItCo lite.usd");
		File fileout = new File("thing.txt");
		
		byte[] bytes1 = new byte[4];
		byte[] bytes2 = new byte[4];
		
		PrintWriter pr = new PrintWriter(fileout);
		
		RandomAccessFile raf = new RandomAccessFile(file1,"r");
		RandomAccessFile raf2 = new RandomAccessFile(file2,"r");
		for(long i = 0; i < file1.length(); i+=4) {
			for(int j = 0; j < 4; j++) {
				bytes1[j] = raf.readByte();
				bytes2[j] = raf2.readByte();
			}
			if(!Arrays.equals(bytes1, bytes2)) {
				pr.print(".long 0x" + Long.toHexString(raf.getFilePointer()-4) + "\n");
				pr.print(".long 0x" +  String.format("%02x", bytes2[0]) + String.format("%02x", bytes2[1]) + String.format("%02x", bytes2[2]) + String.format("%02x", bytes2[3]) + "\n");
			}
			
		}
		pr.print(".long -1");
		pr.close();
		raf2.close();
		raf.close();
	}

}
