package com.hitokuse.controllers;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hitokuse.config.AppServerConfig;
import com.hitokuse.domains.RegisterVo;
import com.hitokuse.etc.Defines;
import com.hitokuse.mappers.RegisterMapper;

@Controller
public class RegisterController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private AppServerConfig config = new AppServerConfig();
	
	@Autowired
	RegisterMapper mapper;
	
	@RequestMapping("/")
	public ModelAndView root() throws Exception {
		ModelAndView mav = new ModelAndView("/an/register");
		return mav;
	}
	
	@PostMapping("/register/post")
	@ResponseBody
	public RegisterVo post(@ModelAttribute @Valid RegisterVo vo) throws Exception {
		RegisterVo result = new RegisterVo();
		int checkRegister = mapper.checkRegister(vo);
		if(checkRegister>0) {
			result.setResult("fail");
			result.setScript("ID/Domain is already exists.");
			return result;
		}
		mapper.insertRegister(vo);
		result.setResult("success");
		String script = 
				Defines.SCRIPT_HEAD_1 + "\n"
				+ String.format(Defines.SCRIPT_1, config.getHost()) + "\n"
				+ String.format(Defines.SCRIPT_2, config.getHost()) + "\n"
				+ String.format(Defines.SCRIPT_3, config.getHost()) + "\n"
				+ String.format(Defines.SCRIPT_4, config.getHost()) + "\n"
				+ Defines.SCRIPT_5 + "\n"
				+ String.format(Defines.SCRIPT_6, vo.getId()) + "\n"
				+ Defines.SCRIPT_7 + "\n"
				+ Defines.SCRIPT_8 + "\n"
				+ Defines.SCRIPT_HEAD_2;
		result.setScript(script);
		return result;
	}
	
}
