package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;

public class AcmContentCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		System.out.println("acm_code AcmContentCommand : "+ acm_code);
		AcmDao dao = new AcmDao();
		AccommodationDto dto = dao.contentView(acm_code);
		ArrayList<AcmSubDto> subDtos = dao.list2(acm_code);
		model.addAttribute("dto", dto);
		model.addAttribute("subDtos",subDtos);
		
		/*체크박스 체크 해주기*/
		ArrayList<String> subList = new ArrayList<String>();
		for(int i=0; i < subDtos.size(); i++) {
			subList.add(subDtos.get(i).getAcm_amenity());
		}
		model.addAttribute("subList", subList);
		
		
		
		ArrayList<String> subList2 = new ArrayList<String>();
		for(int i=0; i < subDtos.size(); i++) {
			subList2.add(subDtos.get(i).getAcm_rule());
		}
		model.addAttribute("subList2", subList2);
		
		String acm_room_type = dto.getAcm_room_type();
		String acm_bedding = dto.getAcm_bedding();
		model.addAttribute("acm_bedding", acm_bedding);
		model.addAttribute("acm_room_type", acm_room_type);
		
		/*
		 * ArrayList<String> radioList = new ArrayList<String>();
		 * radioList.add(dto.getAcm_bedding()); radioList.add(dto.getAcm_room_type());
		 * model.addAttribute("radioList", radioList);
		 */
	}

}
