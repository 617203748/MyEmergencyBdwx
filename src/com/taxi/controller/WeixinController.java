package com.taxi.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.LocationEvent;
import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
import com.github.sd4324530.fastweixin.message.req.VoiceReqMsg;
import com.github.sd4324530.fastweixin.servlet.WeixinControllerSupport;
import com.taxi.service.UserService;
import com.taxi.utils.LatLng;
import com.taxi.utils.Util_ChangeLocation;

@SuppressWarnings("deprecation")
@RestController
@ResponseBody
@RequestMapping("/weixin")
public class WeixinController extends WeixinControllerSupport {

	private static final String TOKEN = "calltaxi_nanpi";
	private static final String AppID = "wxf040a3da8cd0a342";
	private static final String AppSecret = "6d4406f4ba38c88d812d70f8951593bb";

	private static final Logger logger = Logger.getLogger(WeixinController.class);

	@Autowired
	private UserService userService;

	// 设置TOKEN，用于绑定微信服务器
	@Override
	protected String getToken() {
		logger.info("getToken");
		return TOKEN;
	}

	// 使用安全模式时设置：APPID
	// 不再强制重写，有加密需要时自行重写该方法
	@Override
	protected String getAppId() {
		logger.info("getAppId");
		return null;
	}

	// 使用安全模式时设置：密钥
	// 不再强制重写，有加密需要时自行重写该方法
	@Override
	protected String getAESKey() {
		logger.info("getAESKey");
		return null;
	}

	// 重写父类方法，处理对应的微信消息
	@Override
	protected BaseMsg handleTextMsg(TextReqMsg msg) {
		String content = msg.getContent();
		logger.info("");
		logger.info("用户发送到服务器--->文本内容");
		logger.info("ToUserName:" + msg.getToUserName());
		logger.info("FromUserName:" + msg.getFromUserName());
		logger.info("CreateTime:" + msg.getCreateTime());
		logger.info("MsgType:" + msg.getMsgType());
		logger.info("Content:" + msg.getContent());
		logger.info("MsgId:" + msg.getMsgId());

		return new TextMsg("Server 收到文本消息：" + msg.getContent());
	}

	@SuppressWarnings("resource")
	@Override
	protected BaseMsg handleLocationEvent(LocationEvent event) {
		logger.info("");
		logger.info("用户发送到服务器--->位置信息");
		logger.info("ToUserName:" + event.getToUserName());
		logger.info("FromUserName:" + event.getFromUserName());
		logger.info("CreateTime:" + event.getCreateTime());
		logger.info("MsgType:" + event.getMsgType());
		logger.info("Event:" + event.getEvent());
		logger.info("Latitude:" + event.getLatitude());
		logger.info("Longitude:" + event.getLongitude());
		logger.info("Precision:" + event.getPrecision());

		LatLng latLng = Util_ChangeLocation.transformFromWGSToGCJ(new LatLng(Double.valueOf(event.getLongitude()), Double.valueOf(event.getLatitude())));

		String lon = latLng.getLatitude() + "";
		String lat = latLng.getLongitude() + "";

		return new TextMsg("Server 收到位置消息：" + lat + "  " + lon);

		// return super.handleLocationEvent(event);
	}

	@SuppressWarnings({ "resource" })
	@Override
	protected BaseMsg handleVoiceMsg(VoiceReqMsg msg) {
		logger.info("");
		logger.info("用户发送到服务器--->语音内容");
		logger.info("ToUserName:" + msg.getToUserName());
		logger.info("FromUserName:" + msg.getFromUserName());
		logger.info("CreateTime:" + msg.getCreateTime());
		logger.info("MsgType:" + msg.getMsgType());
		logger.info("MediaId:" + msg.getMediaId());
		logger.info("Format:" + msg.getFormat());
		logger.info("MsgId:" + msg.getMsgId());

		return new TextMsg("Server 收到语音消息：" + msg.getMsgId());
	}

}
