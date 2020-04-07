package com.jsk.stay.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsk.stay.dto.CSDto;
import com.jsk.stay.dto.Criteria;

@Repository
public class CSDaoImp implements CSDao {
	@Autowired
	private SqlSession sql;
	
	public ArrayList<CSDto> list2(Criteria cri) throws Exception {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.list2", cri);
		System.out.println(result);
		return result;
	}
	
	public List<CSDto> list(Criteria cri) throws Exception {
		return sql.selectList("cs.listPage", cri);
	}
	
	public int listCount(String mb_id) throws Exception {
		return sql.selectOne("cs.listCount", mb_id);
	}
	
	public ArrayList<CSDto> content(int cs_code) throws Exception {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.content", cs_code);
		System.out.println("¿©±â±îÁö");
		System.out.println(result);
		return result;
	}
	
	public String mbWrite(String mb_id) {
		String mb_name = sql.selectOne("cs.mbWrite", mb_id);
		return mb_name;
	}
	
	public void mbWritePro(CSDto dto) throws Exception {
		System.out.println("µÆ³ª?2");
		sql.insert("cs.mbWritePro", dto);
		System.out.println("µÆ³ª?3");
	}
	
	public void mbModifyPro(CSDto dto) {
		//CSDto dto = new CSDto(cs_code, cs_title, cs_content);
		sql.update("cs.mbModifyPro", dto);

	}
	
	public void mbDelete(int cs_code) {
		sql.delete("cs.mbDelete", cs_code);
	}
	
	public void adReplyPro(CSDto dto) {
		sql.insert("cs.adReplyPro", dto);
		sql.update("cs.adReplyPro2", dto);
	}
	
	public ArrayList<CSDto> reply(int cs_group) {
		ArrayList<CSDto> result = (ArrayList) sql.selectList("cs.reply", cs_group);
		return result;
	}
	
	public void adModifyPro(CSDto dto) {
		sql.update("cs.adModifyPro", dto);
	}
	
	public void adDelete(int cs_code, int cs_group) {
		sql.delete("cs.adDelete", cs_code);
		sql.update("cs.adDelete2", cs_group);
	}
}
