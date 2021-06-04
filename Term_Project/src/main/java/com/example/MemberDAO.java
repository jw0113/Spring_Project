package com.example;


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
		int re = jdbcTemplate.update("insert into `member` (id,pw,name,address,email,phone) values (?,?,?,?,?,(now()))", vo.getId(),vo.getPw(),vo.getName(),vo.getAddress(),vo.getEmail(),vo.getAddress());
		System.out.println("db 넣기 성공 " + re);
		
	}
	
	//해당 id의 모든 정보 가져오기
//	public MemberVO selectOne(String id) {
//		
//		try {
//			String re = jdbcTemplate.queryForObject("select * from `member` where id='"+id+"'", String.class);
//			return true;
//		}catch(EmptyResultDataAccessException e){
//			return false;
//		}
//	}
}
