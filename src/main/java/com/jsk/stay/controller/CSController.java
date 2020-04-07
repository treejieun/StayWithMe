package com.jsk.stay.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.CSCommandImp;
import com.jsk.stay.dto.CSDto;
import com.jsk.stay.dto.Criteria;
import com.jsk.stay.dto.PageMaker;

@Controller
public class CSController {
	
	@Autowired
	private CSCommandImp com;
	
	@RequestMapping("/csMember")
	public String csMember(Model model, Criteria cri, HttpServletRequest request) throws Exception {
	
		if(request.isUserInRole("ROLE_ADMIN") == true) {
			model.addAttribute("list", com.list(cri));
			
			String mb_id = null;
			System.out.println("csController cri: " + cri);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(com.listCount(mb_id));
			System.out.println("totalCount: " + com.listCount(mb_id));
			System.out.println("StartPage: " + pageMaker.getStartPage());
			
			model.addAttribute("pageMaker", pageMaker);
		}
		else {
			String mb_id = request.getRemoteUser();
			cri.setMb_id(mb_id);
			System.out.println("list2");
			model.addAttribute("list", com.list2(cri));
			System.out.println(mb_id);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(com.listCount(mb_id));
			
			model.addAttribute("pageMaker", pageMaker);
		}
		return "cs/csMember";
	}
	
	@RequestMapping("/csContent")
	public String csContent(HttpServletRequest request, Model model, CSDto dto) throws Exception {
		String cs_code = request.getParameter("cs_code");
		//String mb_id = request.getParameter("mb_id");
		System.out.println("cs_code: " + cs_code);
		//System.out.println("mb_id: " +mb_id);
		//model.addAttribute("content", com.content(Integer.parseInt(cs_code)));
		ArrayList<CSDto> dto1 = com.content(Integer.parseInt(cs_code));
		int cs_group = dto1.get(0).getCs_group();
		System.out.println("cs_group: " + cs_group);
		model.addAttribute("content", dto1);
		if(cs_group != 0) {
			model.addAttribute("reply", com.reply(cs_group));
			System.out.println("리플");
		}
		//int cs_group = dto.getCs_group();
		//System.out.println(cs_group);
		System.out.println("여기까지2");
		return "cs/content";
	}
	
	@RequestMapping("/csMbWrite")
	public String mbWrite(Model model, Principal principal) {
		String mb_id = principal.getName();
		System.out.println("csMb_id: " + mb_id);
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_name", com.mbWrite(mb_id));
		return "cs/mbWrite";
	}
	
	@RequestMapping("/csMbWritePro")
	public String mbWritePro(CSDto dto) throws Exception {
		System.out.println("됐나?1");
		com.mbWritePro(dto);
		return "redirect:csMember";
	}
	
	@RequestMapping("/csMbModify")
	public String mbModify(Model model, HttpServletRequest request, CSDto dto) {
		String cs_code = request.getParameter("cs_code");
		String cs_title = request.getParameter("cs_title");
		String cs_content = request.getParameter("cs_content");
		System.out.println("cs_code: " + cs_code);
		model.addAttribute("cs_code", Integer.parseInt(cs_code));
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("cs_content", cs_content);

		//model.addAttribute("modify", com.content(Integer.parseInt(cs_code)));
		
		return "cs/mbModify";
	}
	
	@RequestMapping("/csMbModifyPro")
	public String mbModifyPro(@ModelAttribute CSDto dto, Model model) {
		//String cs_code = request.getParameter("cs_code");
		//String cs_title = request.getParameter("cs_title");
		//String cs_content = request.getParameter("cs_content");

		//model.addAttribute("content", com.mbModifyPro(Integer.parseInt(cs_code), cs_title, cs_content));
		
		com.mbModifyPro(dto);
		model.addAttribute("cs_code", dto.getCs_code());
		return "redirect:csContent";
	}
	
	@RequestMapping("/csMbDelete")
	public String mbDelete(HttpServletRequest request) {
		String cs_code = request.getParameter("cs_code");
		System.out.println("delete: " + cs_code);
		com.mbDelete(Integer.parseInt(cs_code));
		return "redirect:csMember";
	}
	
	@RequestMapping("/csAdReply")
	public String adReply(@ModelAttribute CSDto dto, Model model, Principal principal) {
		int cs_code = dto.getCs_code();
		String cs_title = dto.getCs_title();
		String mb_id = principal.getName();
		model.addAttribute("cs_code", cs_code);
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_name", com.mbWrite(mb_id));
		return "cs/adReply";
	}
	
	@RequestMapping("/csAdReplyPro")
	public String adReplyPro(CSDto dto) {
		System.out.println(dto.getCs_code());
		com.adReplyPro(dto);
		return "redirect:csMember";
	}
	
	@RequestMapping("/csAdModify")
	public String AdModify(Model model, HttpServletRequest request, CSDto dto) {
		String cs_code = request.getParameter("cs_code");
		String cs_title = request.getParameter("cs_title");
		String cs_content = request.getParameter("cs_content");
		String cs_group = request.getParameter("cs_group");
		System.out.println("cs_code2: " + cs_code);
		model.addAttribute("cs_code", Integer.parseInt(cs_code));
		model.addAttribute("cs_title", cs_title);
		model.addAttribute("cs_content", cs_content);
		model.addAttribute("cs_group", cs_group);

		//model.addAttribute("modify", com.content(Integer.parseInt(cs_code)));
		
		return "cs/adModify";
	}
	
	@RequestMapping("/csAdModifyPro")
	public String AdModifyPro(@ModelAttribute CSDto dto, HttpServletRequest request, Model model) {
		String cs_content1 = request.getParameter("cs_content1") + "<p>--------------------------------------------</p>";
		String cs_content2 = request.getParameter("cs_content2");
		String cs_content = cs_content1 + cs_content2;
		dto.setCs_content(cs_content);
		System.out.println(cs_content);
		com.adModifyPro(dto);
		model.addAttribute("cs_code", dto.getCs_group());
		return "redirect:csContent";
		//return "";
	}
	
	@RequestMapping("/csAdDelete")
	public String adDelete(HttpServletRequest request) {
		String cs_code = request.getParameter("cs_code");
		String cs_group = request.getParameter("cs_group");
		com.adDelete(Integer.parseInt(cs_code), Integer.parseInt(cs_group));
		return "redirect:csMember";
	}
	
}
