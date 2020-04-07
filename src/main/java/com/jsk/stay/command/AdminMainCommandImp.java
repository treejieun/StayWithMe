package com.jsk.stay.command;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsk.stay.dao.AdminMainDao;


@Service
public class AdminMainCommandImp implements AdminMainCommand {

	@Autowired
	private AdminMainDao dao;
	
	public int totalMember() {
		return dao.totalMember();
	}
	
	public int totalACM() {
		return dao.totalACM();
	}
	
	public int womanCount() {
		return dao.womanCount();
	}
	
	public int manCount() {
		return dao.manCount();
	}
	
	public int guestCount() {
		return dao.guestCount();
	}
	
	public int hostCount() {
		return dao.hostCount();
	}
	
	public List<Map<String, String>> month() {
		return dao.month();
	}
	
	public List<Map<String, String>> local() {
		return dao.local();
	}
}
