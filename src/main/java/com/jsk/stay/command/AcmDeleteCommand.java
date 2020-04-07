package com.jsk.stay.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;

public class AcmDeleteCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		System.out.println("AcmDeleteCommand¿¡¼­ parameter ; " + acm_code);
		
		AcmDao dao = new AcmDao();
		dao.delete(acm_code);

	}

}
