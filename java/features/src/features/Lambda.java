package features;

import java.util.Arrays;

public class Lambda {

	public static void main(String[] args) {
		String[] strArray = {"111", "1", "11111"};
		Arrays.sort(strArray, (s1, s2) -> s1.length() -  s2.length());
		
		for	(String s : strArray) System.out.println(s);		
	}
	
}
