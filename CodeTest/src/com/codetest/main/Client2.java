package com.codetest.main;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.lang.reflect.Array;
import java.net.Socket;
import java.util.Arrays;
import java.util.Scanner;

import com.codetest.main.Client.ServerListen;

public class Client2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {

			Socket socket = new Socket("localhost", 1500);
			InputStream is = socket.getInputStream();
			OutputStream os = socket.getOutputStream();
			BufferedOutputStream bfos = new BufferedOutputStream(os);
			
			Scanner scan = new Scanner(System.in);
			while(true) {
				String str = scan.nextLine();
				System.out.println("입력된 메세지 : " + str);
				if(str.contains("file")) {
					File file = new File("c:\\ideas.png");
					FileInputStream fis = new FileInputStream(file);
					byte[] buffer = new byte[1018];
					int length = 0;
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					while ((length = fis.read(buffer)) != -1) {
						byte[] s = "**file".getBytes();
						byte[] bind = new byte[length+(s.length)];
						System.arraycopy(s, 0, bind, 0, s.length);
						System.arraycopy(buffer, 0, bind, s.length, length);
						bos.write(bind, 0, bind.length);
					}
					byte[] last = "file**".getBytes();
					byte[] data = bos.toByteArray();
					byte[] lastBind = new byte[data.length+last.length];
					System.arraycopy(data, 0, lastBind, 0, data.length);
					System.arraycopy(last, 0, lastBind, data.length, last.length);
					System.out.println("lastBind size : " + lastBind.length);
					bfos.write(lastBind);
					
				}else {
					System.out.println(str.replace("file", "").getBytes("UTF-8").length);
					str = "**hi**" + str;
					bfos.write(str.getBytes("UTF-8"));
					
				}
				bfos.flush();
			}
			

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
