package com.jsk.stay.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jsk.stay.command.AcmCommand;
import com.jsk.stay.command.AcmContentCommand;
import com.jsk.stay.command.AcmDeleteCommand;
import com.jsk.stay.command.AcmListCommand;
import com.jsk.stay.command.AcmModifyCommand;
import com.jsk.stay.command.AcmWriteCommand;
import com.jsk.stay.util.Constant;
import com.jsk.stay.util.PagingMaker;


@Controller
@MultipartConfig(maxFileSize=1024*1024*4,location="D:/upimage/") //�ٿ�ε�
public class AcmController {
	AcmCommand command = null;
	private JdbcTemplate template;
	/*transaction*/
	private PlatformTransactionManager transactionManager;
	
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
	
	@RequestMapping("/addAcm")
	public String addAcm() {
		return "addAcm";
	}
	
	@RequestMapping("/write") //���� ���� ���ε� ó�� public String
	public String write(MultipartHttpServletRequest mtfRequest, Model model,HttpServletRequest request) {
		MultipartFile mf = mtfRequest.getFile("acm_thumbnail");
		//MultipartFile��ü�� ��, �̶��� getParameter(�Ϲ� input)��� getFile() �޼��� ���
		String path = "/stay/resources/upImg"; //���ε�� ���� ���� ��ġ (�̸��� �����̸��� �ð��� �ٿ� ���ϼ�)
		String real_save_path = request.getServletContext().getRealPath(path);
		
		//������ ���޵� ���� �̸�
		String orginFileName = mf.getOriginalFilename();
		//���ε�� ����ũ��
		long fileSize = mf.getSize();
		
		//������ ������ �̸��� �ٲپ� ����(������ �̸��� ������ ������ �ߺ��� ����,�ð��� �տ� �ٿ� �ߺ� ����)
		//String safeFile = path + System.currentTimeMillis() + orginFileName; //pathname
		String dfile = System.currentTimeMillis() + orginFileName;
		String safeFile ="D:/work-spring/team/src/main/webapp/resources/upImg/" + dfile;
		String safeFile1 ="D:/apache-tomcat-8.5.47/apache-tomcat-8.5.47/wtpwebapps/stay/resources/upImg/" + dfile;	
		
		try {
			mf.transferTo(new File(safeFile));
			mf.transferTo(new File(safeFile1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("fileName",dfile);
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		model.addAttribute("addAcm", "success");
		return "redirect:hostBoard?addS=1&pagenum=1&contentnum=3";
		
	}

	
	@RequestMapping("ckedit")
	public void ckedit(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("ckedit ����");
		String path = "/stay/resources/upImg";
		String real_save_path = request.getServletContext().getRealPath(path);
		System.out.println("real_save_path " + real_save_path);
		MultipartFile mf = request.getFile("upload");
		String originFileName = mf.getOriginalFilename();
		System.out.println("originFileName " + originFileName);
		long fileSize = mf.getSize(); 
		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize of the MultipartFile : " + fileSize);
		String safeFile ="D:/work-spring/team/src/main/webapp/resources/upImg/" + originFileName;
		String safeFile1 ="D:/apache-tomcat-8.5.47/apache-tomcat-8.5.47/wtpwebapps/stay/resources/upImg/" + originFileName;	
		System.out.println("safeFile : " + safeFile);
		try {
			mf.transferTo(new File(safeFile));
			mf.transferTo(new File(safeFile1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject outData = new JSONObject(); //json ��ü ����
		outData.put("uploaded", true);
		//��û ���(Scheme : �������� http ServerName:localhost ServerPort:8181
		outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + 
				request.getServerPort() + path + "/" + originFileName);
		
		System.out.println(request.getScheme() + "://" + request.getServerName() + ":" + 
				request.getServerPort() + path + "/" + originFileName);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
	}
	
	@RequestMapping("/hostBoard")
	public String list(
			@RequestParam(value = "addS", required = false) String addS,
			Model model,Principal principal,HttpServletRequest request) {
		if (addS != null) {
			model.addAttribute("addS", "add ACM success");
		}
		String mb_id = principal.getName();
		System.out.println("ȣ��Ʈ���� ��Ʈ�ѷ� : " + mb_id);
		command = new AcmListCommand();
		
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("request",request);
		command.execute(model);
		/*
		 * System.out.println("11111111111111");
		
		model.addAttribute("mb_id", mb_id);
		command.execute(model);
		
		Map<String,Object> map = model.asMap();
		System.out.println("ȣ��Ʈ���� ������");
		ArrayList<AccommodationDto> dtos1 = (ArrayList<AccommodationDto>) map.get("list1");
		
		model.addAttribute("list1", dtos1);
		System.out.println("22222222222");
		 * 
		 * */
		
		
		//return "redirect:hostBoard?pagenum=1&contentnum=10";
		return "hostBoard/hostBoard";
	}
	
	@RequestMapping("acmContent")
	public String acmContent(Model model,Principal principal,HttpServletRequest request) {
		//int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		
		model.addAttribute("request", request);
		command = new AcmContentCommand();
		command.execute(model);
		
		return "hostBoard/acmContent";
	}
	
	@RequestMapping("acmModify")
	public String acmModify(Model model,Principal principal,HttpServletRequest request) {
		
		model.addAttribute("request", request);
		command = new AcmModifyCommand();
		System.out.println("��Ʈ�ѷ�acmModify���� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ�acmModify���� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		model.addAttribute("hostModify", "success");
		return "redirect:hostBoard?pagenum=1&contentnum=3";
	}
	
	@RequestMapping("acmDelete")
	public String acmDelete(Model model,Principal principal,HttpServletRequest request) {
		model.addAttribute("request", request);
		command = new AcmDeleteCommand();
		command.execute(model);
		return "redirect:hostBoard?pagenum=1&contentnum=3";
	}
	/*
	@RequestMapping("/write") //���� ���� ���ε� ó��d
	public String write(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		//�������� ������ ��� ���� getFiles(form�� name�Ӽ�)
		List<MultipartFile> fileList = mtfRequest.getFiles("acm_thumbnail");
		System.out.println("��Ƽ��Ʈ���� ����Ʈ�� form�� ������Ʈ�������� ��");
		//MultipartFile��ü�� ��, �̶��� getParameter(�Ϲ� input)��� getFile() �޼��� ���
		String path = "D:/upimage/"; //���ε�� ���� ���� ��ġ
		String fileRoots = "";
		for (MultipartFile mf : fileList) {
			//������ ���޵� ���� �̸�
			String orginFileName = mf.getOriginalFilename();
			//���ε�� ����ũ��
			long fileSize = mf.getSize();
			System.out.println("originFileName: "+ orginFileName);
			System.out.println("fileSize: "+ fileSize );
			String safeFile = path + System.currentTimeMillis() + orginFileName; //pathname
			String dfile = System.currentTimeMillis() + orginFileName;
			System.out.println(" dfile: "+  dfile );
			String fileRoot = path + dfile; //db�� ����� ���� ��ü ���
			fileRoots += fileRoot + " ";
			try {
				mf.transferTo(new File(safeFile));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(fileRoots);
		model.addAttribute("fileRoots", fileRoots);
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		model.addAttribute("hostJoin", "success");
		return "redirect:hostBoard";
		
	}*/
/*	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		command = new AcmWriteCommand();
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ���� ���� �Ϸ�");
		command.execute(model);
		System.out.println("��Ʈ�ѷ����� Ŀ�ǵ�Ŭ������ ����ťƮ�޼��� ȣ�� �Ϸ�");
		model.addAttribute("hostJoin", "success");
		return "redirect:hostBoard";
	}*/
}
