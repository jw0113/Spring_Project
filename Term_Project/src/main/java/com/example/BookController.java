package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private BookDetailService dservice;

	//도서 목록 불러오기
	@GetMapping("bookInfo/booklist")
	public String list(Model model) {
		List<BookVO> list = service.getBookList();
		
		System.out.println("URL: bookInfo/booklist GET -> result: " + list.size());
		model.addAttribute("books", list);
		
		return "bookInfo/booklist";
	}
	
	//해당 도서의 상세 정보 보기
	@GetMapping("/bookInfo/bookcontent")
	public String memberlist(Model model, @RequestParam(value="bookid", required=false) String bookid) {
		List<BookVO> list = service.getOneBookList(bookid);
		System.out.println("URL: bookInfo/bookcontent GET -> result: " + list);
		model.addAttribute("books",list);
		return "bookInfo/bookcontent";
	}
	
}
