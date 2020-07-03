package com.home.work.user.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CreateMD5 {

	//md5 鎺ユ敹涓�釜鍙傛�?
	public static String getMd5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 锟斤拷锟斤拷
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int c;

			StringBuffer buf = new StringBuffer("");
			for (int i = 0; i < b.length; i++) {
				c = b[i];
				if (c < 0)
					c += 256;
				if (c < 16)
					buf.append("0");
				buf.append(Integer.toHexString(c));
			}

			// 32位锟斤拷锟斤�?
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}

	}

}