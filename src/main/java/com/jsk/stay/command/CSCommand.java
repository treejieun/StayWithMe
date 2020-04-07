package com.jsk.stay.command;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jsk.stay.dto.CSDto;
import com.jsk.stay.dto.Criteria;


public interface CSCommand {
	public ArrayList<CSDto> list2(Criteria cri) throws Exception;
	public List<CSDto> list(Criteria cri) throws Exception;
	public int listCount(String mb_id) throws Exception;
	public ArrayList<CSDto> content(int cs_code) throws Exception;
	public String mbWrite(String mb_id);
	public void mbWritePro(CSDto dto) throws Exception;
	public void mbModifyPro(CSDto dto);
	public void mbDelete(int cs_code);
	public void adReplyPro(CSDto dto);
	public ArrayList<CSDto> reply(int cs_group);
	public void adModifyPro(CSDto dto);
	public void adDelete(int cs_code, int cs_group);
}
