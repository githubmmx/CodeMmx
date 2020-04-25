package com.codetest.main;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

import com.codetest.main.Client.ServerListen;

public class Client2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {

			Socket socket = new Socket("localhost", 1500);
			InputStream is = socket.getInputStream();
			OutputStream os = socket.getOutputStream();
			Scanner scan = new Scanner(System.in);
			String str = scan.nextLine();
			System.out.println("입력된 메세지 : " + str);
			os.write(str.getBytes());
			os.flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
