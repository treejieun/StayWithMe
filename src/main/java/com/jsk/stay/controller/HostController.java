package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.dao.HostDao;
import com.jsk.stay.dto.HostDto;

@Controller
public class HostController {
	
	@Autowired
	private HostDao dao;
	
	@RequestMapping("hostJoin")
	public String hostJoin() {
		return "hostJoin";
	}
	
	@RequestMapping("hostWrite") 
	public String hostWrite(HostDto dto, Model model,HttpServletRequest request) {
		dao.writeDao(dto);
		return "logout";
	}
	
}
