package com.jsk.stay.dao;

import java.util.List;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.Criteria;

public interface AdminArticleDao {

	public List<AccommodationDto> acmArticle(Criteria cri);
	public int acmCount();
}
