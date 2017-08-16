package com.taxi.base;

public class ZConstants {

	// 螺丝帽相关
	public final static String LUOSIMAO_KEY = "key-281e58d88330f134b0b96718746cfaec";

	/**
	 * 南皮县
	 */
	// 融云相关
	public final static String RONGYUN_SERVER = "server_nanpi";
	public final static String RONGYUN_APP_KEY = "3argexb6rry3e";
	public final static String RONGYUN_APP_SECRET = "X6tLTqGe8v5S2";

	/**
	 * 原平市
	 */
	// // 融云相关
	// public final static String RONGYUN_SERVER = "server_yuanping";
	// public final static String RONGYUN_APP_KEY = "kj7swf8o7trh2";
	// public final static String RONGYUN_APP_SECRET = "nwEZllBbBwr";
	// // 信鸽相关
	// public static final int XINGGE_ACCESSID = 2100204647;
	// public static final String XINGGE_SECRETKEY =
	// "a40c140105fb07f9fd54c42b56126e43";

	// 系统常量
	public static final String REDIS_SUB_PUB_KEY = "orderPush";
	public static final String SYSTEM_AVERAGE_VALUE = "average_value";

	// 踩多少脚算一次违规
	public static final int DESPIRE_HOUR = 1000 * 60 * 60 * 72;

	// 推送标题
	public static final String PUSH_TITLE_ORDER = "order"; // 通知客户端抢单---MP3
	public static final String PUSH_TITLE_WHO_SECKILL = "orderinfo"; // 通知客户端有人抢单成功

	// FFmpeg 安装路径
	public static final String path_FFmpeg = "D:\\PST\\FFmpeg\\ffmpeg";

}
