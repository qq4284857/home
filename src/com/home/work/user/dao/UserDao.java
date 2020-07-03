package com.home.work.user.dao;

import com.home.work.user.entity.Home_user;

public interface UserDao {

	public int setRegister(Home_user user);

	public Home_user getLogin(String username);

}
