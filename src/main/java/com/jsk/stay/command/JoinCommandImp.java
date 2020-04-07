package com.jsk.stay.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.JoinDao;
import com.jsk.stay.dto.MemberDto;


@Service
public class JoinCommandImp implements JoinCommand {

	@Autowired
	private JoinDao joinDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public String memberJoinProcess(MemberDto dto) throws Exception {
		String mb_pwd1 = dto.getMb_pwd();
		System.out.println("origin: " + mb_pwd1);
		String mb_pwd = passwordEncoder.encode(mb_pwd1);
		System.out.println("Encoder: " + mb_pwd);
		dto.setMb_pwd(mb_pwd);
		return joinDao.memberJoinMethod(dto);

	}
	
	@Override
	public int idCheck(String mb_id) throws Exception {
		return joinDao.idCheck(mb_id);
	}
	
	@Override
	public int phoneCheck(String mb_phone) throws Exception {
		return joinDao.phoneCheck(mb_phone);
	}
}
