package com.jsk.stay.command;

import java.util.List;

import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.MemberDto;

public interface AdminMemCommand {
	public List<MemberDto> memberList(Criteria cri);
	public int listCount();
}
