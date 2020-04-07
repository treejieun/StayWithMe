package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.MemberDto;


@Repository
public class JoinDaoImp implements JoinDao {
	@Autowired
	private SqlSession sqlSession;

	public JoinDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String memberJoinMethod(MemberDto dto) throws Exception {
		sqlSession.insert("member.join", dto);
		String success = "success";
		return success;
	}
	
	@Override
	public int idCheck(String mb_id) throws Exception {
		String idCheck = (String)sqlSession.selectOne("member.idCheck", mb_id);
		System.out.println("dao result : " + idCheck);

		int result = 0;
		if(idCheck != null)
			result = 1;
		
		return result;
	}
	
	@Override
	public int phoneCheck(String mb_phone) throws Exception {
		String phoneCheck = (String)sqlSession.selectOne("member.phoneCheck", mb_phone);
		System.out.println("dao phone result : " + phoneCheck);
		
		int result = 0;
		if(phoneCheck != null)
			result = 1;
		
		return result;
	}
}
