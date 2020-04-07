package com.jsk.stay;

import java.io.PrintWriter;
import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsk.stay.util.Constant;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		Constant.visitN += 1;
		System.out.println(Constant.visitN);
		model.addAttribute("visitN", Constant.visitN);

		return "index";
	}
	
	@RequestMapping("event")
	public void eventEx(HttpServletRequest requeest, HttpServletResponse response) throws Exception {
		response.setContentType("text/event-stream"); //아니면 sse안됨
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		for (int i = 0; i < 20; i++) {
			
			writer.write("event:up_visit\n"); //이벤트 이름을 up_vote
			writer.write("data: " + Constant.visitN + "\n\n"); //up_vote이벤트 값을 나타냄
			
			writer.write("event:up_visitM\n"); //이벤트 이름을 up_vote
			writer.write("data: " + Constant.visitMN + "\n\n"); //up_vote이벤트 값을 나타냄
			writer.flush();
			try {
				Thread.sleep(1000);
			} catch (Exception e){
				e.printStackTrace();
			}
			
		}
		writer.close();
	}
	

}
