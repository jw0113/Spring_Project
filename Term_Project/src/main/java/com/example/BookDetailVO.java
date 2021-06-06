package com.example;

import java.sql.Timestamp;

public class BookDetailVO {

	private String bookid;
	private String loanstate;
	private String returnstate;
	private Timestamp loanDate;
	private Timestamp returnDate;
	private String memberid;
	
	
	public BookDetailVO() {
		
	}
	
	public BookDetailVO(String bookid, String loanstate, String returnstate, Timestamp loanDate, Timestamp returnDate,String memberid) {
		super();
		this.bookid = bookid;
		this.loanstate = loanstate;
		this.returnstate = returnstate;
		this.loanDate = loanDate;
		this.returnDate = returnDate;
		this.memberid = memberid;
	}

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getLoanstate() {
		return loanstate;
	}

	public void setLoanstate(String loanstate) {
		this.loanstate = loanstate;
	}

	public String getReturnstate() {
		return returnstate;
	}

	public void setReturnstate(String returnstate) {
		this.returnstate = returnstate;
	}

	public Timestamp getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(Timestamp loanDate) {
		this.loanDate = loanDate;
	}

	public Timestamp getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "BookDetailVO [bookid=" + bookid + ", loanstate=" + loanstate + ", returnstate=" + returnstate
				+ ", loanDate=" + loanDate + ", returnDate=" + returnDate + ", memberid=" + memberid + "]";
	}

}
