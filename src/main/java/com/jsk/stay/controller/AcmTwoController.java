package com.jsk.stay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsk.stay.command.AcmTwoCommand;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AccommodationDto2;
import com.jsk.stay.dto.CriteriaAcm;
import com.jsk.stay.dto.PageMakerAcm;

import net.sf.json.JSONArray;


@Controller
public class AcmTwoController {
	@Autowired
	private AcmTwoCommand com;

	@RequestMapping("/acmList")
	public String acmList(Model model, CriteriaAcm cri, HttpServletRequest request) {
		
		String loc = request.getParameter("location");
		String location = loc.substring(0, 2);
		System.out.println(location);
		
		List<AccommodationDto> acmList = new ArrayList<AccommodationDto>();
		acmList = com.acmList(cri, location);
		model.addAttribute("list", acmList);
		System.out.println("controller cri:" + cri);
		model.addAttribute("location", location);
		PageMakerAcm pageMaker = new PageMakerAcm();
		pageMaker.setLocation(location);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(com.acmListCount(location));
		System.out.println("StartPage: " + pageMaker.getStartPage());
		
		model.addAttribute("pageMaker", pageMaker);
		
		List<AccommodationDto2> acmList2 = new ArrayList<AccommodationDto2>();
		
		for(AccommodationDto dto1 : acmList) {
			AccommodationDto2 dto2 = new AccommodationDto2();
			dto2.setMb_id(dto1.getMb_id());
			dto2.setAcm_code(dto1.getAcm_code());
			dto2.setAcm_charge(dto1.getAcm_charge());
			dto2.setAcm_availdate(dto1.getAcm_availdate());
			dto2.setAcm_checkin_time(dto1.getAcm_checkin_time());
			dto2.setAcm_checkout_time(dto1.getAcm_checkout_time());
			dto2.setAcm_type(dto1.getAcm_type());
			dto2.setAcm_room_type(dto1.getAcm_room_type());
			dto2.setAcm_guest_num(dto1.getAcm_guest_num());
			dto2.setAcm_room_num(dto1.getAcm_room_num());
			dto2.setAcm_bath_num(dto1.getAcm_bath_num());
			dto2.setAcm_area(dto1.getAcm_area());
			dto2.setAcm_bedding(dto1.getAcm_bedding());
			dto2.setAcm_address(dto1.getAcm_address());
			dto2.setAcm_add_detail(dto1.getAcm_add_detail());
			dto2.setAcm_zip(dto1.getAcm_zip());
			dto2.setAcm_title(dto1.getAcm_title());
			dto2.setAcm_thumbnail(dto1.getAcm_thumbnail());
			acmList2.add(dto2);
		}
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonList", jsonArray.fromObject(acmList2));
		return "acmList";
	}
	
	@RequestMapping("/acmInfo")
	public String acmInfo(Model model, HttpServletRequest request) {
		String acm_code = request.getParameter("acm_code");
		System.out.println("acmInfo: " + acm_code);
		model.addAttribute("acmInfo", com.accommodation(Integer.parseInt(acm_code)));
		model.addAttribute("amenity", com.amenity(Integer.parseInt(acm_code)));
		model.addAttribute("rule", com.rule(Integer.parseInt(acm_code)));
		return "acmInfo";
	}
}
