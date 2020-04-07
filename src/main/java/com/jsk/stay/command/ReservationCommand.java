package com.jsk.stay.command;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.jsk.stay.dao.ReservationDao;
import com.jsk.stay.dao.ReservationDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.ReservationDto;

public class ReservationCommand implements Command{
	
	@Autowired
	ReservationDaoImp dao;

	@Override
	public void execute(Model model, HttpServletRequest request) {
		String checkIn_w = request.getParameter("checkIn");
		Timestamp checkIn = Timestamp.valueOf(checkIn_w);
		System.out.println(checkIn);
		String checkOut_w = request.getParameter("checkOut");
		Timestamp checkOut = Timestamp.valueOf(checkOut_w);
		System.out.println(checkOut);
		String acm_code_w = request.getParameter("acm_code");
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
		
		
		
		
	}

	
	
}
