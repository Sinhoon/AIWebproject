package com.example.demo;

public class UserDTO {
    int EMP_NUM;
    String EMP_ID;
    String EMP_PWD;
    int EMP_AGE;
    String EMP_SEX;
    
	public UserDTO(int eMP_NUM, String eMP_ID, String eMP_PWD, int eMP_AGE, String eMP_SEX) {
		super();
		EMP_NUM = eMP_NUM;
		EMP_ID = eMP_ID;
		EMP_PWD = eMP_PWD;
		EMP_AGE = eMP_AGE;
		EMP_SEX = eMP_SEX;
	}
	
	
	public UserDTO() {
		super();
	}


	public int getEMP_NUM() {
		return EMP_NUM;
	}
	public void setEMP_NUM(int eMP_NUM) {
		EMP_NUM = eMP_NUM;
	}
	public String getEMP_ID() {
		return EMP_ID;
	}
	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}
	public String getEMP_PWD() {
		return EMP_PWD;
	}
	
	public void setEMP_PWD(String eMP_PWD) {
		EMP_PWD = eMP_PWD;
	}
	public int getEMP_AGE() {
		return EMP_AGE;
	}
	public void setEMP_AGE(int eMP_AGE) {
		EMP_AGE = eMP_AGE;
	}
	public String getEMP_SEX() {
		return EMP_SEX;
	}
	public void setEMP_SEX(String eMP_SEX) {
		EMP_SEX = eMP_SEX;
	}
    
}
