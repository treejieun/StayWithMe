package com.jsk.stay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.JoinCommand;
import com.jsk.stay.dao.JoinDao;
import com.jsk.stay.dao.JoinDaoImp;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.SendSMS;


@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JoinDao joinDao;
	
	private MemberDto dto;
	
	@Autowired
	JoinCommand joinCommand;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/memberjoin")
	public String memberjoin() {
		return "memberjoin";
	}
	
	@RequestMapping("/memberjoinpro")
	public String memberJoinPro(MemberDto dto, Model model) throws Exception {
 		System.out.println("joinController");
 		String success = joinCommand.memberJoinProcess(dto);
 		model.addAttribute("success", success);
 		System.out.println(success);
		return "index";
	}

	@ResponseBody //return값을 넘겨주기 위함   
	@RequestMapping("/sendSms")
	public String sendSmsPro(HttpServletRequest request) throws ServletException, IOException {
		String mb_phone = request.getParameter("mb_phone");
		System.out.println("mb_phone1: " + mb_phone);
		
		SendSMS sms = new SendSMS();
		String certificateNumber = sms.sendCertificateNumber(mb_phone);
		System.out.println(certificateNumber);
		request.setAttribute("certificateNumber", certificateNumber);
		return certificateNumber;
	}
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheckPro(HttpServletRequest request) throws Exception {
		String mb_id = request.getParameter("mb_id");
		System.out.println("mb_id : " + mb_id);
		int result = joinCommand.idCheck(mb_id);
		System.out.println(result);
		
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping("/phoneCheck")
	public String phoneCheckPro(HttpServletRequest request) throws Exception {
		String mb_phone = request.getParameter("mb_phone");
		System.out.println("mb_phone2 : " + mb_phone);
		int result = joinCommand.phoneCheck(mb_phone);
		System.out.println(result);
		
		return Integer.toString(result);
	}

}
