package com.home.work.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.work.user.dao.UserDao;
import com.home.work.user.entity.Home_user;
import com.home.work.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;

	@Override
	public int setRegister(Home_user user) {
		// TODO Auto-generated method stub
		return userDao.setRegister(user);
	}

	@Override
	public Home_user getLogin(String username) {
		// TODO Auto-generated method stub
		return userDao.getLogin(username);
	}

}
