package com.jsk.stay.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jsk.stay.dao.AcmDao;

public class AcmWriteCommand implements AcmCommand {

	@Override
	public void execute(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		System.out.println("커맨드클래스의 엑스큐트 메서드 안 ok");
		
		String mb_id = request.getParameter("mb_id");
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
		/*
		String infant = request.getParameter("infant");
		String child = request.getParameter("child");
		String pet = request.getParameter("pet");
		String smoking = request.getParameter("smoking");
		String party = request.getParameter("party");
		String commercial = request.getParameter("commercial");

		String acm_rule = */
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
		/*
		String ame_wifi           = request.getParameter("ame_wifi");
		String ame_tv             = request.getParameter("ame_tv");
		String ame_kitchen        = request.getParameter("ame_kitchen");
		String ame_aircon         = request.getParameter("ame_aircon");
		String ame_room_lock      = request.getParameter("ame_room_lock");
		String ame_towel          = request.getParameter("ame_towel");
		String ame_washer         = request.getParameter("ame_washer");
		String ame_dryer          = request.getParameter("ame_dryer");
		String ame_shower         = request.getParameter("ame_shower");
		String ame_hair_dryer     = request.getParameter("ame_hair_dryer");
		String ame_fan            = request.getParameter("ame_fan");
		String ame_extinguisher   = request.getParameter("ame_extinguisher");
		String ame_balcony        = request.getParameter("ame_balcony");
		String ame_garden         = request.getParameter("ame_garden");
		String ame_heater         = request.getParameter("ame_heater");
		String ame_infodesk       = request.getParameter("ame_infodesk");
		String ame_breakfast      = request.getParameter("ame_breakfast");
		String ame_bbq            = request.getParameter("ame_bbq");
		String ame_park           = request.getParameter("ame_park");*/
		
		String[] rules = request.getParameterValues("acm_rule");
		String[] amenities = request.getParameterValues("acm_amenity");
		
		String acm_thumbnail = (String) map.get("fileName");
		
		AcmDao dao = new AcmDao();
		dao.write(
				mb_id,
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
				,acm_thumbnail
		);
	}

}
