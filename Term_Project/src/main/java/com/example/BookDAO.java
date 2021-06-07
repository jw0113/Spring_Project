package com.example;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.*;

public class BookDAO {
	
	private JdbcTemplate jdbcTemplate;
	public BookDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	//도서의 목록 가져오기
	public List<BookVO> getBookList(){
		
		List<BookVO> result = jdbcTemplate.query("select * from `book` ORDER BY booknum DESC",
				(ResultSet rs, int rowNum) -> {
					BookVO book = new BookVO();
					book.setBooknum(rs.getInt("booknum"));
					book.setBookid(rs.getString("bookid"));
					book.setBookname(rs.getString("bookname"));
					book.setBookauthor(rs.getString("bookauthor"));
					book.setBookpublic(rs.getString("bookpublic"));
					book.setRegistDate(rs.getTimestamp("registDate"));
					return book;
				});
		return result;
	}
	
	//하나의 도서의 정보 가져오기
	public List<BookVO> getOneBookList(String bookid){
		
		List<BookVO> result = jdbcTemplate.query("select * from `book` where bookid='"+bookid+"'",
				(ResultSet rs, int rowNum) -> {
					BookVO book = new BookVO();
					book.setBooknum(rs.getInt("booknum"));
					book.setBookid(rs.getString("bookid"));
					book.setBookname(rs.getString("bookname"));
					book.setBookauthor(rs.getString("bookauthor"));
					book.setBookpublic(rs.getString("bookpublic"));
					book.setBookcontent(rs.getString("bookcontent"));
					book.setRegistDate(rs.getTimestamp("registDate"));
					return book;
				});
		return result;
	}
}
