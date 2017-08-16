package com.system.rongyun;

import io.rong.base.RongCloud;
import io.rong.messages.TxtMessage;
import io.rong.messages.VoiceMessage;
import io.rong.models.CodeSuccessReslut;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.taxi.base.ZConstants;

/**
 * 异步推送
 */
@Component
public class ZAsyncPush {

	private Logger logger = Logger.getLogger(ZAsyncPush.class);
	private String timeLogs = new SimpleDateFormat("HH:mm:ss:SSS").format(new Date());

	/**
	 * 循环给个人发送文本消息
	 */
	@SuppressWarnings("static-access")
	@Async
	public CodeSuccessReslut pushDeviceTextAll(String title, String content, List<String> list) {

		CodeSuccessReslut result = null;
		try {
			RongCloud rongCloud = RongCloud.getInstance(ZConstants.RONGYUN_APP_KEY, ZConstants.RONGYUN_APP_SECRET);
			TxtMessage txtMessage = new TxtMessage("TxtMessage", content);
			result = rongCloud.message.publishPrivate(ZConstants.RONGYUN_SERVER, list, txtMessage, null, null, null, 0, 0, 0);

			logger.info("title=" + title + "  publishMessage=" + result + " " + timeLogs + " 推送人数：" + list.size());

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("title=" + title + "  publishMessage=" + result + " " + timeLogs + " 推送人数：" + list.size());
		}

		return result;
	}

	/**
	 * 循环给个人发送语音消息
	 */
	@SuppressWarnings("static-access")
	@Async
	public CodeSuccessReslut pushDeviceVoiceAll(String title, String base64, String extras, List<String> list) {

		CodeSuccessReslut result = null;
		try {
			RongCloud rongCloud = RongCloud.getInstance(ZConstants.RONGYUN_APP_KEY, ZConstants.RONGYUN_APP_SECRET);
			VoiceMessage voiceMessage = new VoiceMessage(base64, extras, 20l);
			result = rongCloud.message.publishPrivate(ZConstants.RONGYUN_SERVER, list, voiceMessage, null, null, null, 0, 0, 0);

			logger.info("title=" + title + "  publishMessage=" + result + " " + timeLogs + " 推送人数：" + list.size());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("title=" + title + "  publishMessage=" + result + " " + timeLogs);
		}

		return result;
	}

	/**
	 * 给群组发送文本消息
	 */
	@SuppressWarnings("static-access")
	@Async
	public CodeSuccessReslut pushGroupTextAll(String title, String content, String[] groups) {

		CodeSuccessReslut result = null;
		try {
			RongCloud rongCloud = RongCloud.getInstance(ZConstants.RONGYUN_APP_KEY, ZConstants.RONGYUN_APP_SECRET);

			TxtMessage txtMessage = new TxtMessage("TxtMessage", content);
			result = rongCloud.message.publishGroup(ZConstants.RONGYUN_SERVER, groups, txtMessage, null, null, 0, 0);

			logger.info("推送群组：" + title + " " + result.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("推送群组：" + title + " " + result.toString());
		}

		return result;
	}

	/**
	 * 给群组发送语音消息
	 */
	@SuppressWarnings("static-access")
	@Async
	public CodeSuccessReslut pushGroupVoiceAll(String title, String base64, String extras, String[] groups) {

		CodeSuccessReslut result = null;
		try {
			RongCloud rongCloud = RongCloud.getInstance(ZConstants.RONGYUN_APP_KEY, ZConstants.RONGYUN_APP_SECRET);

			VoiceMessage voiceMessage = new VoiceMessage(base64, extras, 20l);
			result = rongCloud.message.publishGroup(ZConstants.RONGYUN_SERVER, groups, voiceMessage, null, null, 0, 0);

			logger.info("推送群组：" + title + " " + result.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("推送群组：" + title + " " + result.toString());
		}

		return result;
	}
}
