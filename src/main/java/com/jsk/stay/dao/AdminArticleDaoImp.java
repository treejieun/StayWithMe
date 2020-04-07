package com.jsk.stay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.Criteria;

@Repository
public class AdminArticleDaoImp implements AdminArticleDao {

	@Autowired
	private SqlSession sql;
	
	public List<AccommodationDto> acmArticle(Criteria cri) {
		return sql.selectList("admin.acmArticle", cri);
	}
	public int acmCount() {
		return sql.selectOne("admin.acmCount");
	}
}
