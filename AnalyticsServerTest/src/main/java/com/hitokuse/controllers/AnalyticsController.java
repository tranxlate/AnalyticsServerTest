package com.hitokuse.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hitokuse.domains.RegisterVo;
import com.hitokuse.mappers.RegisterMapper;

@Controller
public class AnalyticsController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	RegisterMapper mapper;
	
	@RequestMapping("/")
	public ModelAndView root() throws Exception {
		ModelAndView mav = new ModelAndView("/an/register");
		return mav;
	}
	
	@PostMapping("/register/post")
	@ResponseBody
	public RegisterVo post(RegisterVo vo) throws Exception {
		RegisterVo result = new RegisterVo();
		int checkRegister = mapper.checkRegister(vo);
		if(checkRegister>0) {
			result.setResult("fail");
			result.setScript("ID/Domain is already exists.");
			return result;
		}
		mapper.insertRegister(vo);
		result.setResult("success");
		result.setScript("test");
		return result;
	}
}
