package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MainController {
	
	@Autowired
	private MemberService service;

	//main 첫화면(로그인 전)
	@GetMapping("/")
	public String main1() {
		return "main";
	}
	
	//관리자 화면
	@GetMapping("/manager")
	public String main2() {
		return "main2";
	}
	
	//회원가입 요청
	@GetMapping("/regist")
	public String resgist() {
		return "regist";
	}
	
	//회원정보요청
	@GetMapping("/memberInfo/memberlist")
	public String memberlist(Model model, @RequestParam(value="id", required=false) String id) {
		List<MemberVO> vo = service.selectOne(id);
		System.out.println(vo);
		model.addAttribute("member",vo);	
		return "memberInfo/memberlist";
	}
	
	//회원정보수정 요청
	@GetMapping("/memberInfo/memberupdate")
	public String memberupdate(Model model, @RequestParam(value="id", required=false) String id) {
		List<MemberVO> vo = service.selectOne(id);
		System.out.println(vo);
		model.addAttribute("member",vo);	
		return "memberInfo/memberupdate";
	}
}
