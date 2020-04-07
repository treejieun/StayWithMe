package com.jsk.stay.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionTemplate;

import com.jsk.stay.dto.HostDto;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.Constant;

public class LoginDao implements IDao {
	
	JdbcTemplate template;
	PlatformTransactionManager transactionManager;
	TransactionTemplate transactionTemplate;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Autowired
	private SqlSession sqlSession; //MYBatis를 사용하기 위해 변수를 만들어줌
	
	@Autowired
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	
	@Autowired
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
	
	public LoginDao() {
		Constant.template = this.template;
		Constant.transactionManager = this.transactionManager;
		Constant.transactionTemplate = this.transactionTemplate;
	}

	@Override
	public MemberDto login(String mb_id) {
		System.out.println("id = " + mb_id);
		MemberDto memberDto = (MemberDto)sqlSession.selectOne("loginDao",mb_id);
		return memberDto;
	}
	@Override
	public String check(String mb_id) {
		System.out.println("id = " + mb_id);
		String pw = sqlSession.selectOne("checkPW",mb_id);
		System.out.println("pw : " + pw);
		return pw;
	}
	
	@Override
	public MemberDto information(String mb_id) {
		MemberDto dto = sqlSession.selectOne("information",mb_id);
		return dto;
	}
	@Override
	public HostDto information1(String mb_id) {
		HostDto dto = sqlSession.selectOne("information1",mb_id);
		return dto;
	}
	

}
