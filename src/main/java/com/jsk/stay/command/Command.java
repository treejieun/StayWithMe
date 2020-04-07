package com.jsk.stay.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Command {
	public void execute(Model model,HttpServletRequest request); 
}