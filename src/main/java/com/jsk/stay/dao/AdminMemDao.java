package com.jsk.stay.dao;

import java.util.List;

import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.MemberDto;

public interface AdminMemDao {
	public List<MemberDto> memberList(Criteria cri);
	public int listCount();
}
