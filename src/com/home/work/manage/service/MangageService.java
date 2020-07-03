package com.home.work.manage.service;

import java.util.List;

import com.home.work.manage.entity.Menu;
import com.home.work.user.entity.Home_user;

public interface MangageService {

	public List<Home_user> searchByUser();

	public int addByInsert(Menu me,String id);

}
