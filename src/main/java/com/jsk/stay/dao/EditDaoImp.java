package com.jsk.stay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jsk.stay.dto.HostDto;
import com.jsk.stay.dto.MemberDto;

public class EditDaoImp implements EditDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void myPagePwd(String id, String pw) {
		
		MemberDto dto = new MemberDto(id,pw,"","");
		
		sqlSession.update("pwdUpdate",dto);
	}

	@Override
	public void myPageEmail(String id, String email) {
		
		MemberDto dto = new MemberDto(id,"",email,"");
		
		sqlSession.update("emailUpdate",dto);
	}
	
	@Override
	public void myPagePhone(String id, String phone) {
		
		MemberDto dto = new MemberDto(id,"","",phone);
		
		sqlSession.update("phoneUpdate",dto);
	}
	
	@Override
	public void myPageAddress(String id, String ho_address, String ho_add_detail, int ho_zip) {
		
		HostDto dto = new HostDto(id,ho_address,ho_add_detail,ho_zip,"","");
		
		sqlSession.update("addressUpdate",dto);
	}
	
	@Override
	public void myPageAccount(String id,String ho_account,String ho_acc_num) {
		
		HostDto dto = new HostDto(id,"","",0,ho_account,ho_acc_num);
		
		sqlSession.update("accountUpdate",dto);
	}
	
	

}
