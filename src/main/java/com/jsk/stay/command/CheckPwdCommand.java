package com.jsk.stay.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;

public class CheckPwdCommand implements Command{
	
	LoginDao dao;
	

	@Override
	public void execute(Model model, HttpServletRequest request) {
		
	}

}
