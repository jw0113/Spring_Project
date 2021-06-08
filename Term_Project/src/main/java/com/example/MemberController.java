package com.example;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//@RestController :  Json 형태로 객체 데이터를 반환
@RestController
public class MemberController {

	@Autowired
	private MemberService service;
	
	@PostMapping("/logincheck")
	public String login_check(@RequestBody MemberVO vo, HttpSession session) {
		String result = service.logincheck(vo.getId(),vo.getPw());
		if(result.equals("success")) {
			session.setAttribute("login", vo.getId());
			if(vo.getId().equals("manage")) result = "manager";
		}
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
	
	//회원가입 요청 처리
	@PostMapping("/regist")
	public String regist(@RequestBody MemberVO member) {
		service.insertMember(member);
		return "joinSuccess";
	}
	
	//회원정보 수정 요청 처리
	@PostMapping("/memberInfo/memberupdate")
	public String memberupdate(@RequestBody MemberVO member) {
		System.out.println("update : " + member);
		int re = service.updateMember(member);
		if(re==0) {
			return "updateFail";
		}
		return "updateSuccess";
	}
	
	//현재 비밀번호 확인
	@PostMapping("/checkPw")
	public String checkPw(@RequestBody MemberVO member) {
		System.out.println("checkPw : " + member);
		String pw = service.checkPw(member);
		if(member.getPw().equals(pw)) {
			System.out.println("비밀번호가 일치함");
			return "OK";
		} else {
			System.out.println("비밀번호 불일치");
			return "NO";
		}	
	}
	
	//비밀번호 변경 요청 처리
	@PostMapping("/changePw")
	public String changePw(@RequestBody MemberVO member) {
		System.out.println("changePw : " + member);
		int re = service.changePw(member);
		if(re==0) {
			return "updateFail";
		}
		return "updateSuccess";
	}
	
	//회원 정보 삭제하기
	@PostMapping("/memberdelete")
	public String memberDelete(@RequestBody String id, HttpSession session) {
		int re = service.memberDelete(id);
		if(re == 0) {
			return "deleteFail";
		}
		session.invalidate();
		return "deleteSuccess";
	}
}
