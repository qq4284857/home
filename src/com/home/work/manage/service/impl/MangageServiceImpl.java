package com.home.work.manage.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.work.manage.dao.MangageDao;
import com.home.work.manage.entity.Menu;
import com.home.work.manage.entity.Menu_user;
import com.home.work.manage.service.MangageService;
import com.home.work.user.entity.Home_user;

@Service
public class MangageServiceImpl implements MangageService{
	@Autowired
	MangageDao manageDao;

	@Override
	public List<Home_user> searchByUser() {
		// TODO Auto-generated method stub
		return manageDao.searchByUser();
	}

	@Override
	public int addByInsert(Menu me,String id) {
		UUID uuid=UUID.randomUUID();
		String menuid=uuid.toString().replace("-", "");
		me.setId(menuid);
		Home_user user=manageDao.searchUser(me.getUserid());
		int num=manageDao.addByInsert(me);
		int sta=0;
		if(num>0){
			Menu_user m=new Menu_user();
			m.setId(id);
			m.setUserid(user.getId());
			m.setMenuid(menuid);
			m.setPower(1);
			m.setSturts(me.getMark());
			m.setFlag(1);
			sta=manageDao.insertByMU(m);
		}
		
		return sta;
	}

}
