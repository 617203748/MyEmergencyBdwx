package com.taxi.utils;

import java.security.MessageDigest;

public class MD5 {

	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return str;
	}

	/**
	 * 密码加密
	 * 
	 * @param password
	 * @param salt
	 * @return
	 */
	public static String getMD5PassWord(String password, String salt) {
		String pwd = md5(password + salt);
		return pwd;
	}
}
