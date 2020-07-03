package com.home.work.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.work.menu.service.MenuService;

@Controller
@RequestMapping(value="menu")
public class MenuController {
	@Autowired
	MenuService menuService;
	
	
	@RequestMapping(value="menu")
	@ResponseBody
	public List searchByMenu(HttpServletRequest request){
		
		List list=menuService.searchByMenu();
	
		return list;
		
	}
	/**
	 * 查询二级菜单
	 */
	@RequestMapping(value="erMenu")
	@ResponseBody
	public List erMenu(){
		
		List list=menuService.erMenu();
		return list;
	}

}
