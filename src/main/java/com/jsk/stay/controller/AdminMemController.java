package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AdminMemCommandImp;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.dto.PageMaker;

@Controller
public class AdminMemController {
	
	@Autowired
	private AdminMemCommandImp com;
	
	@RequestMapping("/memberList")
	public String memberList(Model model, Criteria cri, MemberDto dto) throws Exception {
		model.addAttribute("list", com.memberList(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.listCount());
		
		model.addAttribute("pageMaker", pageMaker);

		return "admin/memberList";
	}
}
