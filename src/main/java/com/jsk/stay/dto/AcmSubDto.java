package com.jsk.stay.dto;

public class AcmSubDto {

	private int acm_code;
	private String acm_rule;
	private String acm_amenity;
	
	public AcmSubDto() {
		super();
	}

	public AcmSubDto(int acm_code, String acm_rule, String acm_amenity) {
		super();
		this.acm_code = acm_code;
		this.acm_rule = acm_rule;
		this.acm_amenity = acm_amenity;
	}

	public int getAcm_code() {
		return acm_code;
	}

	public void setAcm_code(int acm_code) {
		this.acm_code = acm_code;
	}

	public String getAcm_rule() {
		return acm_rule;
	}

	public void setAcm_rule(String acm_rule) {
		this.acm_rule = acm_rule;
	}

	public String getAcm_amenity() {
		return acm_amenity;
	}

	public void setAcm_amenity(String acm_amenity) {
		this.acm_amenity = acm_amenity;
	}
	
	

}
