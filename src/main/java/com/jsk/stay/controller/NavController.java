package com.jsk.stay.controller;

import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavController {
	
	@RequestMapping("/wishList")
	public String wishList() {
		return "wishList";
	}
	
	@RequestMapping("/header")
	public String header() {
		return "common/header";
	}
	
	@RequestMapping("/footer")
	public String footer() {
		return "common/footer";
	}

}
