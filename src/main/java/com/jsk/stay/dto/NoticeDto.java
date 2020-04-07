package com.jsk.stay.dto;

import java.sql.Timestamp;

public class NoticeDto {
	private int no_code;
	private String admin_id;
	private String no_title;
	private String no_content;
	private Timestamp no_date;
	public NoticeDto(int no_code, String admin_id, String no_title, String no_content, Timestamp no_date) {
		super();
		this.no_code = no_code;
		this.admin_id = admin_id;
		this.no_title = no_title;
		this.no_content = no_content;
		this.no_date = no_date;
	}
	public NoticeDto() {
		super();
	}
	public int getNo_code() {
		return no_code;
	}
	public void setNo_code(int no_code) {
		this.no_code = no_code;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Timestamp getNo_date() {
		return no_date;
	}
	public void setNo_date(Timestamp no_date) {
		this.no_date = no_date;
	}
	
	
}