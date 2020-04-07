package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;
import com.jsk.stay.util.PagingMaker;

public class AcmListCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		System.out.println("AcmListCommand execute ¸Þ¼­µå µé¾î¿È");
		
		Map<String,Object> map = model.asMap();
		System.out.println("¸ðµ¨ ¸ãÀ¸·Î");
		String mb_id = (String) map.get("mb_id");
		AcmDao dao = new AcmDao();
		System.out.println("AcmListCommandÀÇ  " + mb_id);
		
		int totalcount = dao.totalcount(mb_id);
		
		PagingMaker pm = new PagingMaker();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int pagenum;
		int contentnum;
		
		if (request.getParameter("pagenum") != null ) {
			pagenum = Integer.parseInt(request.getParameter("pagenum"));
		}
		else {
			pagenum = 1;
		}
		if (request.getParameter("contentnum") != null) {
			contentnum = Integer.parseInt(request.getParameter("contentnum"));
		}
		else {
			contentnum=10;
		}
		
		pm.setTotalcount(totalcount);
		pm.setPagenum(pagenum);
		pm.setContentnum(contentnum);
		pm.setCurrentblock(pagenum);
		pm.setLastblock(pm.getTotalcount());
		
		pm.prevnet(pagenum);
		pm.setStartPage(pm.getCurrentblock());
		pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());
		

		ArrayList<AccommodationDto> dtos = dao.boardList(mb_id,pm.getPagenum(),pm.getContentnum());

		//		ArrayList<AccommodationDto> dtos = dao.boardList(mb_id,pm.getPagenum()*10,pm.getContentnum());

		//request.setAttribute("page", pm);
		
		//ArrayList<AccommodationDto> dtos1 = dao.list1(mb_id);
		//ArrayList<AcmSubDto> dtos2 = dao.list2(134);
		/*
		for(int i=0; i< dtos1.size(); i++){
			System.out.println("getAcm_code() : "+ dtos1.get(i).getAcm_code());
			System.out.println("getMb_id() : "+ dtos1.get(i).getMb_id());
		}	
		for(int i=0; i< dtos2.size(); i++){
			System.out.println("getAcm_code() : "+ dtos2.get(i).getAcm_rule());
			System.out.println("getMb_id() : "+ dtos2.get(i).getAcm_amenity());
		}	
		*/
		//ArrayList<AcmSubDto> dtos2 = dao.list2();
		model.addAttribute("list", dtos);
		//model.addAttribute("list2", dtos2);
		//model.addAttribute("totalcount", totalcount);
		model.addAttribute("page", pm);
	}

}
