package com.hitokuse.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hitokuse.domains.AnalyticsVo;
import com.hitokuse.mappers.AnalyticsMapper;

@Controller
@RequestMapping("/an")
public class AnalyticsController {

	@Autowired
	AnalyticsMapper mapper;
	
	@PostMapping("/addpv")
	@ResponseBody
	public AnalyticsVo insertPV(@ModelAttribute @Valid AnalyticsVo vo) throws Exception {
		mapper.insertPv(vo);
		AnalyticsVo result = new AnalyticsVo();
		result.setResult("ok");
		return result;
	}
	
	@RequestMapping("/")
	public ModelAndView root() throws Exception {
		ModelAndView mav = new ModelAndView("/an/analytics");
		return mav;
	}
	
	@RequestMapping("/total")
	@ResponseBody
	public AnalyticsVo getTotalPv(@ModelAttribute @Valid AnalyticsVo vo) throws Exception {
		return mapper.getTotalPv(vo);
	}
	
	
	@RequestMapping("/chart1")
	@ResponseBody
	public List<AnalyticsVo> getChart1(@ModelAttribute @Valid AnalyticsVo vo) throws Exception {
		return mapper.getChart1(vo);
	}
	
	@RequestMapping("/chart2")
	@ResponseBody
	public List<AnalyticsVo> getChart2(@ModelAttribute @Valid AnalyticsVo vo) throws Exception {
		return mapper.getChart2(vo);
	}
}
