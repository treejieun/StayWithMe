package com.jsk.stay.dto;

public class ReviewDto {

	private int acm_code;
	private String mb_id;
	private String rev_comment;
	private String rev_img;
	private double rev_star;
	public ReviewDto(int acm_code, String mb_id, String rev_comment, String rev_img, double rev_star) {
		super();
		this.acm_code = acm_code;
		this.mb_id = mb_id;
		this.rev_comment = rev_comment;
		this.rev_img = rev_img;
		this.rev_star = rev_star;
	}
	public ReviewDto() {
		super();
	}
	public int getAcm_code() {
		return acm_code;
	}
	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getRev_comment() {
		return rev_comment;
	}
	public void setRev_comment(String rev_comment) {
		this.rev_comment = rev_comment;
	}
	public String getRev_img() {
		return rev_img;
	}
	public void setRev_img(String rev_img) {
		this.rev_img = rev_img;
	}
	public double getRev_star() {
		return rev_star;
	}
	public void setRev_star(double rev_star) {
		this.rev_star = rev_star;
	}
	
	
}
