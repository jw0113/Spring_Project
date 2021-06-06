package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {

	@Autowired
	private BookDAO dao;
	
	//전체 도서 리스트 가져오기
	public List<BookVO> getBookList() {

		List<BookVO> list = dao.getBookList();

		//1일 이내 신규글 new 마크 처리 로직
		for(BookVO book : list) {
			//현재 시간 읽어오기.
			long now = System.currentTimeMillis(); //현재 시간을 밀리초로 리턴하는 메서드
			//각 게시물들의 작성 시간을 밀리초로 읽어오기.
			long regTime = book.getRegistDate().getTime();

			if(now - regTime < 60 * 60 * 24 * 1000) {
				book.setNewMark(true);
			}
		}
		return list;
	}
	
	//하나의 도서 내용 가져오기
	public List<BookVO> getOneBookList(String bookid){
		return dao.getOneBookList(bookid);
	}
}
