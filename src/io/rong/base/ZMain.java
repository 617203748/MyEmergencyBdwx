package io.rong.base;

import io.rong.messages.TxtMessage;
import io.rong.models.CodeSuccessReslut;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public class ZMain {

	public static void main(String[] args) {
		String appKey = "3argexb6rry3e";// 替换成您的appkey
		String appSecret = "X6tLTqGe8v5S2";// 替换成匹配上面key的secret

		RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);

		TxtMessage txtMessage = new TxtMessage("titletitle", "contentcontent");
		List<String> list = new ArrayList<String>();
		list.add("15343406720");

		try {
			CodeSuccessReslut result = rongCloud.message.publishPrivate("server_nanpi", list, txtMessage, null, null, null, 0, 0, 0);
			System.out.println(result.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			System.out.println("final 出错了");
		}
	}
}
