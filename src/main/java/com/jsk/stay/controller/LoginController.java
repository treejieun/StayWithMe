package com.jsk.stay.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.util.Constant;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
public class LoginController {
	
	private LoginDao dao;
	
	private String apiResult = null;
	
	private JdbcTemplate template;
	private PlatformTransactionManager transactionManager;
	private TransactionTemplate transactionTemplate;
	
	//bean주입은 스프링 콘테이너 생성이 필요없는 @Autowired어노테이션을 사용
	//생성자 , 필드 ,set메서드로 bean생성
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@Autowired
	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
		Constant.transactionManager = this.transactionManager;
	}
	@Autowired
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
		Constant.transactionTemplate = this.transactionTemplate;
	}
	

	@Autowired
	public void setDao(LoginDao dao) {
		this.dao = dao;
		Constant.dao = this.dao;
	}
	
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginform(@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView();
		if (log != null) {
			model.addObject("log", "before login!");
		}
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		
		model.setViewName("login");

		return model;
	}

	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "loginS", required = false) String loginS,
			@RequestParam(value = "reservation", required = false) String reservation,
			HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		if (loginS != null) {
			Constant.visitMN += 1;
			System.out.println("로그인");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		if (reservation != null) {
			model.addObject("reservation", "예약이 완료 되었습니다.");
		}
		model.setViewName("index");
		return model;
	}
	@RequestMapping("logout")
	public String logout() {
		return "logout";
	}
}