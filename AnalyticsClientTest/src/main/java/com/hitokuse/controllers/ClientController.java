package com.hitokuse.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClientController {

	ModelAndView mav = new ModelAndView("/test");

	@RequestMapping("/")
	public ModelAndView root() throws Exception {
		return mav;
	}

	@RequestMapping("/{path}")
	public ModelAndView test(@PathVariable String path) throws Exception {
		return mav;
	}

	@RequestMapping("/1/{path}")
	public ModelAndView test1(@PathVariable String path) throws Exception {
		return mav;
	}

	@RequestMapping("/2/{path}")
	public ModelAndView test2(@PathVariable String path) throws Exception {
		return mav;
	}
}
