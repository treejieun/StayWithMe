package com.jsk.stay.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMainDaoImp implements AdminMainDao {
	
	@Autowired
	private SqlSession sql;
	
	public int totalMember() {
		return sql.selectOne("admin.totalMember");
	}
	public int totalACM() {
		return sql.selectOne("admin.totalACM");
	}
	
	public int womanCount() {
		return sql.selectOne("admin.womanCount");
	}
	
	public int manCount() {
		return sql.selectOne("admin.manCount");
	}
	
	public int guestCount() {
		return sql.selectOne("admin.guestCount");
	}
	
	public int hostCount() {
		return sql.selectOne("admin.hostCount");
	}
	
	public List<Map<String, String>> month() {
		return sql.selectList("admin.month");
	}
	
	public List<Map<String, String>> local() {
		return sql.selectList("admin.local");
	}
}
