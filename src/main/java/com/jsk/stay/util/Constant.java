package com.jsk.stay.util;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;

public class Constant {
	@Autowired
	private SqlSession sqlSession;
	
	public static JdbcTemplate template; 
	public static PlatformTransactionManager transactionManager;
	public static TransactionTemplate transactionTemplate;
	public static LoginDao dao;
	public static int visitN;
	public static int visitMN;
	
	public MemberDto login(String mb_id) {
		System.out.println("id = " + mb_id);
		return (MemberDto)sqlSession.selectOne("loginDao",mb_id);
	}
}
