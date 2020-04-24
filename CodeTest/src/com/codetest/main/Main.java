package com.codetest.main;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;



public class Main {

	public static void main(String[] args) {
		chatServer();
	
	
	
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
