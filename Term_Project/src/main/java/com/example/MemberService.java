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
	
	//member 정보 수정
	public int updateMember(MemberVO member) {
		return dao.updateMember(member);
	}
	
	//비밀번호 확인
	public String checkPw(MemberVO member) {
		return dao.checkPw(member);
	}
	
	//비밀번호 변경
	public int changePw(MemberVO member) {
		return dao.changePw(member);
	}
	
	//회원 정보 삭제
	public int memberDelete(String id) {
		return dao.memberDelete(id);
	}
}
