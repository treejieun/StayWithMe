package com.jsk.stay.controller;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.FindIdPwdCommand;
import com.jsk.stay.command.FindIdPwdCommandImp;
import com.jsk.stay.util.Constant;


@Controller
public class FindIdPwdController {
	
	private JdbcTemplate template;
	
	FindIdPwdCommandImp com;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	//ajax로 아이디&비밀번호 찾기 페이지로 이동
	@RequestMapping("/findIdPwd")
	public String findIdPwd(HttpServletRequest request) {
		//String foundId2 = request.getParameter("foundId");
		//model.addAttribute("foundId2", foundId2);
		//System.out.println("foundId2: " + foundId2);
		return "findIdPwd";
	}
	
	//회원정보 비교 후 정보가 일치하는 아이디가 있으면 ajax에서 아이디를 data로 받음. 없으면 notFoundId가 리턴됨.
	@ResponseBody
	@RequestMapping("/findIdCheck")
	public String findIdCheckpro(HttpServletRequest request) {
		System.out.println("/findIdCheck");
		String mb_name = request.getParameter("mb_name");
		System.out.println(mb_name);
		String mb_phone = request.getParameter("mb_phone");
		System.out.println(mb_phone);
		
		com = new FindIdPwdCommandImp();
		String result = com.findId_phoneCheck(mb_name, mb_phone);
		
		System.out.println(result);
		
		return result;
	}
	
	//ajax로 finIdPwd페이지에서 찾은 아이디값을 받아 아이디 조회 성공 페이지로 이동
	@RequestMapping("/findIdSuccess")
	public String findIdSuccess(HttpServletRequest request, Model model) {
		String foundId = request.getParameter("foundId");
		System.out.println("foundId : " + foundId);
		model.addAttribute("foundId", foundId);
		return "findIdSuccess";
	}
	
	//
	@ResponseBody
	@RequestMapping("/findPwd_idCheck")
	public String findPwd_idCheck(HttpServletRequest request) {
		System.out.println("/findPwd_idCheck");
		String mb_id = request.getParameter("mb_id");
		System.out.println("findPwd_id : " + mb_id);
		
		com = new FindIdPwdCommandImp();
		String result = com.findPwd_idCheck(mb_id);
		
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findPwd_sendEmail")
	public String findPwd_sendEmail(HttpServletRequest request) {
		//수신 메일
		String receiveEmail = request.getParameter("mb_email");
		String mb_id = request.getParameter("mb_id");
		System.out.println(receiveEmail + mb_id);
		
		char pwdCollection[] = new char[] {
			'1','2','3','4','5','6','7','8','9','0',
			'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
			'!','@','#','$','%','^','&','*','(',')'
		};
		
		String newPwd = "";
		
		for(int i = 0 ; i < 13 ; i++) {
			int selectRandomPwd = (int)(Math.random() * (pwdCollection.length));
			newPwd += pwdCollection[selectRandomPwd];
		}
		
		System.out.println(newPwd);
		
		String newPwd2 = passwordEncoder.encode(newPwd);
		System.out.println("EncoderPwd: " + newPwd2);
		
		com = new FindIdPwdCommandImp();
		com.findPwd_newPwd(newPwd2, mb_id);
		
		//이메일 보내는 계정 정보
		String user = "jsk.stay@gmail.com";
		String password = "hankyung05";
		
		//SMTP 서버 정보 설정
		//Properties prop = new Properties();
		Properties prop = System.getProperties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//Session 설정
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		//session.setDebug(true); //디버그를 위함
		
		//이메일 보내기
		try {
			//Transport transport = session.getTransport();
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("jsk.stay@gmail.com")); //발신자 이메일 세팅
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmail)); //수신자 이메일 세팅
			
			//이메일 제목&내용
			message.setSubject("STAY WITH ME에서 요청하신 임시비밀번호를 알려드립니다.");
			
			Multipart multipart = new MimeMultipart();
			
			String htmlText = 					"<div style='border:2px solid #e5e5e5; text-align:center; width:500px; margin:auto; font-family:fantasy;'><div style='border-bottom:2px solid #e5e5e5; padding-bottom:30px; padding-top:10px;'><img src='cid:image_id'>"
					+ "<p style='font-size:20px; margin-top:5px;'>요청하신 임시 비밀번호는 아래와 같습니다.</p></div>"
					+ "<div style='padding-top:20px;'>"
					+ "<span style='font-size:25px; background-color:black;'>" + newPwd + "</span>"
					+ "<p style='margin-top:20px; margin-bottom:25px;'>위 텍스트박스를 드래그 후 복사하여 사용하세요.<br/>임시 비밀번호를 통해 로그인 하신 후 반드시 비밀번호 재설정을 해주시길 바랍니다.</p></div></div>";
			
			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(htmlText, "text/html; charset=utf-8");
			
			multipart.addBodyPart(bodyPart);
			
			bodyPart = new MimeBodyPart();
			String filename = "D:/img/logo.jpg";
			DataSource fds = new FileDataSource(filename);
			bodyPart.setDataHandler(new DataHandler(fds));
			bodyPart.setFileName(filename);
			bodyPart.setHeader("Content-ID", "image_id");
			multipart.addBodyPart(bodyPart);
			
			message.setContent(multipart);
			
			Transport.send(message);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		/*catch(AddressException e) {
			e.printStackTrace();
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}*/
		
		String result = receiveEmail;
		return result;
	}
}
