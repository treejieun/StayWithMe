package com.jsk.stay.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ReservationDto {
	private String res_code;
	private String mb_id;
	private int acm_code;
	private String res_pay_method;
	private int res_amount;
	private Timestamp res_pay_date;
	private int res_guest_num;
	private String res_checkin_date;
	private String res_checkout_date;
	private boolean res_confirm;
	private String acm_title;
	private String acm_address;
	private String acm_add_detail;
	private String card_name;
	
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
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
	public String getRes_pay_method() {
		return res_pay_method;
	}
	public void setRes_pay_method(String res_pay_method) {
		this.res_pay_method = res_pay_method;
	}
	public int getRes_amount() {
		return res_amount;
	}
	public void setRes_amount(int res_amount) {
		this.res_amount = res_amount;
	}
	public Timestamp getRes_pay_date() {
		return res_pay_date;
	}
	public void setRes_pay_date(Timestamp res_pay_date) {
		this.res_pay_date = res_pay_date;
	}
	public int getRes_guest_num() {
		return res_guest_num;
	}
	public void setRes_guest_num(int res_guest_num) {
		this.res_guest_num = res_guest_num;
	}
	public String getRes_checkin_date() {
		return res_checkin_date;
	}
	public void setRes_checkin_date(String res_checkin_date) {
		this.res_checkin_date = res_checkin_date;
	}
	public String getRes_checkout_date() {
		return res_checkout_date;
	}
	public void setRes_checkout_date(String res_checkout_date) {
		this.res_checkout_date = res_checkout_date;
	}
	public boolean isRes_confirm() {
		return res_confirm;
	}
	public void setRes_confirm(boolean res_confirm) {
		this.res_confirm = res_confirm;
	}
	
	public String getAcm_title() {
		return acm_title;
	}
	public void setAcm_title(String acm_title) {
		this.acm_title = acm_title;
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
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	
	public ReservationDto(String res_code, String mb_id, int acm_code, String res_pay_method, int res_amount,
			Timestamp res_pay_date, int res_guest_num, String res_checkin_date, String res_checkout_date,
			boolean res_confirm, String acm_title, String acm_address, String acm_add_detail, String card_name) {
		super();
		this.res_code = res_code;
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.res_pay_method = res_pay_method;
		this.res_amount = res_amount;
		this.res_pay_date = res_pay_date;
		this.res_guest_num = res_guest_num;
		this.res_checkin_date = res_checkin_date;
		this.res_checkout_date = res_checkout_date;
		this.res_confirm = res_confirm;
		this.acm_title = acm_title;
		this.acm_address = acm_address;
		this.acm_add_detail = acm_add_detail;
		this.card_name = card_name;
	}
	public ReservationDto() {
		super();
	}
	public ReservationDto(String res_code, String mb_id, int acm_code, String res_pay_method, int res_amount,
			int res_guest_num, String res_checkin_date, String res_checkout_date, String acm_title, String acm_address,
			String acm_add_detail, String card_name) {
		super();
		this.res_code = res_code;
		this.mb_id = mb_id;
		this.acm_code = acm_code;
		this.res_pay_method = res_pay_method;
		this.res_amount = res_amount;
		this.res_guest_num = res_guest_num;
		this.res_checkin_date = res_checkin_date;
		this.res_checkout_date = res_checkout_date;
		this.acm_title = acm_title;
		this.acm_address = acm_address;
		this.acm_add_detail = acm_add_detail;
		this.card_name = card_name;
	}
	
	
}
