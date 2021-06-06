package com.example;

import java.sql.Timestamp;

public class BookVO {
	
	private int booknum;
	private String bookid;
	private String bookname;
	private String bookauthor;
	private String bookpublic;
	private String bookcontent;
	private Timestamp registDate;
	
	//신규 게시물에 new 마크를 붙일지 말지를 결정하는 논리필드 선언.
	private boolean newMark;
	
	public BookVO() {}
	
	public BookVO(int booknum,String bookid, String bookname, String bookauthor, String bookpublic,String bookcontent, Timestamp registDate) {
		super();
		this.booknum = booknum;
		this.bookid = bookid;
		this.bookname = bookname;
		this.bookauthor = bookauthor;
		this.bookpublic = bookpublic;
		this.bookcontent = bookcontent;
		this.registDate = registDate;
	}
	
	public boolean isNewMark() {
		return newMark;
	}
	
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	
	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}
	public String getBookpublic() {
		return bookpublic;
	}
	public void setBookpublic(String bookpublic) {
		this.bookpublic = bookpublic;
	}

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public Timestamp getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Timestamp registDate) {
		this.registDate = registDate;
	}

	public String getBookcontent() {
		return bookcontent;
	}

	public void setBookcontent(String bookcontent) {
		this.bookcontent = bookcontent;
	}

	@Override
	public String toString() {
		return "BookVO [booknum=" + booknum + ", bookid=" + bookid + ", bookname=" + bookname + ", bookauthor="
				+ bookauthor + ", bookpublic=" + bookpublic + ", bookcontent=" + bookcontent + ", registDate="
				+ registDate + ", newMark=" + newMark + "]";
	}
	
}
