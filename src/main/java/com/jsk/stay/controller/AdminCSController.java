package com.jsk.stay.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.CSCommandImp;
import com.jsk.stay.dto.CSDto;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.PageMaker;

@Controller
public class AdminCSController {
	
	@Autowired
	private CSCommandImp com;
	
	@RequestMapping("/csAdmin")
	public String csMember(Model model, Criteria cri) throws Exception {
	
			model.addAttribute("list", com.list(cri));
			
			String mb_id = null;
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(com.listCount(mb_id));
			
			model.addAttribute("pageMaker", pageMaker);

		return "admin/csAdmin";
	}
	@RequestMapping("/csAdContent")
	public String csContent(HttpServletRequest request, Model model, CSDto dto) throws Exception {
		String cs_code = request.getParameter("cs_code");
		System.out.println("cs_code: " + cs_code);

		ArrayList<CSDto> dto1 = com.content(Integer.parseInt(cs_code));
		int cs_group = dto1.get(0).getCs_group();
		System.out.println("cs_group: " + cs_group);
		model.addAttribute("content", dto1);
		if(cs_group != 0) {
			model.addAttribute("reply", com.reply(cs_group));
			System.out.println("리플");
		}

		System.out.println("여기까지2");
		return "admin/csAdContent";
	}
	
	@RequestMapping("/csReply")
	public String csReply(@ModelAttribute CSDto dto, Model model, Principal principal) {
		int cs_code = dto.getCs_code();
		String cs_title = dto.getCs_title();
		String mb_id = principal.getName();
		model.addAttribute("cs_code", cs_code);
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_name", com.mbWrite(mb_id));
		return "admin/csReply";
	}
	
	@RequestMapping("/csReplyPro")
	public String csReplyPro(CSDto dto) {
		System.out.println(dto.getCs_code());
		com.adReplyPro(dto);
		return "redirect:csAdmin";
	}
	
	@RequestMapping("/csModify")
	public String csModify(Model model, HttpServletRequest request, CSDto dto) {
		String cs_code = request.getParameter("cs_code");
		String cs_title = request.getParameter("cs_title");
		String cs_content = request.getParameter("cs_content");
		String cs_group = request.getParameter("cs_group");
		System.out.println("cs_code2: " + cs_code);
		model.addAttribute("cs_code", Integer.parseInt(cs_code));
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("cs_content", cs_content);
		model.addAttribute("cs_group", cs_group);

		return "admin/csModify";
	}
	
	
	@RequestMapping("/csModifyPro")
	public String csModifyPro(@ModelAttribute CSDto dto, HttpServletRequest request, Model model) {
		String cs_content1 = request.getParameter("cs_content1") + "<p>--------------------------------------------</p>";
		String cs_content2 = request.getParameter("cs_content2");
		String cs_content = cs_content1 + cs_content2;
		dto.setCs_content(cs_content);
		System.out.println(cs_content);
		com.adModifyPro(dto);
		model.addAttribute("cs_code", dto.getCs_group());
		return "redirect:csAdContent";
	}
	
	@RequestMapping("/csDelete")
	public String adDelete(HttpServletRequest request) {
		String cs_code = request.getParameter("cs_code");
		String cs_group = request.getParameter("cs_group");
		com.adDelete(Integer.parseInt(cs_code), Integer.parseInt(cs_group));
		return "redirect:csAdmin";
	}
	
}
