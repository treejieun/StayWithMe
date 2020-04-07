package com.jsk.stay.dao;

import java.util.List;
import java.util.Map;

public interface AdminMainDao {
	public int totalMember();
	public int totalACM();
	public int womanCount();
	public int manCount();
	public int guestCount();
	public int hostCount();
	public List<Map<String, String>> month();
	public List<Map<String, String>> local();
}
