package com.jsk.stay.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.AdminArticleDao;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.Criteria;

@Service
public class AdminArticleCommandImp implements AdminArticleCommand {

	@Autowired
	private AdminArticleDao dao;
	
	public List<AccommodationDto> acmArticle(Criteria cri) {
		return dao.acmArticle(cri);
	}
	
	public int acmCount() {
		return dao.acmCount();
	}
}
