package com.jsk.stay.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jsk.stay.command.Command;
import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.dao.ReservationDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.MemberDto;
import com.jsk.stay.dto.ReservationDto;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationDaoImp dao;
	
	@Autowired
	LoginDao dao1;
	
	
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model,
			@RequestParam(value = "fail", required = false) String fail) {
		
		String acm_code_w = request.getParameter("acm_code");
		int acm_code = Integer.parseInt(acm_code_w);
		
		AccommodationDto dto = new AccommodationDto();
		MemberDto dto1 = new MemberDto();
		System.out.println("1");
		try {
			dto = dao.reservation(acm_code);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (fail != null) {
			model.addAttribute("fail",fail);
		}
		dto1 = dao1.information(request.getRemoteUser());
		System.out.println("2");
		model.addAttribute("rdto",dto);
		model.addAttribute("dto",dto1);
		return "reservation";
	}
	
	@RequestMapping("/res")
	@ResponseBody
	public String res(HttpServletRequest request, Model model) {
		
		String listDate = request.getParameter("listDate");
		System.out.println(listDate);
		String checkIn = request.getParameter("checkIn");
		System.out.println("checkIn : " + checkIn);
		String checkOut = request.getParameter("checkOut");
		System.out.println("checkOut ; " + checkOut);
		String acm_code_w = request.getParameter("acm_code");
		System.out.println("null point" + acm_code_w);
		int acm_code = Integer.parseInt(acm_code_w);
		System.out.println(acm_code);
		String amount_w = request.getParameter("amount");
		int amount = Integer.parseInt(amount_w);
		System.out.println(amount);
		String guest_num_w = request.getParameter("guestNum");
		int guest_num = Integer.parseInt(guest_num_w);
		System.out.println(guest_num);
		String pay_method = request.getParameter("pay_method");
		System.out.println(pay_method);
		String imp_uid = request.getParameter("imp_uid");
		System.out.println(imp_uid);
		String mb_id = request.getRemoteUser();
		System.out.println(mb_id);
		String acm_title = request.getParameter("acm_title"); 
		String acm_address = request.getParameter("acm_address"); 
		String acm_add_detail = request.getParameter("acm_add_detail"); 
		String card_name = request.getParameter("card_name"); 
		
		ReservationDto dto = new ReservationDto(imp_uid, mb_id,acm_code,pay_method,amount,guest_num,checkIn,checkOut,acm_title,acm_address,acm_add_detail,card_name);
		
		String date2 = "";
		System.out.println("dto" + dto);
		try {
			dao.reservationIn(dto);
			String date = dao.resAcmDate(acm_code);
			System.out.println(date);
			System.out.println(listDate);
			
			String[] list = listDate.split(",");
			System.out.println(list);
			String[] date1 = date.split(",");
			
			List<String> date3 = new ArrayList<String>();
			for(int i = 0; i < list.length ; i++) {
				date3.add(list[i]);
				System.out.println("list" + list[i]);
			}
			
			List<String> date4 = new ArrayList<String>();
			for(int j = 0; j < date1.length ; j++) {
				date4.add(date1[j]);
				System.out.println("date1" + date1[j]);
			}
			
			 date4.removeAll(date3);
			 
			 String date5 = "";
			 for(int i = 0 ; i < date4.size() ; i++) {
				 date5 += date4.get(i) + ",";
			 }
			
			AccommodationDto dto1 = new AccommodationDto();
			dto1.setAcm_availdate(date5);
			dto1.setAcm_code(acm_code);
			
			dao.reservationAcm(dto1);
			
			return "index";
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("reservationCheck")
	public String reservationCheck(HttpServletRequest request, Model model) throws Exception {
		 
		String mb_id = request.getRemoteUser();
		System.out.println(mb_id);
		List<ReservationDto> dto =  dao.reservationList(mb_id);
		
		System.out.println(dto);

		model.addAttribute("list",dto);
		
		return "reservationCheck";
	}
	
	@RequestMapping("resReceipt")
	public String resReeceipt(HttpServletRequest request, Model model) throws Exception {
		
		String res_code = request.getParameter("res_code");
		System.out.println(res_code);
		
		ReservationDto dto = dao.resReceipt(res_code);
		
		model.addAttribute("dto",dto);
		
		System.out.println(dto);
		
		return "resReceipt";
	}
	
}
