package com.jsk.stay.dao;

public interface FindIdPwdDao {
	public String findId_phoneCheck(String mb_name, String mb_phone);
	public String findPwd_idCheck(String mb_id);
	public void findPwd_newPwd(String newPwd2, String mb_id);
}
