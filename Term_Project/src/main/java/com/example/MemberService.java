package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//서비스 조작하는 곳
@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	//로그인 확인
	public String logincheck(String id, String pw) {
		return dao.logincheck(id,pw);	
	}
	
	//아이디 중복 확인
	public boolean checkId(String id) {
		return dao.idCheck(id);
	}
	
	//member정보 저장
	public void insertMember(MemberVO member) {
		dao.insertMember(member);
	}
	
	//해당 아이디의 모든 정보 가져오기
	public List<MemberVO> selectOne(String id) {
		return dao.selectOne(id);
	}
}
