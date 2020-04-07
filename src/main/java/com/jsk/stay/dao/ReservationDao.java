package com.jsk.stay.dao;

import java.util.List;

import com.jsk.stay.dto.AccommodationDto;
import com.jsk.stay.dto.ReservationDto;

public interface ReservationDao {

	public AccommodationDto reservation(int acm_code) throws Exception;
	public void reservationIn(ReservationDto dto);
	public List<ReservationDto> reservationList(String mb_id) throws Exception;
	public ReservationDto resReceipt(String res_code) throws Exception;
	public String resAcmDate(int acm_code) throws Exception;
	public void reservationAcm(AccommodationDto dto);
}
