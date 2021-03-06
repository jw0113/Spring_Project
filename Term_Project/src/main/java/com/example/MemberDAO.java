package com.example;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Repository;

//db를 조작하는 곳
public class MemberDAO {

	private JdbcTemplate jdbcTemplate;
	public MemberDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//로그인 check
	public String logincheck(String id, String pw) {
		//아이디가 존재하지 않을 경우
		if(!idCheck(id)) {
			return "idFail";
		}
		else {
			String dbpw = this.jdbcTemplate.queryForObject("select pw from `member` where id='"+id+"'", String.class);
			//pw가 같을 경우
			if(dbpw.equals(pw)) return "success";
			
			//pw가 다를 경우
			return "pwFail";
		}
	}
	
	//id가 존재하는지 확인
	public boolean idCheck(String id) {
		try {
			String re = jdbcTemplate.queryForObject("select pw from `member` where id='"+id+"'", String.class);
			return true;
		}catch(EmptyResultDataAccessException e){
			return false;
		}
	}
	
	//member정보 저장
	public void insertMember(MemberVO vo) {
		int re = jdbcTemplate.update("insert into `member` (id,pw,name,address,email,phone,registrationdate) values (?,?,?,?,?,?,(now()))", vo.getId(),vo.getPw(),vo.getName(),vo.getAddress(),vo.getEmail(),vo.getPhone());
		System.out.println("db 넣기 성공 " + re);
		
	}
	
	//해당 id의 모든 정보 가져오기
	public List<MemberVO> selectOne(String id) {
			//String re = jdbcTemplate.queryForObject("select * from `member` where id='"+id+"'", String.class);

		List<MemberVO> result = jdbcTemplate.query("select * from `member` where id='"+id+"'",
				(ResultSet rs, int rowNum) -> {
					MemberVO member = new MemberVO();
					member.setId(rs.getString("id"));
					member.setPw(rs.getString("pw"));
					member.setName(rs.getString("name"));
					member.setAddress(rs.getString("address"));
					member.setEmail(rs.getString("email"));
					member.setPhone(rs.getString("phone"));
					member.setRegistrationdate(rs.getString("registrationdate"));
					return member;
				});
		return result;
	}
	
	//member정보 수정
	public int updateMember(MemberVO vo) {
		int re = jdbcTemplate.update("update `member` set name=?, address=?, email=?, phone=? where id=?",vo.getName(),vo.getAddress(),vo.getEmail(),vo.getPhone(),vo.getId());
		System.out.println("db 수정 성공 " + re);
		return re;
	}
	
	//현재 비밀번호 확인
	public String checkPw(MemberVO vo) {
		try {
			String re = jdbcTemplate.queryForObject("select pw from `member` where id='"+vo.getId()+"'", String.class);
			return re;
		}catch(EmptyResultDataAccessException e){
			return "null";
		}
	}
	
	//비밀번호 변경
	public int changePw(MemberVO vo) {
		int re = jdbcTemplate.update("update `member` set pw=? where id=?",vo.getPw(),vo.getId());
		System.out.println("db 수정 성공 " + re);
		return re;
	}
	
	//회원 정보 삭제
	public int memberDelete(String id) {
		System.out.println("DAO 확인 : " + id);
		int re = jdbcTemplate.update("delete from `member` where id='"+id+"'");
		System.out.println("db 삭제 성공 " + re);
		return re;
	}
}
