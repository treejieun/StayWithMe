package com.jsk.stay.dto;

import java.sql.Timestamp;

public class CSDto {
	private int cs_code;
	private String mb_name;
	private String mb_id;
	private String cs_title;
	private String cs_content;
	private Timestamp cs_date;
	private int cs_group;
	private char cs_complete;
	
	public CSDto() {
		super();
	}
	public CSDto(int cs_code, String cs_title, String cs_content) {
		super();
		this.cs_code = cs_code;
		this.cs_title = cs_title;
		this.cs_content = cs_content;
	}

	public CSDto(int cs_code, String mb_name, String mb_id, String cs_title, String cs_content, Timestamp cs_date,
			int cs_group, char cs_complete) {
		super();
		this.cs_code = cs_code;
		this.mb_name = mb_name;
		this.mb_id = mb_id;
		this.cs_title = cs_title;
		this.cs_content = cs_content;
		this.cs_date = cs_date;
		this.cs_group = cs_group;
		this.cs_complete = cs_complete;
	}

	public int getCs_code() {
		return cs_code;
	}

	public void setCs_code(int cs_code) {
		this.cs_code = cs_code;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getCs_title() {
		return cs_title;
	}

	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}

	public String getCs_content() {
		return cs_content;
	}

	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}

	public Timestamp getCs_date() {
		return cs_date;
	}

	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}

	public int getCs_group() {
		return cs_group;
	}

	public void setCs_group(int cs_group) {
		this.cs_group = cs_group;
	}

	public char getCs_complete() {
		return cs_complete;
	}

	public void setCs_complete(char cs_complete) {
		this.cs_complete = cs_complete;
	}
	
	
}