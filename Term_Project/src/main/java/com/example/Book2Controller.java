package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//@RestController :  Json 형태로 객체 데이터를 반환
@RestController
public class Book2Controller {

	@Autowired
	private BookDetailService dservice;
	
	@Autowired
	private BookService service;
	
	//도서 대출 요청 처리
	@PostMapping("/bookDetail/bookloan")
	public String bookLoan(@RequestBody BookDetailVO vo) {
		System.out.println("vo확인 : " + vo);
		int re = dservice.insertLoan(vo);
		if(re == 0) return "Fail";
		return "Success";
	}
	
	//도서 수정 요청 처리
	@PostMapping("/manager/bookmodify")
	public String modify(@RequestBody BookVO vo) {
		System.out.println("URL: /manager/bookmodify -> POST");
		int re = service.modify(vo);
		System.out.println(vo);
		if(re != 0 ) return "updateSuccess";
		else
			return "fail";
	}
}
