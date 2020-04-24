package com.firstmybatis.model.vo;

import java.sql.Date;

public class Student {
	private int no;
	private String name;
	private String tel;
	private String email;
	private String addr;
	private Date reg_date;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Student(int no, String name, String tel, String email, String addr, Date reg_date) {
		super();
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.reg_date = reg_date;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Student [no=" + no + ", name=" + name + ", tel=" + tel + ", email=" + email + ", addr=" + addr
				+ ", reg_date=" + reg_date + "]";
	}

	
	
	
	
}
