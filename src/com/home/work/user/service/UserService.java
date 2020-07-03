package com.home.work.user.service;

import com.home.work.user.entity.Home_user;

public interface UserService {

	public int setRegister(Home_user user);

	public Home_user getLogin(String username);
}
