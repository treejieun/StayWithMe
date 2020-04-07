package com.jsk.stay.dto;







public class AccommodationDto {
	
	private String mb_id;
	private int acm_code;
	private String acm_info;
	private int acm_charge;
	private String acm_availdate;
	private String acm_checkin_time;
	private String acm_checkout_time;
	private String acm_type;
	private String acm_room_type;
	private int acm_guest_num;
	private int acm_room_num;
	private int acm_bath_num;
	private int acm_area;
	private String acm_bedding;
	private String acm_address;
	private String acm_add_detail;
	private int acm_zip;
	private String acm_title;
	private String acm_thumbnail;
	
	public String getAcm_thumbnail() {
		return acm_thumbnail;
	}

	public void setAcm_thumbnail(String acm_thumbnail) {
		this.acm_thumbnail = acm_thumbnail;
	}

	public AccommodationDto() {
		super();
	}

	public AccommodationDto(String mb_id, int acm_code, String acm_info, int acm_charge, String acm_availdate,
			String acm_checkin_time, String acm_checkout_time, String acm_type, String acm_room_type, int acm_guest_num,
			int acm_room_num, int acm_bath_num, int acm_area, String acm_bedding, String acm_address,
			String acm_add_detail, int acm_zip, String acm_title, String acm_thumbnail) {
		super();
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.acm_info = acm_info;
		this.acm_charge = acm_charge;
		this.acm_availdate = acm_availdate;
		this.acm_checkin_time = acm_checkin_time;
		this.acm_checkout_time = acm_checkout_time;
		this.acm_type = acm_type;
		this.acm_room_type = acm_room_type;
		this.acm_guest_num = acm_guest_num;
		this.acm_room_num = acm_room_num;
		this.acm_bath_num = acm_bath_num;
		this.acm_area = acm_area;
		this.acm_bedding = acm_bedding;
		this.acm_address = acm_address;
		this.acm_add_detail = acm_add_detail;
		this.acm_zip = acm_zip;
		this.acm_title = acm_title;
		this.acm_thumbnail = acm_thumbnail;
	}
	
	public AccommodationDto(String mb_id, int acm_code, int acm_charge, String acm_availdate, String acm_checkin_time,
			String acm_checkout_time, int acm_guest_num) {
		super();
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.acm_charge = acm_charge;
		this.acm_availdate = acm_availdate;
		this.acm_checkin_time = acm_checkin_time;
		this.acm_checkout_time = acm_checkout_time;
		this.acm_guest_num = acm_guest_num;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getAcm_code() {
		return acm_code;
	}

	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}

	public String getAcm_info() {
		return acm_info;
	}

	public void setAcm_info(String acm_info) {
		this.acm_info = acm_info;
	}

	public int getAcm_charge() {
		return acm_charge;
	}

	public void setAcm_charge(int acm_charge) {
		this.acm_charge = acm_charge;
	}

	public String getAcm_availdate() {
		return acm_availdate;
	}

	public void setAcm_availdate(String acm_availdate) {
		this.acm_availdate = acm_availdate;
	}

	public String getAcm_checkin_time() {
		return acm_checkin_time;
	}

	public void setAcm_checkin_time(String acm_checkin_time) {
		this.acm_checkin_time = acm_checkin_time;
	}

	public String getAcm_checkout_time() {
		return acm_checkout_time;
	}

	public void setAcm_checkout_time(String acm_checkout_time) {
		this.acm_checkout_time = acm_checkout_time;
	}

	public String getAcm_type() {
		return acm_type;
	}

	public void setAcm_type(String acm_type) {
		this.acm_type = acm_type;
	}

	public String getAcm_room_type() {
		return acm_room_type;
	}

	public void setAcm_room_type(String acm_room_type) {
		this.acm_room_type = acm_room_type;
	}

	public int getAcm_guest_num() {
		return acm_guest_num;
	}

	public void setAcm_guest_num(int acm_guest_num) {
		this.acm_guest_num = acm_guest_num;
	}

	public int getAcm_room_num() {
		return acm_room_num;
	}

	public void setAcm_room_num(int acm_room_num) {
		this.acm_room_num = acm_room_num;
	}

	public int getAcm_bath_num() {
		return acm_bath_num;
	}

	public void setAcm_bath_num(int acm_bath_num) {
		this.acm_bath_num = acm_bath_num;
	}

	public int getAcm_area() {
		return acm_area;
	}

	public void setAcm_area(int acm_area) {
		this.acm_area = acm_area;
	}

	public String getAcm_bedding() {
		return acm_bedding;
	}

	public void setAcm_bedding(String acm_bedding) {
		this.acm_bedding = acm_bedding;
	}

	public String getAcm_address() {
		return acm_address;
	}

	public void setAcm_address(String acm_address) {
		this.acm_address = acm_address;
	}

	public String getAcm_add_detail() {
		return acm_add_detail;
	}

	public void setAcm_add_detail(String acm_add_detail) {
		this.acm_add_detail = acm_add_detail;
	}

	public int getAcm_zip() {
		return acm_zip;
	}

	public void setAcm_zip(int acm_zip) {
		this.acm_zip = acm_zip;
	}

	public String getAcm_title() {
		return acm_title;
	}

	public void setAcm_title(String acm_title) {
		this.acm_title = acm_title;
	}
}