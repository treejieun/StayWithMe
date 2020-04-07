package com.jsk.stay.command;

import java.util.List;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.Criteria;

public interface AdminArticleCommand {
	
	public List<AccommodationDto> acmArticle(Criteria cri);
	public int acmCount();
}
