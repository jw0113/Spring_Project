package com.example;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	private MemberService service;
	
	//main 첫화면
	@GetMapping("/")
	public String main1() {
		return "main";
	}
	
	@PostMapping("/logincheck")
	public String login_check(@RequestBody MemberVO vo) {
		String result = service.logincheck(vo.getId(),vo.getPw());
		
		return result;
	}
	
	//아이디 중복 확인 요청 처리
	//@RequestBody : HTTP 요청 몸체를 자바 객체로 변환
	@PostMapping("/checkId")
	public String checkId(@RequestBody String id) {

		if(service.checkId(id)) {
			System.out.println("아이디가 중복됨!");
			return "NO";
		} else {
			System.out.println("아이디 사용 가능!");
			return "OK";
		}	

	}
	
	//회원가입 요청
	@GetMapping("/regist")
	public String resgist() {
		return "regist";
	}
	
	//회원가입 요청 처리
	@PostMapping("/regist")
	public String regist(@RequestBody MemberVO member) {
		service.insertMember(member);
		return "joinSuccess";
	}
}
