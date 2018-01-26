package com.hitokuse.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnalyticsController {

	@RequestMapping("/")
	public ModelAndView root() throws Exception {
		ModelAndView mav = new ModelAndView("/an/register");
		return mav;
	}
}
