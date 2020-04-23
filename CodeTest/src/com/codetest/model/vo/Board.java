package com.codetest.model.vo;

import java.sql.Date;

public class Board {
	private int no;
	private String title;
	private String writer;
	private String content;
	private String originalFileName;
	private String renamedFileName;
	private Date date;
	private int readCount;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int no, String title, String writer, String content, String originalFileName, String renamedFileName,
			Date date, int readCount) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.date = date;
		this.readCount = readCount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", originalFileName=" + originalFileName + ", renamedFileName=" + renamedFileName + ", date=" + date
				+ ", readCount=" + readCount + "]";
	}
	
	
	
	
	
}
