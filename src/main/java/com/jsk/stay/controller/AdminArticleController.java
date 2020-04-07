package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmTwoCommand;
import com.jsk.stay.command.AdminArticleCommandImp;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.PageMaker;

@Controller
public class AdminArticleController {
	
	@Autowired
	private AdminArticleCommandImp com;
	
	@Autowired
	private AcmTwoCommand comm;
	
	@RequestMapping("/acmArticle")
	public String acmArticle(Criteria cri, Model model) {
		model.addAttribute("list", com.acmArticle(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "admin/acmArticle";
	}
	
	@RequestMapping("/acmDetail")
	public String acmDetail(HttpServletRequest request, Model model) {
		String acm_code = request.getParameter("acm_code");
		System.out.println("acmInfo: " + acm_code);
		model.addAttribute("acmInfo", comm.accommodation(Integer.parseInt(acm_code)));
		model.addAttribute("amenity", comm.amenity(Integer.parseInt(acm_code)));
		model.addAttribute("rule", comm.rule(Integer.parseInt(acm_code)));
		return "admin/acmDetail";
	}
	
	@RequestMapping("/reviewArticle")
	public String reviewArticle() {
		return "admin/reviewArticle";
	}
}
