package com.jsk.stay.dao;

import com.jsk.stay.dto.HostDto;

public interface IHostDao {
	/*public void writeDao(String mb_id, String ho_address, String ho_add_detail,int ho_zip, String ho_account,String ho_acc_num);*/
	public void writeDao(HostDto dto);
	public void gradeUpdate(HostDto dto);
}
