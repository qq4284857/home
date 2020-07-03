package com.home.work.menu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.work.menu.dao.MenuDao;
import com.home.work.menu.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	MenuDao menuDao;

	@Override
	public List searchByMenu() {
		// TODO Auto-generated method stub
		return menuDao.searchByMenu();
	}

	@Override
	public List erMenu() {
		// TODO Auto-generated method stub
		return menuDao.erMenu();
	}

}
