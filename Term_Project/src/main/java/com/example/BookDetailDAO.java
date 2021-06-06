package com.example;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class BookDetailDAO {
	
	private JdbcTemplate jdbcTemplate;
	public BookDetailDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//해당 도서의 대출&반납 정보 보기
	public List<BookDetailVO> selectOneDetail(String bookid){
		
		List<BookDetailVO> result = jdbcTemplate.query("select * from `bookdetail` where bookid='"+bookid+"'",
				(ResultSet rs, int rowNum) -> {
					BookDetailVO bookd = new BookDetailVO();
					bookd.setBookid(rs.getString("bookid"));
					bookd.setLoanstate(rs.getString("loanstate"));
					bookd.setReturnstate(rs.getString("returnstate"));
					bookd.setLoanDate(rs.getTimestamp("loanDate"));
					bookd.setReturnDate(rs.getTimestamp("ReturnDate"));
					bookd.setMemberid(rs.getString("memberid"));
					return bookd;
				});
		return result;
	}
}
