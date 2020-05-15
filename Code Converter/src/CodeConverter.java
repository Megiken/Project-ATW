import java.util.Scanner;
import java.io.OutputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.File;

public class CodeConverter
{
    public static void main(String[] args) throws Exception {
    	String path = "";
    	String path2 = "C:/Users/Thomas/Desktop/Project ATW/ATW.dat";
    	boolean debug = false;
    	if(args[0].equals("-c")) {
    		path = args[1];
    	}
    	if(args[2].equals("-o")) {
    		path2 = args[3];
    	}
    	if(args.length>4) {
    		if(args[4].equals("-d")) {
    			debug = true;
    		}
    	}
    	String temp = "";
        String code = "";
        int output = 0;
        File file = new File(path);
        DataOutputStream out = new DataOutputStream(new FileOutputStream(path2));
        Scanner sc = new Scanner(file);
        
        if(debug) {
        	temp = "";
            code = "";
            output = 0;
            int bytes = 0;
            while (sc.hasNext()) {
                temp = sc.nextLine();
                if (temp.length() > 2) {
                    code = temp.substring(0, 2);
                }
                if (code.equals("06")) {
                    code = temp.substring(9, 17);
                    output = (bytes = Integer.parseInt(code, 16));
                    output /= 4;
                    for (int i = 0; i < output; i += 2) {
                        temp = sc.nextLine();
                        code = temp.substring(0, 8);
                        writeTo(out, code);
                        if(code.equals("00000009")) {
                        	break;
                        }
                        code = temp.substring(9, 17);
                        if(i < output) {
                        writeTo(out, code);
                        }
                    }
                }
        	
            }
        	sc.close();
            out.close();
        }else {
        
        
        code = Integer.toHexString(getlength(sc, "04"));
        code = ("00000000" + code).substring(code.length());
        writeTo(out, code);
        sc = new Scanner(file);
        write04data(out, sc);
        sc = new Scanner(file);
        writeC2length(out, sc);
        sc = new Scanner(file);
        writeC2data(out, sc);
        sc = new Scanner(file);
        write06length(out, sc);
        sc = new Scanner(file);
        write06data(out, sc);
        sc.close();
        out.close();
        }

    }
    
    public static int getlength( Scanner sc,  String value) {
        String temp = "";
        String code = "";
        int num = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("C2")) {
            	String thing = temp.substring(9, 17);
            	int other = Integer.parseInt(thing, 16);
            	for(int i = 0; i < other; i++) {
                    temp = sc.nextLine();
            	}
            }
            else if (code.equals(value)) {
                num += 12;
            }
        }
        return num;
    }
    
    public static void writeTo( DataOutputStream out,  String code) throws Exception {
        int output = 0;
        for (int i = 0; i < 8; i += 2) {
            output = Integer.parseInt(code.substring(i, i + 2), 16);
            out.write(output);
        }
    }
    
    public static void write04data( DataOutputStream out,  Scanner sc) throws Exception {
        String temp = "";
        String code = "";
        int output = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("04")) {
                code = "80";
                code = String.valueOf(code) + temp.substring(2, 8);
                writeTo(out, code);
                code = "00000000";
                writeTo(out, code);
                code = temp.substring(9, 17);
                writeTo(out, code);
            }
            if (code.equals("C2")) {
            	String thing = temp.substring(9, 17);
            	int other = Integer.parseInt(thing, 16);
            	for(int i = 0; i < other; i++) {
                    temp = sc.nextLine();
            	}
            }
            }
        }
    
    public static void writeC2data( DataOutputStream out,  Scanner sc) throws Exception {
        String temp = "";
        String code = "";
        int output = 0;
        int bytes = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("C2")) {
                code = "80";
                code = String.valueOf(code) + temp.substring(2, 8);
                writeTo(out, code);
                code = "00000000";
                writeTo(out, code);
                code = temp.substring(9, 17);
                output = Integer.parseInt(code, 16);
                bytes = output * 8;
                code = Integer.toHexString(bytes);
                code = ("00000000" + code).substring(code.length());
                writeTo(out, code);
                for (int i = 0; i < output; ++i) {
                    temp = sc.nextLine();
                    code = temp.substring(0, 8);
                    writeTo(out, code);
                    code = temp.substring(9, 17);
                    writeTo(out, code);
                }
            }
        }
    }
    
    public static void writeC2length( DataOutputStream out,  Scanner sc) throws Exception {
        String temp = "";
        String code = "";
        int output = 0;
        int bytes = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("C2")) {
                code = temp.substring(9, 17);
                output = Integer.parseInt(code, 16);
                bytes += output * 8;
                bytes += 12;
                for (int i = 0; i < output; ++i) {
                    sc.nextLine();
                }
            }
        }
        code = Integer.toHexString(bytes);
        code = ("00000000" + code).substring(code.length());
        writeTo(out, code);
    }
    
    public static void write06length( DataOutputStream out,  Scanner sc) throws Exception {
        String temp = "";
        String code = "";
        int output = 0;
        int bytes = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("C2")) {
            	String thing = temp.substring(9, 17);
            	int other = Integer.parseInt(thing, 16);
            	for(int i = 0; i < other; i++) {
                    temp = sc.nextLine();
            	}
            }
            else if (code.equals("06")) {
                code = temp.substring(9, 17);
                output = Integer.parseInt(code, 16);
                bytes += output * 2;
                if (output % 8 != 0) {
                    bytes += 4;
                }
                output /= 4;
                bytes += 8;
                for (int i = 0; i < output; i += 2) {
                    sc.nextLine();
                }
            }
        }
        code = Integer.toHexString(bytes);
        code = ("00000000" + code).substring(code.length());
        writeTo(out, code);
    }
    
    public static void write06data( DataOutputStream out,  Scanner sc) throws Exception {
        String temp = "";
        String code = "";
        int output = 0;
        int bytes = 0;
        while (sc.hasNext()) {
            temp = sc.nextLine();
            if (temp.length() > 2) {
                code = temp.substring(0, 2);
            }
            if (code.equals("06")) {
                code = "80";
                code = String.valueOf(code) + temp.substring(2, 8);
                writeTo(out, code);
                code = temp.substring(9, 17);
                output = (bytes = Integer.parseInt(code, 16));
                output /= 4;
                code = Integer.toHexString(bytes);
                code = ("00000000" + code).substring(code.length());
                writeTo(out, code);
                writezeros(out, bytes);
                for (int i = 0; i < output; i += 2) {
                    temp = sc.nextLine();
                    code = temp.substring(0, 8);
                    writeTo(out, code);
                    code = temp.substring(9, 17);
                    writeTo(out, code);
                }
            }
            if (code.equals("C2")) {
            	String thing = temp.substring(9, 17);
            	int other = Integer.parseInt(thing, 16);
            	for(int i = 0; i < other; i++) {
                    temp = sc.nextLine();
            	}
            }
        }
    }
    
    public static void writezeros( DataOutputStream out,  int num) throws Exception {
        for (int i = 0; i < num; ++i) {
            out.write(0);
        }
    }
}