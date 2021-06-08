package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//도서 목록 불러오기(관리자 화면)
	@GetMapping("manager/books")
	public String managerlist(Model model) {
		List<BookVO> list = service.getBookList();

		System.out.println("URL: bookInfo/booklist GET -> result: " + list.size());
		model.addAttribute("books", list);

		return "manager/books";
	}
	
	//해당 도서의 상세 정보 보기
	@GetMapping("/bookInfo/bookcontent")
	public String bokklist(Model model, @RequestParam(value="bookid", required=false) String bookid, @RequestParam(value="memberid", required=false) String memberid) {
		List<BookVO> list = service.getOneBookList(bookid);
		List<BookDetailVO> dlist = dservice.selectOneDetail(bookid);
		System.out.println("URL: bookInfo/bookcontent GET -> result: " + list);
		System.out.println("URL: bookInfo/bookcontent GET -> result: " + dlist);
		model.addAttribute("books",list);
		model.addAttribute("bookdetail", dlist);
		model.addAttribute("login", memberid);
		return "bookInfo/bookcontent";
	}
	
	//대여한 도서 목록 요청
	@GetMapping("/bookDetailInfo/bookdetaillist")
	public String bookDetailList(Model model, @RequestParam(value="id", required=false) String id) {
		//해당 책의 대출 반납 정보
		List<BookDetailVO> vo = dservice.selectmemberDetail(id);
		//도서정보
		List<BookVO> list = service.getBookList();
		System.out.println(vo);
		model.addAttribute("bookdetail",vo);
		model.addAttribute("books", list);
		return "bookDetailInfo/bookdetaillist";
	}
	
	//대여한 도서 반납 요청 처리
	@GetMapping("/bookDetailInfo/bookDetailReturn")
	public String bookDetailReturn(@RequestParam(value="id", required=false) String id, @RequestParam(value="bookid", required=false) String bookid,RedirectAttributes ra) {
		dservice.bookReturn(id,bookid);
		ra.addFlashAttribute("msg", "ReturnSuccess");
		
		return "redirect: /Term_Project/bookDetailInfo/bookdetaillist";
	}
	
	//도서 검색 요청 처리
	@GetMapping("/bookInfo/search")
	public String bookSearch(Model model, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="condition", required=false) String condition) {
		List<BookVO> list = service.search(keyword,condition);
		model.addAttribute("books", list);
		
		return "bookInfo/booklist";
	}
	
	//도서 검색 요청 처리 (관리자 화면)
	@GetMapping("/manager/booksearch")
	public String managerSearch(Model model, @RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="condition", required=false) String condition) {
		List<BookVO> list = service.search(keyword,condition);
		model.addAttribute("books", list);
		
		return "manager/booksearch";
	}
	
	//도서 추가 요청
	@GetMapping("/manager/bookwrite")
	public String bookwrite() {
		return "manager/bookwrite";
	}
	
	//도서 추가 요청 처리
	@PostMapping("/manager/bookwrite")
	public String bookwrite(BookVO vo, RedirectAttributes ra) {
		List<BookVO> list = service.getBookList();
		int booknum = (list.size())+1;
		int result = service.bookwrite(vo,booknum);
		if(result==1) ra.addFlashAttribute("msg", "InsertSuccess");
		return "redirect: /Term_Project/manager/books";
	}
	
	//도서 수정 요청
	@GetMapping("/manager/bookmodify")
	public String modify(Model model, @RequestParam(value="bookid", required=false) String bookid) {
		System.out.println("URL: /board/modify -> GET");
		List<BookVO> list = service.getOneBookList(bookid);
		System.out.println(list);
		model.addAttribute("books", list);
		return "manager/bookmodify";
	}
	
//	//도서 수정 요청 처리
//	@PostMapping("/manager/bookmodify")
//	public String modify(BookVO vo, RedirectAttributes ra) {
//		System.out.println("URL: /manager/bookmodify -> POST");
//		service.modify(vo);
//		System.out.println(vo);
//		
//		ra.addFlashAttribute("msg", "modSuccess");
//		
//		return "redirect: /Term_Project/manager/bookmodify";
//	}
	
	//해당 도서의 상세 정보 보기 (관리자 화면)
	@GetMapping("/manager/bookscontent")
	public String booklist(Model model, @RequestParam(value="bookid", required=false) String bookid) {
		List<BookVO> list = service.getOneBookList(bookid);
		List<BookDetailVO> dlist = dservice.selectOneDetail(bookid);
		System.out.println("URL: bookInfo/bookcontent GET -> result: " + list);
		System.out.println("URL: bookInfo/bookcontent GET -> result: " + dlist);
		model.addAttribute("books",list);
		model.addAttribute("bookdetail", dlist);
		return "manager/bookscontent";
	}
	
	//도서 삭제 처리
	@PostMapping("/manager/bookdelete")
	public String delete(String bookid, RedirectAttributes ra) {
		service.delete(bookid);
		System.out.println("delete 완료");
		return "redirect: /Term_Project/manager/books";
	}
	
}
