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

	//ajax�� ���̵�&��й�ȣ ã�� �������� �̵�
	@RequestMapping("/findIdPwd")
	public String findIdPwd(HttpServletRequest request) {
		//String foundId2 = request.getParameter("foundId");
		//model.addAttribute("foundId2", foundId2);
		//System.out.println("foundId2: " + foundId2);
		return "findIdPwd";
	}
	
	//ȸ������ �� �� ������ ��ġ�ϴ� ���̵� ������ ajax���� ���̵� data�� ����. ������ notFoundId�� ���ϵ�.
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
	
	//ajax�� finIdPwd���������� ã�� ���̵��� �޾� ���̵� ��ȸ ���� �������� �̵�
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
		//���� ����
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
		
		//�̸��� ������ ���� ����
		String user = "jsk.stay@gmail.com";
		String password = "hankyung05";
		
		//SMTP ���� ���� ����
		//Properties prop = new Properties();
		Properties prop = System.getProperties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//Session ����
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		//session.setDebug(true); //����׸� ����
		
		//�̸��� ������
		try {
			//Transport transport = session.getTransport();
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("jsk.stay@gmail.com")); //�߽��� �̸��� ����
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmail)); //������ �̸��� ����
			
			//�̸��� ����&����
			message.setSubject("STAY WITH ME���� ��û�Ͻ� �ӽú�й�ȣ�� �˷��帳�ϴ�.");
			
			Multipart multipart = new MimeMultipart();
			
			String htmlText = 					"<div style='border:2px solid #e5e5e5; text-align:center; width:500px; margin:auto; font-family:fantasy;'><div style='border-bottom:2px solid #e5e5e5; padding-bottom:30px; padding-top:10px;'><img src='cid:image_id'>"
					+ "<p style='font-size:20px; margin-top:5px;'>��û�Ͻ� �ӽ� ��й�ȣ�� �Ʒ��� �����ϴ�.</p></div>"
					+ "<div style='padding-top:20px;'>"
					+ "<span style='font-size:25px; background-color:black;'>" + newPwd + "</span>"
					+ "<p style='margin-top:20px; margin-bottom:25px;'>�� �ؽ�Ʈ�ڽ��� �巡�� �� �����Ͽ� ����ϼ���.<br/>�ӽ� ��й�ȣ�� ���� �α��� �Ͻ� �� �ݵ�� ��й�ȣ �缳���� ���ֽñ� �ٶ��ϴ�.</p></div></div>";
			
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
