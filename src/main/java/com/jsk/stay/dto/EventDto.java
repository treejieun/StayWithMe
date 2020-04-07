package com.jsk.stay.dto;

import java.sql.Timestamp;

public class EventDto {

	private int ev_code;
	private String admin_id;
	private String ev_title;
	private String ev_content;
	private Timestamp ev_date;
	public EventDto() {
		super();
	}
	public EventDto(int ev_code, String admin_id, String ev_title, String ev_content, Timestamp ev_date) {
		super();
		this.ev_code = ev_code;
		this.admin_id = admin_id;
		this.ev_title = ev_title;
		this.ev_content = ev_content;
		this.ev_date = ev_date;
	}
	public int getEv_code() {
		return ev_code;
	}
	public void setEv_code(int ev_code) {
		this.ev_code = ev_code;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getEv_title() {
		return ev_title;
	}
	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}
	public String getEv_content() {
		return ev_content;
	}
	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}
	public Timestamp getEv_date() {
		return ev_date;
	}
	public void setEv_date(Timestamp ev_date) {
		this.ev_date = ev_date;
	}
}
