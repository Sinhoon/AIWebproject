package com.example.demo;

public class LikeDTO {
    int RST_NUM;
    String RST_PATH;
    String RST_DATA;
    int EMP_NUM;
    
	public LikeDTO(int rST_NUM, String rST_PATH, String rST_DATA, int eMP_NUM) {
		super();
		RST_NUM = rST_NUM;
		RST_PATH = rST_PATH;
		RST_DATA = rST_DATA;
		EMP_NUM = eMP_NUM;
	}
	
	
	public LikeDTO() {
		super();
	}

	public int getEMP_NUM() {
		return EMP_NUM;
	}
	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	public int getRST_NUM() {
		return RST_NUM;
	}
	public void setRST_NUM(int rST_NUM) {
		RST_NUM = rST_NUM;
	}
	public String getRST_PATH() {
		return RST_PATH;
	}
	public void setRST_PATH(String rST_PATH) {
		RST_PATH = rST_PATH;
	}
	public String getRST_DATA() {
		return RST_DATA;
	}
	public void setRST_DATA(String rST_DATA) {
		RST_DATA = rST_DATA;
	}


	

    
}
