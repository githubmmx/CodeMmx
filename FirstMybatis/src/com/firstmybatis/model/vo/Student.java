package com.firstmybatis.model.vo;

import java.sql.Date;

public class Student {
	
	private int student_no;
	private String student_name;
	private String student_tel;
	private String student_email;
	private String student_addr;
	private String reg_date;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(int student_no, String student_name, String student_tel, String student_email, String student_addr,
			String reg_date) {
		super();
		this.student_no = student_no;
		this.student_name = student_name;
		this.student_tel = student_tel;
		this.student_email = student_email;
		this.student_addr = student_addr;
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Student [student_no=" + student_no + ", student_name=" + student_name + ", student_tel=" + student_tel
				+ ", student_email=" + student_email + ", student_addr=" + student_addr + ", reg_date=" + reg_date
				+ "]";
	}

	public int getStudent_no() {
		return student_no;
	}

	public void setStudent_no(int student_no) {
		this.student_no = student_no;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_tel() {
		return student_tel;
	}

	public void setStudent_tel(String student_tel) {
		this.student_tel = student_tel;
	}

	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

	public String getStudent_addr() {
		return student_addr;
	}

	public void setStudent_addr(String student_addr) {
		this.student_addr = student_addr;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
	/*
	 * private int no; private String name; private String tel; private String
	 * email; private String addr; private Date reg_date;
	 * 
	 * public Student() { // TODO Auto-generated constructor stub }
	 * 
	 * 
	 * 
	 * public Student(int no, String name, String tel, String email, String addr,
	 * Date reg_date) { super(); this.no = no; this.name = name; this.tel = tel;
	 * this.email = email; this.addr = addr; this.reg_date = reg_date; }
	 * 
	 * 
	 * 
	 * public int getNo() { return no; }
	 * 
	 * public void setNo(int no) { this.no = no; }
	 * 
	 * public String getName() { return name; }
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * public String getTel() { return tel; }
	 * 
	 * public void setTel(String tel) { this.tel = tel; }
	 * 
	 * public String getEmail() { return email; }
	 * 
	 * public void setEmail(String email) { this.email = email; }
	 * 
	 * public String getAddr() { return addr; }
	 * 
	 * public void setAddr(String addr) { this.addr = addr; }
	 * 
	 * public Date getReg_date() { return reg_date; }
	 * 
	 * public void setReg_date(Date reg_date) { this.reg_date = reg_date; }
	 * 
	 * @Override public String toString() { return "Student [no=" + no + ", name=" +
	 * name + ", tel=" + tel + ", email=" + email + ", addr=" + addr + ", reg_date="
	 * + reg_date + "]"; }
	 */
	
	
	
	
}
