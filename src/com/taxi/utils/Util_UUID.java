package com.taxi.utils;

import java.util.UUID;


/**
 * 获取唯一的 ID、长度32位
 * @author WJXL-丁丁
 * @date 2016年5月17日 下午3:50:07
 *
 */
public class Util_UUID {

	
	public static String getToken(String userID){
		String uuid=UUID.randomUUID().toString().trim().replaceAll("-", "");
		long time=System.currentTimeMillis();
		String token=MD5.md5(uuid+userID+time);
		
		return token;
	}	
}
