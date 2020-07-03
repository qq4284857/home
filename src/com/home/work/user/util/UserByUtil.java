package com.home.work.user.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserByUtil {
	
	
	//获取当前时间
	public static String getTime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

}
