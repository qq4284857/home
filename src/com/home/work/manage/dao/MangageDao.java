package com.home.work.manage.dao;

import java.util.List;

import com.home.work.manage.entity.Menu;
import com.home.work.manage.entity.Menu_user;
import com.home.work.user.entity.Home_user;

public interface MangageDao {

	public List<Home_user> searchByUser();

	public int addByInsert(Menu me);

	public Home_user searchUser(String userid);

	public int insertByMU(Menu_user m);

}
