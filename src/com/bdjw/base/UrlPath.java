package com.bdjw.base;

public class UrlPath {

    // public static final String ip = "115.28.32.71";
    // public static final String ip = "192.168.0.112";
    public static final String ip = "api.eme.sxbdjw.cn";

    public static final String ApiPhp = "http://" + ip + "/app_bdwx/index.php?";

    public static final String handleSavePosition = ApiPhp + "act=app&m=handleSavePosition";

    public static final String handleSaveMsg = ApiPhp + "act=app&m=handleSaveMsg";

    public static final String getBds_bdcommand = ApiPhp + "act=app&m=getBds_bdcommand";
}
