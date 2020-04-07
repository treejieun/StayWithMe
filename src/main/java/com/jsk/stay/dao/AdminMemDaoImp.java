package com.jsk.stay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.MemberDto;

@Repository
public class AdminMemDaoImp implements AdminMemDao {
	@Autowired
	private SqlSession sql;
	
	public List<MemberDto> memberList(Criteria cri) {
		return sql.selectList("member.memberList", cri);
	}
	
	public int listCount() {
		return sql.selectOne("member.listCount");
	}
}
