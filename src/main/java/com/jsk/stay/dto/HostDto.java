package com.jsk.stay.dto;

public class HostDto {

	private String mb_id;
	private String ho_address;
	private String ho_add_detail;
	private int ho_zip;
	private String ho_account;
	private String ho_acc_num;
	
	public HostDto() {
	}
	
	public HostDto(String mb_id, String ho_address, String ho_add_detail, int ho_zip, String ho_account,
			String ho_acc_num) {
		super();
		this.mb_id = mb_id;
		this.ho_address = ho_address;
		this.ho_add_detail = ho_add_detail;
		this.ho_zip = ho_zip;
		this.ho_account = ho_account;
		this.ho_acc_num = ho_acc_num;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getHo_address() {
		return ho_address;
	}

	public void setHo_address(String ho_address) {
		this.ho_address = ho_address;
	}

	public String getHo_add_detail() {
		return ho_add_detail;
	}

	public void setHo_add_detail(String ho_add_detail) {
		this.ho_add_detail = ho_add_detail;
	}

	public int getHo_zip() {
		return ho_zip;
	}

	public void setHo_zip(int ho_zip) {
		this.ho_zip = ho_zip;
	}

	public String getHo_account() {
		return ho_account;
	}

	public void setHo_account(String ho_account) {
		this.ho_account = ho_account;
	}

	public String getHo_acc_num() {
		return ho_acc_num;
	}

	public void setHo_acc_num(String ho_acc_num) {
		this.ho_acc_num = ho_acc_num;
	}
	
	
}
