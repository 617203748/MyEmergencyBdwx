package com.taxi.base;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;

public class BaseContrller {

	protected Logger logger = Logger.getLogger(this.getClass());

	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

		return request;
	}

	/**
	 * 获取项目所在的路径
	 * 
	 * @return
	 */
	public String getRealPath() {
		String path = this.getRequest().getSession().getServletContext().getRealPath("/");
		return path;
	}

	public JSONObject getJsonObject() {
		return new JSONObject();
	}
}
