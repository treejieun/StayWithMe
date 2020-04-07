package com.jsk.stay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.dao.EditDaoImp;

@Controller
public class EditController {
	
	@Autowired
	EditDaoImp dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/myPagePwd")
	@ResponseBody
	public String pwd(HttpServletRequest request) throws Exception {
		String id = request.getRemoteUser();
		System.out.println("id-myPage" + id);
		try {
			String pw1 = request.getParameter("checkPwd");
			System.out.println("pw-myPage" + pw1);
			String pw = passwordEncoder.encode(pw1);
			System.out.println("pw : " + pw);	
			dao.myPagePwd(id, pw);
		}
		catch(NullPointerException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping("/myPageEmail")
	@ResponseBody
	public String email(HttpServletRequest request) {
		String id = request.getRemoteUser();
		String email = request.getParameter("mb_email");
		System.out.println("email : " + email);
		dao.myPageEmail(id, email);
		return "success";
	}
	@RequestMapping("/myPagePhone")
	@ResponseBody
	public String phone(HttpServletRequest request) {
		String id = request.getRemoteUser();
		String phone = request.getParameter("mb_phone");
		System.out.println("phone : " + phone);
		dao.myPagePhone(id, phone);
		return "success";
	}
	
	@RequestMapping("/myPageAddress")
	@ResponseBody
	public String address(HttpServletRequest request) {
		String id = request.getRemoteUser();
		String address = request.getParameter("address");
		System.out.println("address : " + address);
		String detailAddress = request.getParameter("detailAddress");
		System.out.println("detailAddress : " + detailAddress);
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		System.out.println("postcode : " + postcode);
		dao.myPageAddress(id, address, detailAddress,postcode);
		return "success";
	}
	
	@RequestMapping("/accountEdit")
	public String accountEdit(HttpServletRequest request) {
		String id = request.getRemoteUser();
		String ho_account = request.getParameter("ho_account");
		String ho_acc_num = request.getParameter("ho_acc_num");
		
		dao.myPageAccount(id,ho_account,ho_acc_num);
		
		
		return "index";
	}
	
	
}
