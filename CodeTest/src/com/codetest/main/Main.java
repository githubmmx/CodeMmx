package com.codetest.main;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.codetest.model.vo.AESEncrypt;
import com.codetest.model.vo.Board;
import com.codetest.model.vo.ClassReflection;



public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
	}
	
	
	public static void websocket() {
		try {
			ServerSocket server  = new ServerSocket(80);
			System.out.println("Server is start.. and client waiting..");
			Socket client = server.accept();
			System.out.println("client is connected..");
			InputStream in = client.getInputStream();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public static void regex() {
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
	
	public static void AESEncrypt() {
		AESEncrypt aes = new AESEncrypt("./");
		
		String encryptName = aes.encrypt("둘리");
		System.out.println(encryptName);
		String name = aes.decrypt(encryptName);
		System.out.println(name);
	}
	
	public static void classReflection() {
		Board board = new Board();
		ClassReflection.selectList(board);
		System.out.println(board.toString());
	}
	
	
	public static void chatServer() {
		try {
			ServerSocket server = new ServerSocket(1500);
			System.out.println("서버 접속대기중");
			Socket client = server.accept();
			System.out.println("클라이언트 접속완료");
			ClientThread ct = new ClientThread(client);
			new Thread(ct).start();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static class ClientThread implements Runnable{
		private Socket socket;
		private InputStream is;
		private OutputStream os;
		public ClientThread(Socket socket) {
			// TODO Auto-generated constructor stub
			this.socket = socket;
			try {
				is = socket.getInputStream();
				os = socket.getOutputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		@Override
		public void run() {
			// TODO Auto-generated method stub
			while(true) {
				int length = 0;
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				try {
					System.out.println("챗 서버에서 메세지 받기 대기중..");
					while((length = is.read(buffer)) != -1) {
						bos.write(buffer, 0, length);
					}
					byte[] data = bos.toByteArray();
					String str = new String(data);
					System.out.println(str);
					if(str.equals("exit")) {
						break;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}

}
