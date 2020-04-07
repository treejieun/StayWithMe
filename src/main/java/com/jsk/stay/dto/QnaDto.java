package com.jsk.stay.dto;

public class QnaDto {

	private int qna_code;
	private String admin_id;
	private String qna_title;
	private String qna_content;
	public QnaDto() {
		super();
	}
	public QnaDto(int qna_code, String admin_id, String qna_title, String qna_content) {
		super();
		this.qna_code = qna_code;
		this.admin_id = admin_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
	}
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	
	
}
