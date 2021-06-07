package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookDetailService {
	
	@Autowired
	private BookDetailDAO dao;
	
	//해당 도서 대출&반납 정보 보기
	public List<BookDetailVO> selectOneDetail(String bookid){
		return dao.selectOneDetail(bookid);
	}
	
	//대출 정보 추가하기
	public int insertLoan(BookDetailVO vo) {
		return dao.insertLoan(vo);
	}
	
	//해당 회원의 대출 정보 보기
	public List<BookDetailVO> selectmemberDetail(String id){
		return dao.selectmemberDetail(id);
	}
	
	//반납 처리하기
	public int bookReturn(String id, String bookid) {
		return dao.bookReturn(id,bookid);
	}

}
