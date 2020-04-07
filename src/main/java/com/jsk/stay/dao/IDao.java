package com.jsk.stay.dao;

import com.jsk.stay.dto.HostDto;
import com.jsk.stay.dto.MemberDto;

public interface IDao {
	public MemberDto login(String mb_id);
	public String check(String mb_id);
	public MemberDto information(String mb_id);
	public HostDto information1(String mb_id);
}
