package com.jsk.stay.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.AdminMemDao;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.MemberDto;

@Service
public class AdminMemCommandImp implements AdminMemCommand {
	@Autowired
	private AdminMemDao dao;
	
	public List<MemberDto> memberList(Criteria cri) {
		return dao.memberList(cri);
	}
	public int listCount() {
		return dao.listCount();
	}
}
