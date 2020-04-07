package com.jsk.stay.dto;

import java.sql.Timestamp;

import com.jsk.stay.dao.LoginDao;
import com.jsk.stay.util.Constant;

public class MemberDto {
	private String mb_id;
	private String mb_pwd;
	private String mb_name;
	private String mb_birthdate;
	private char mb_sex;
	private String mb_email;
	private String mb_phone;
	private Timestamp mb_join_date;
	private Timestamp mb_delete_date;
	private String mb_temppwd;
	private String mb_profile;
	private String mb_grade;
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pwd() {
		return mb_pwd;
	}
	public void setMb_pwd(String mb_pwd) {
		this.mb_pwd = mb_pwd;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_birthdate() {
		return mb_birthdate;
	}
	public void setMb_birthdate(String mb_birthdate) {
		this.mb_birthdate = mb_birthdate;
	}
	public char getMb_sex() {
		return mb_sex;
	}
	public void setMb_sex(char mb_sex) {
		this.mb_sex = mb_sex;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public Timestamp getMb_join_date() {
		return mb_join_date;
	}
	public void setMb_join_date(Timestamp mb_join_date) {
		this.mb_join_date = mb_join_date;
	}
	public Timestamp getMb_delete_date() {
		return mb_delete_date;
	}
	public void setMb_delete_date(Timestamp mb_delete_date) {
		this.mb_delete_date = mb_delete_date;
	}
	public String getMb_temppwd() {
		return mb_temppwd;
	}
	public void setMb_temppwd(String mb_temppwd) {
		this.mb_temppwd = mb_temppwd;
	}
	public String getMb_profile() {
		return mb_profile;
	}
	public void setMb_profile(String mb_profile) {
		this.mb_profile = mb_profile;
	}
	public String getMb_grade() {
		return mb_grade;
	}
	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}
	public MemberDto(String mb_id, String mb_pwd, String mb_name, String mb_birthdate, char mb_sex, String mb_phone,
			String mb_email, Timestamp mb_join_date, Timestamp mb_delete_date, String mb_temppwd, String mb_profile,
			String mb_grade) {
		super();
		this.mb_id = mb_id;
		this.mb_pwd = mb_pwd;
		this.mb_name = mb_name;
		this.mb_birthdate = mb_birthdate;
		this.mb_sex = mb_sex;
		this.mb_phone = mb_phone;
		this.mb_email = mb_email;
		this.mb_join_date = mb_join_date;
		this.mb_delete_date = mb_delete_date;
		this.mb_temppwd = mb_temppwd;
		this.mb_profile = mb_profile;
		this.mb_grade = mb_grade;
	}
	public MemberDto() {
		super();
	}
	public MemberDto(String mb_id, String mb_pwd, String mb_email, String mb_phone) {
		super();
		this.mb_id = mb_id;
		this.mb_pwd = mb_pwd;
		this.mb_email = mb_email;
		this.mb_phone = mb_phone;
	}
	
	
	
}
