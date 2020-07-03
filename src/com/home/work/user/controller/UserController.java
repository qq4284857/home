package com.home.work.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.home.work.user.entity.Home_user;
import com.home.work.user.service.UserService;
import com.home.work.user.util.CreateMD5;
import com.home.work.user.util.UserByUtil;

@Controller
@RequestMapping(value = "admin")
public class UserController {

	@Autowired
	UserService uservice;

	/**
	 * 登录
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login")
	public String setLogin(Home_user user, HttpServletRequest request,
			HttpServletResponse response) {
		if (!"".equals(user.getUsername()) && user.getUsername() != null) {
			Home_user home = uservice.getLogin(user.getUsername());
			if (home != null) {
				if (home.getFlag() == 0) {
					if (home.getPassword().equals(
							CreateMD5.getMd5(user.getPassword()))) {
						HttpSession session = request.getSession();
						session.setAttribute("username", user.getUsername());
						Cookie cookie = new Cookie("username",
								user.getUsername());
						cookie.setMaxAge(600);
						response.addCookie(cookie);
						return "redirect:/manage/init";
					}
					request.setAttribute("mes", "密码不正确！");
					return "/jsp/user/login";
				} else if (home.getFlag() == 1) {
					if (home.getPassword().equals(
							CreateMD5.getMd5(user.getPassword()))) {
						HttpSession session = request.getSession();
						session.setAttribute("username", user.getUsername());
						Cookie cookie = new Cookie("username",
								user.getUsername());
						cookie.setMaxAge(600);
						response.addCookie(cookie);
						return "redirect:/home/homePag";

					}
					request.setAttribute("mes", "密码不正确！");
					return "/jsp/user/login";
				}

			}
			request.setAttribute("mes", "没有该用户！");
			return "/jsp/user/login";
		}

		return "/jsp/user/login";
	}

	/**
	 * 注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "setRegister", method = RequestMethod.POST)
	public String setRegister(Home_user user, HttpServletRequest request) {
		if (!"".equals(user.getUsername()) && user.getUsername() != null) {
			if (!"".equals(user.getPassword())) {
				user.setPassword(CreateMD5.getMd5(user.getPassword()));
			}
			user.setTime(UserByUtil.getTime());
			int num = uservice.setRegister(user);
			if (num > 0) {
				return "redirect:/admin/success";
			}
		}
		return null;
	}

	/**
	 * 注册成功页面
	 */
	@RequestMapping(value = "success")
	public ModelAndView suessByReg() {
		ModelAndView mv = new ModelAndView("/jsp/user/success");
		return mv;
	}

	/**
	 * 注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "register")
	public ModelAndView getRegByJsp() {
		ModelAndView mv = new ModelAndView("/jsp/user/register");
		return mv;
	}

}
