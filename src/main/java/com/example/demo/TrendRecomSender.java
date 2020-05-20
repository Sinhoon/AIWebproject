package com.example.demo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class TrendRecomSender extends Thread {
	private Socket socket;
	private FileInputStream fis;
	private BufferedOutputStream bos;

	private String filename;
	private String age;
	private String sex;
	private String clothlist;

	private OutputStream os;
	private InputStream is;
	private BufferedInputStream bis;

	private int fileSize;
	private String mode;
	private JsonObject result;
	
	public TrendRecomSender(Socket socket, String mode , String fileName, String clothlist, String age, String sex) {
		this.socket = socket;
		this.filename = fileName;
		this.clothlist = clothlist;
		this.age = age;
		this.sex = sex;
		this.mode = mode;
		try {
			// �뜲�씠�꽣 �뒪�듃?���? �깮�꽦
			this.os = socket.getOutputStream();
			bos = new BufferedOutputStream(os);
			this.is = socket.getInputStream();
			bis = new BufferedInputStream(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public JsonObject getResult() {
		return result;
	}
	
	public void close() {
		try {
		bos.close();
		socket.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public boolean sendFileName(JsonObject fileName) throws IOException {
		bos.write(fileName.toString().getBytes());
		bos.flush();
		//System.out.println("send file size : " + fileSize);
		return true;
	}
	
	public String receiveData(int buffer_size) throws IOException {
		byte[] tmp = new byte[buffer_size];
		int zz = bis.read(tmp);
		//System.out.println("server : "+new String(tmp, 0, zz));
		return new String(tmp, 0, zz);
	}
	
	@Override
	public void run() {
		JsonObject jo = new JsonObject();
		try {
			jo.addProperty("mode",  mode );
	        jo.addProperty("filename",  filename );
	        jo.addProperty("clothlist",  clothlist );
	        jo.addProperty("age",  age );
	        jo.addProperty("sex",  sex );
			sendFileName(jo);
			
			String res = receiveData(1024);
			JsonObject outJo = (JsonObject) new Gson().fromJson(res,JsonObject.class);
			result = outJo;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}// finally
	}// run

}
