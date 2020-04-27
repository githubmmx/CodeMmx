package com.codetest.main;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.Charset;
import java.util.Arrays;

public class Server {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ServerSocket server = new ServerSocket(1500);
			System.out.println("서버 접속대기중");
			Socket client = server.accept();
			System.out.println("클라이언트 접속완료");
			InputStream is = client.getInputStream();
			BufferedInputStream bfis = new BufferedInputStream(is);
			OutputStream os = client.getOutputStream();
			while(true) {
				int length = 0;
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				
				boolean isFileFirst = true;
				boolean isDownEnd = false;
				StringBuilder str = new StringBuilder();
				File f = null;
				FileOutputStream fos = null;
				while ((length = bfis.read(buffer)) != -1) {
					System.out.println(length);
					byte[] data = new byte[length];
					data = Arrays.copyOf(buffer, length);
					String s = new String(data,"UTF-8");
					if(s.contains("**hi**")) {
						System.out.println("문자열");
						System.out.println(new String(data,"UTF-8"));
					}else {
						System.out.println("파일");
						
						if(isFileFirst) {
							f = new File("c:\\hihi\\ideas.png");
							fos = new FileOutputStream(f);
							
							isFileFirst = false;
						}else {
							
						}
						
						
						
						if(s.contains("file**")) {
							System.out.println(data.length);
							System.out.println("종료");
							byte[] piece = s.replace("**file", "").replace("file**", "").getBytes();
							fos.write(piece);
							
							fos.close();
							isFileFirst = true;
						}else {
							System.out.println("쓰는중");
							System.out.println(data.length);
							byte[] piece = s.replace("**file", "").replace("file**", "").getBytes();
							fos.write(piece);
						}
						
						
					}
//					
					
//					if() {
//						System.out.println("file");
//						File f = new File("c:\\hihi\\mylog.log");
//						FileOutputStream fos = new FileOutputStream(f);
//						
//						if(isFileFirst) {
//							fos.write(Arrays.copyOfRange(data, 12, data.length));
//						}else {
//							fos.write(data);
//						}
//						
//						isFileFirst = true;
//					}
				}
				
			}
			
		

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
