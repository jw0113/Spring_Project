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

}
