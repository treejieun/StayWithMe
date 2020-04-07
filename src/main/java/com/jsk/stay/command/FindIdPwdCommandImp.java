package com.jsk.stay.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dao.FindIdPwdDaoImp;

public class FindIdPwdCommandImp implements FindIdPwdCommand {
	
	@Override
	public String findId_phoneCheck(String mb_name, String mb_phone) {
		FindIdPwdDaoImp dao = new FindIdPwdDaoImp();
		System.out.println("FindIdPwdCommand");
		return dao.findId_phoneCheck(mb_name, mb_phone);
	}
	
	@Override
	public String findPwd_idCheck(String mb_id) {
		FindIdPwdDaoImp dao = new FindIdPwdDaoImp();
		System.out.println("FindIdPwdCommand");
		return dao.findPwd_idCheck(mb_id);
	}
	
	@Override
	public void findPwd_newPwd(String newPwd2, String mb_id) {
		FindIdPwdDaoImp dao = new FindIdPwdDaoImp();

		dao.findPwd_newPwd(newPwd2, mb_id);
	}
}
