package com.codetest.main;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class Client {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			
			Socket socket = new Socket("localhost", 1500);
			System.out.println("챗 서버 접속.");
			InputStream is = socket.getInputStream();
			OutputStream os = socket.getOutputStream();
			new Thread(new ServerListen(is)).start();
			Scanner scan = new Scanner(System.in);
			while(true) {
				String str = scan.nextLine();
				System.out.println("입력된 메세지 : " + str);
				os.write(str.getBytes());
				os.flush();
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	static class ServerListen implements Runnable{
		private InputStream is;
		public ServerListen(InputStream is) {
			this.is = is;
		}
		@Override
		public void run() {
			// TODO Auto-generated method stub
			while(true) {
				
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				int length = 0;
				byte[] buffer = new byte[1024];
				try {
					System.out.println("클라이언트에서 메세지 받기 대기중..");
					while((length = is.read(buffer)) != -1) {
						bos.write(buffer, 0, length);
					}
					
					byte[] data = bos.toByteArray();
					String str = new String(data);
					System.out.println(str);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
	}

}
