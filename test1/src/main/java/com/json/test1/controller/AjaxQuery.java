package com.json.test1.controller;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AjaxQuery {
	@RequestMapping("/ajax")
	public ModelAndView helloAjaxTest(){
		return new ModelAndView("ajax", "message", 
				"Crunchify Spring MVC with Ajax and JQuery Demo..");
	}
	
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	public @ResponseBody String getTime(){
		Random rand = new Random();
		float r = rand.nextFloat();
		String result = "Next Random # is <b>" + r + "</b>. Generated on <b>" + new Date().toString() + "</b>";
		
		return result;
	}
}
