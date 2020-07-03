package com.home.work.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.home.work.manage.entity.Menu;
import com.home.work.manage.service.MangageService;
import com.home.work.user.entity.Home_user;
import com.home.work.user.service.UserService;
import com.home.work.user.util.UserByUtil;

@Controller
@RequestMapping(value = "manage")
public class ManageController {
	@Autowired
	UserService userService;
	@Autowired
	MangageService manageService;

	/**
	 * 主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "init")
	public ModelAndView init() {
		ModelAndView mv = new ModelAndView("jsp/manage/manage");
		return mv;
	}

	/**
	 * 主页菜单
	 */
	@RequestMapping(value = "pag")
	public ModelAndView setPag() {
		ModelAndView mv = new ModelAndView("jsp/manage/pagManage");
		return mv;
	}

	/**
	 * 查询用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "searchByUser")
	@ResponseBody
	public Map searchByUser(HttpServletRequest request) {
		Map map = new HashMap();
		HttpSession session = request.getSession();
		// 拿到当前登录的用�?
		String username = (String) session.getAttribute("username");
		Home_user user = userService.getLogin(username);
		if (user != null) {
			if (user.getFlag() == 0) {
				List<Home_user> list=manageService.searchByUser();
				if(list.size()!=0){
					map.put("res", list);
					return map;
				}
			}
			map.put("res", 1);// 当前用户没有权限
			return map;
		}
		map.put("res", 0);// 没有该用�?
		return map;
	}
	
	/**
	 * 菜单数据提交
	 */
	@RequestMapping(value="addByInser")
	@ResponseBody
	public Map addByInsert(Menu me,HttpServletRequest request){
		Map map=new HashMap();
		me.setTime(UserByUtil.getTime());
		UUID uuid=UUID.randomUUID();
		String id=uuid.toString().replace("-", "");
		me.setId(id);
		if(me.getMark()==1){
			me.setEr_menu("1");
		}else if(me.getMark()==0){
			me.setEr_menu(me.getMenu());
		}
		int num=manageService.addByInsert(me,id);
		map.put("res", num);
		return map;
	}

}
