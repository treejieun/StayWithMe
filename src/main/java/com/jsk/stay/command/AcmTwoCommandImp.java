package com.jsk.stay.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.AcmTwoDao;
import com.jsk.stay.dao.AcmTwoDaoImp;
import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.AcmSubDto;
import com.jsk.stay.dto.CriteriaAcm;

@Service
public class AcmTwoCommandImp implements AcmTwoCommand {
	
	@Autowired
	private AcmTwoDao dao;
	
	public List<AccommodationDto> acmList(CriteriaAcm cri, String location) {
		return dao.acmList(cri, location);
	}
	
	public int acmListCount(String location) {
		return dao.acmListCount(location);
	}
	
	public List<AccommodationDto> accommodation(int acm_code) {
		return dao.accommodation(acm_code);
	}
	public List<AcmSubDto> amenity(int acm_code) {
		return dao.amenity(acm_code);
	}
	
	public List<AcmSubDto> rule(int acm_code) {
		return dao.rule(acm_code);
	}
}
