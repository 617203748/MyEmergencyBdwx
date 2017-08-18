package com.bdjw.base;

public class UrlPath {

    // public static final String ip = "115.28.32.71";
    // public static final String ip = "192.168.0.112";
    // public static final String ip = "yj.sxbdjw.com";

    public static final String host = "http://123.57.1.2:8080/bdwx/";

    public static final String ApiPhp = "http://192.168.199.168:1234/app_bdwx/index.php?";


    public static final String handleSavePosition = host + "app/handleSavePosition.do";

    public static final String handleSaveMsg = host + "app/handleSaveMsg.do";

    //public static final String getBds_bdcommand = host + "app/getBds_bdcommand.do";
    public static final String getBds_bdcommand = ApiPhp + "act=app&m=getBds_bdcommand";
}
