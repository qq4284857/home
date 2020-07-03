package com.home.work.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="home")
public class HomeController {
	
	/**
	 * 主页
	 * @return
	 */
	@RequestMapping(value="homePag")
	public ModelAndView setHomePag(){
		
		ModelAndView mv=new ModelAndView("jsp/home/homePag");
		
		return mv;
		
	}
	
	/**
	 * 后台页面
	 * @return
	 */
	@RequestMapping(value="manage")
	public ModelAndView setManage(){
		ModelAndView mv=new ModelAndView("jsp/home/manage");
		return mv;
		
	}

}
