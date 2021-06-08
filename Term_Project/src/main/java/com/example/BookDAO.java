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
	
	//도서 검색 요청 처리
	public List<BookVO> search(String keyword, String condition){
		List<BookVO> result = jdbcTemplate.query("select * from `book` where "+condition+"='"+keyword+"'",
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
	
	//도서 추가 요청 처리
	public int bookwrite(BookVO vo, int booknum) {
		int re = jdbcTemplate.update("insert into `book` (booknum,bookid,bookname,bookauthor,bookpublic,bookcontent,registDate) values (?,?,?,?,?,?,(now()))", booknum,vo.getBookid(),vo.getBookname(),vo.getBookauthor(),vo.getBookpublic(),vo.getBookcontent());
		System.out.println("db 넣기 성공 " + re);
		return re;
	}
	
	//도서 수정 요청 저리
	public int modify(BookVO vo) {
		int re = jdbcTemplate.update("update `book` set bookname=?, bookauthor=?, bookpublic=?, bookcontent=? where bookid=?",vo.getBookname(), vo.getBookauthor(), vo.getBookpublic(),vo.getBookcontent(),vo.getBookid());
		return re;
	}
	
	//도서 삭제 요청 처리
	public void delete(String bookid) {
		jdbcTemplate.update("delete from `book` where bookid='" + bookid + "'");
	}
}
