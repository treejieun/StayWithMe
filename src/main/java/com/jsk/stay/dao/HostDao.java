package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.HostDto;

@Repository
public class HostDao implements IHostDao {
	
	@Autowired
	private SqlSession sqlSession;
	/*
	@Override
	public void writeDao(String mb_id, String ho_address, String ho_add_detail, int ho_zip, String ho_account,
			String ho_acc_num) {
		HostDto dto = new HostDto(mb_id, ho_address, ho_add_detail,ho_zip, ho_account,ho_acc_num);
		sqlSession.insert("writeDao",dto);
		//insert("IDao.xml의 insert element의 id명",IDao.xml의 insert element의 parameterType속성에 맞는 parameter);
	}*/
	
	@Override
	public void writeDao(HostDto dto) {
		sqlSession.insert("writeDao",dto);
		gradeUpdate(dto);
	}

	@Override
	public void gradeUpdate(HostDto dto) {
		sqlSession.update("gradeUpdate", dto);
	}

}
