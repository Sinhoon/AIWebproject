package com.example.demo;

import java.net.Socket;

import com.example.demo.TrendRecomSender;
import com.example.demo.FileSender;
import com.google.gson.JsonObject;

public class Client {
	Socket socket = null;
	String serverIp = "127.0.0.1";
	int serverPort = 5000;
	String fileName;
	String id;
	String age;
	String sex;
	String mode;
	JsonObject result;


	public Client(String mode, String fileName  ,String id , String age , String sex) {
		this.fileName = fileName;
		this.age = age;
		this.sex = sex;
		this.id = id;
		this.mode = mode;

		try {
			socket = new Socket(serverIp, serverPort); // socket(),connect();
			System.out.println(serverIp + " : " + serverPort);

			if (mode=="0") {
				FileSender fileSender = new FileSender(socket,mode, fileName, id ,age ,sex);
				fileSender.start();
				fileSender.join();
				result = fileSender.getResult();
			}
			else {
				TrendRecomSender fileSender = new TrendRecomSender(socket, mode, fileName, id ,age ,sex);
				fileSender.start();
				fileSender.join();
				result = fileSender.getResult();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}// catch
		
		
		
		
	}
	
	
	
	/*
	public Client(JsonObject clothlist ,String mode, String id ,String age , String sex) {
		this.clothlist = clothlist;
		this.age = age;
		this.sex = sex;
		this.id = id;
		this.mode = mode;

		try {
			// �꽌踰� �뿰寃�
			socket = new Socket(serverIp, serverPort); // socket(),connect();
			System.out.println(serverIp + " : " + serverPort);

			FileSender fileSender = new FileSender(socket,mode, clothlist ,id ,age ,sex);
			fileSender.start();
			fileSender.join();
			
			
			result = fileSender.getResult();

		} catch (Exception e) {
			e.printStackTrace();
		}// catch
	}
	
	
	*/
	public JsonObject getResult() {
		return result;
	}

}
