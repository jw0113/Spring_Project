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
	
	//도서 검색 처리
	public List<BookVO> search(String keyword, String condition){
		return dao.search(keyword,condition);
	}
	
	//도서 추가 처리
	public int bookwrite(BookVO vo, int booknum) {
		return dao.bookwrite(vo,booknum);
	}
	
	//도서 정보 수정
	public int modify(BookVO vo) {
		return dao.modify(vo);
	}
	
	//도서 삭제 처리
	public void delete(String bookid) {
		dao.delete(bookid);
	}
}
