package com.jsk.stay.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;

public class AcmModifyCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		System.out.println("커맨드클래스의 엑스큐트 메서드 안 ok");
		
		String mb_id = request.getParameter("mb_id");
		int acm_code = Integer.parseInt(request.getParameter("acm_code"));
		String acm_type = request.getParameter("acm_type");
		String acm_room_type = request.getParameter("acm_room_type");
		String acm_bedding = request.getParameter("acm_bedding");
		int acm_guest_num = Integer.parseInt(request.getParameter("acm_guest_num"));
		int acm_room_num = Integer.parseInt(request.getParameter("acm_room_num"));
		int acm_bath_num = Integer.parseInt(request.getParameter("acm_bath_num"));
		int acm_area = Integer.parseInt(request.getParameter("acm_area"));
		int acm_charge = Integer.parseInt(request.getParameter("acm_charge"));
		String acm_title = request.getParameter("acm_title");
		String acm_info = request.getParameter("acm_info");
		
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");

		String acm_address = address + extraAddress;
		String acm_add_detail = detailAddress;
		
		int acm_zip = Integer.parseInt(request.getParameter("postcode"));
		String acm_checkin_time = request.getParameter("acm_checkin_time");
		String acm_checkout_time = request.getParameter("acm_checkout_time");
		//String acm_img = request.getParameter("fileRoots");
		String acm_availdate = request.getParameter("acm_availdate");
		
		
		String[] rules = request.getParameterValues("acm_rule");
		String[] amenities = request.getParameterValues("acm_amenity");
		
		AcmDao dao = new AcmDao();
		dao.modify(
				mb_id,
				acm_code,
				acm_type,
				acm_room_type,
				acm_bedding,
				acm_guest_num,
				acm_room_num,
				acm_bath_num,
				acm_area,
				acm_charge,
				acm_title,
				acm_info,
				acm_address,
				acm_add_detail,
				acm_zip,
				acm_checkin_time,
				acm_checkout_time,
				acm_availdate,
				rules
				,amenities
		);
	}

}
