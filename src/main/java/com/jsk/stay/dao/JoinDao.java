package com.jsk.stay.dao;

import com.jsk.stay.dto.MemberDto;

public interface JoinDao {

	public String memberJoinMethod(MemberDto dto) throws Exception;
	public int idCheck(String mb_id) throws Exception;
	public int phoneCheck(String mb_phone) throws Exception;

}
