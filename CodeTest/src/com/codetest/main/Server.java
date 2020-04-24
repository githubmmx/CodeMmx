package com.codetest.main;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import com.codetest.main.Main.ClientThread;

public class Server {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ServerSocket server = new ServerSocket(1500);
			System.out.println("서버 접속대기중");
			Socket client = server.accept();
			System.out.println("클라이언트 접속완료");
			InputStream is = client.getInputStream();
			OutputStream os = client.getOutputStream();

			int length = 0;
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];

			while ((length = is.read(buffer)) != -1) {
				bos.write(buffer, 0, length);
			}
			byte[] data = bos.toByteArray();
			String str = new String(data);
			System.out.println("클라이언트에게 온 메세지 : " + str);
		

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
