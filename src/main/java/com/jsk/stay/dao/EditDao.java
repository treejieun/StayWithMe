package com.jsk.stay.dao;


public interface EditDao {

	public void myPagePwd(String id, String pw);
	public void myPageEmail(String id, String email);
	public void myPagePhone(String id, String phone);
	public void myPageAddress(String id, String ho_address, String ho_add_detail, int ho_zip);
	public void myPageAccount(String id,String ho_account,String ho_acc_num);
}
