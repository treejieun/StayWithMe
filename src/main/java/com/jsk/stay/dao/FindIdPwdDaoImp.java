package com.jsk.stay.dao;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.jsk.stay.util.Constant;

public class FindIdPwdDaoImp implements FindIdPwdDao {
	
	@Autowired
	JdbcTemplate template;
	
	public FindIdPwdDaoImp() {
		super();
		this.template = Constant.template;

	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String findId_phoneCheck(String mb_name, String mb_phone) {
		System.out.println("FindIdPwdDaoImp");
		try {
			String query = "select mb_id from member where mb_name = ? and mb_phone = ?";
			String findId = template.queryForObject(query, new Object[] {mb_name, mb_phone}, String.class);
			System.out.println(findId);
			return findId;
		}
		catch(EmptyResultDataAccessException e) {
			return "notFoundId";
		}
		
	}
	
	@Override
	public String findPwd_idCheck(String mb_id) {
		System.out.println("FindIdPwdDaoImp");
		try {
			String query = "select mb_email from member where mb_id = ?";
			String result = template.queryForObject(query, new Object[] {mb_id}, String.class);
			System.out.println(result);
			return result;
		}
		catch(EmptyResultDataAccessException e) {
			return "notFoundId";
		}
	}
	
	@Override
	public void findPwd_newPwd(String newPwd2, String mb_id) {
		String query = "update member set mb_pwd = ? where mb_id = ?";
		template.update(query, newPwd2, mb_id);
	}
}
