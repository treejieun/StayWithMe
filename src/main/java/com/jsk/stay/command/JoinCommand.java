package com.jsk.stay.command;

import com.jsk.stay.dto.MemberDto;

public interface JoinCommand {
	public String memberJoinProcess(MemberDto dto) throws Exception;
	public int idCheck(String mb_id) throws Exception;
	public int phoneCheck(String mb_phone) throws Exception;

}
