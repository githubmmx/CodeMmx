package com.codetest.main;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Board board = new Board();
//		ClassReflection.selectList(board);
//		System.out.println(board.toString());
		
//		File file = new File("./");
//		System.out.println(file.getAbsolutePath());
//		
//		
//		
//		AESEncrypt aes = new AESEncrypt("./");
//		
//		String encryptName = aes.encrypt("둘리");
//		System.out.println(encryptName);
//		String name = aes.decrypt(encryptName);
//		System.out.println(name);
//		String newStr = str.replaceAll("(?==[^?])=", "바꿀 문자열");
		
	
	Pattern pattern = Pattern.compile("(?==[^?])=");
	String str = "SELECT * FROM (SELECT * FROM (SELECT A.*, ROWNUM AS R FROM (SELECT * FROM TRIP_TB WHERE CATEGORY=? AND TRAVLE_LOCALE=? AND TAG LIKE ?)A) WHERE R BETWEEN ? AND ?)B JOIN (SELECT TRIP_NO, COUNT(*)AS COUNT FROM (SELECT * FROM TRIP_TB  JOIN LIKE_TB ON TRIP_TB.NO=LIKE_TB.TRIP_NO) GROUP BY TRIP_NO)C ON B.NO=C.TRIP_NO ORDER BY WRITE_DATE DESC";
	String replceStr = str.replaceAll("(?==[^?])=", "바꿀 문자열");
	Matcher matcher = pattern.matcher(str);
	int count = 0;
	while (matcher.find()) {
		count++;
	}
	matcher.reset();
	int[] indexs = new int[count];
	int i = 0;
	while (matcher.find()) {
		indexs[i] =  matcher.start();
		System.out.println(indexs[i]);
		i++;
	}
	System.out.println("indexs.length : " + indexs.length);
	int targetIndex = indexs[0];
	String newStr = str.substring(0, targetIndex) + "바꿀 문자열" + str.substring(targetIndex+1, str.length());
	System.out.println(newStr);
	
	
	
	}

}
