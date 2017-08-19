package com.system.task;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bdjw.base.UrlPath;
import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;
import com.bdjw.service.MybatisService;
import com.bdjw.utils.Util_Date;
import com.system.http.HttpRequest;
import com.system.http.IRequestCallBack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

@Component
public class Count0Task {

    @Autowired
    private MybatisService mybatisService;

    // 1 秒 是 0-59
    // 2 分 是 0-59
    // 3 时 是 0-23
    // 4 日 是 1-31
    // 5 月 是 1-12
    // 6 周 是 1-7
    @Scheduled(cron = "10 * * * * *")
    // 间隔5秒执行
    public void taskCycle() {
        System.out.println();
        System.out.println("当前时间：" + Util_Date.getCurrentDateTime());

        //获取通信命令
        getCommonds();

        //提交文本信息
        sendMsgs();

        //转换位置信息后提交位置信息
        changePostion();

        //上传位置
        sendPostions();
    }

    //1
    private void getCommonds() {
        System.out.println("    1.getCommonds:" + UrlPath.getBds_bdcommand);
        try {
            HttpRequest.sendPost(UrlPath.getBds_bdcommand, "", new IRequestCallBack() {
                @Override
                public void onSuccess(String result) {
                    System.out.println("        1.result:" + result);

                    //返回整体
                    JSONObject jsonObject = JSONObject.parseObject(result);

                    if (jsonObject.getInteger("errCode") == 0) {
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for (int i = 0; i < jsonArray.size(); i++) {
                            HashMap<String, Object> param = new HashMap<String, Object>();
                            param.put("BDC_FSZH", jsonArray.getJSONObject(i).getString("BDC_FSZH"));
                            param.put("BDC_JSZH", jsonArray.getJSONObject(i).getString("BDC_JSZH"));
                            param.put("BDC_TXNR", jsonArray.getJSONObject(i).getString("BDC_TXNR"));
                            param.put("BDC_MLLX", jsonArray.getJSONObject(i).getString("BDC_MLLX"));
                            param.put("BDC_FSLX", jsonArray.getJSONObject(i).getString("BDC_FSLX"));
                            param.put("BDC_TXBM", jsonArray.getJSONObject(i).getString("BDC_TXBM"));
                            param.put("BDC_SFTB", jsonArray.getJSONObject(i).getString("BDC_SFTB"));
                            param.put("BDC_FSBZ", jsonArray.getJSONObject(i).getString("BDC_FSBZ"));

                            mybatisService.makeCommond(param);
                        }
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //2
    public void sendMsgs() {
        try {
            HashMap<String, Object> param = new HashMap<String, Object>();
            final List<Dev_msg> msgs = mybatisService.getDevMsg(param);
            System.out.println("    2.sendMsgs:" + JSON.toJSONString(msgs));
            if (msgs != null && msgs.size() > 0) {
                // 上传终端位置信息

                HttpRequest.sendPost(UrlPath.handleSaveMsg, "json=" + JSON.toJSONString(msgs), new IRequestCallBack() {
                    @Override
                    public void onSuccess(String result) {
                        System.out.println("        2.result:" + result);

                        JSONObject jsonObject = JSONObject.parseObject(result);

                        if (jsonObject.getInteger("errCode") == 0) {
                            for (int i = 0; i < msgs.size(); i++) {
                                mybatisService.changeStatus_DevMsg(msgs.get(i));
                            }
                        }
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //3
    public void changePostion() {
        try {
            HashMap<String, Object> param = new HashMap<String, Object>();
            final List<Dev_position> list = mybatisService.getDevPostion_unchange(param);
            System.out.println("    3.changePostion:" + JSON.toJSONString(list));
            String coords = "";
            if (list != null && list.size() > 0) {

                for (int i = 0; i < list.size(); i++) {
                    String item = list.get(i).getLongitude() + "," + list.get(i).getLatitude() + ";";
                    coords = coords + item;
                }

                String coString = coords.substring(0, coords.length() - 1);
                String params = "coords=" + coString + "&from=1&to=5&ak=4bI5lq7HzTVsQzNvGmSuWd3HBzffWHAl";
                HttpRequest.sendPost("http://api.map.baidu.com/geoconv/v1/", params, new IRequestCallBack() {
                    @Override
                    public void onSuccess(String result) {
                        System.out.println("        3.result:" + result);

                        JSONObject json = JSONObject.parseObject(result);
                        JSONArray jsonArray = json.getJSONArray("result");
                        for (int i = 0; i < jsonArray.size(); i++) {
                            list.get(i).setLatitude(jsonArray.getJSONObject(i).getString("y"));
                            list.get(i).setLongitude(jsonArray.getJSONObject(i).getString("x"));
                            list.get(i).setIs_changed(1);

                            mybatisService.changePostion(list.get(i));
                        }
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendPostions() {
        try {
            HashMap<String, Object> param = new HashMap<String, Object>();
            final List<Dev_position> positions_changed = mybatisService.getDevPostion_changed(param);
            System.out.println("    4.sendPostions:" + JSON.toJSONString(positions_changed));
            if (positions_changed != null && positions_changed.size() > 0) {
                // 上传终端位置信息
                HttpRequest.sendPost(UrlPath.handleSavePosition, "json=" + JSON.toJSONString(positions_changed), new IRequestCallBack() {
                    @Override
                    public void onSuccess(String result) {
                        System.out.println("        4.result:" + result);

                        JSONObject jsonObject = JSONObject.parseObject(result);

                        if (jsonObject.getInteger("errCode") == 0) {
                            for (int i = 0; i < positions_changed.size(); i++) {
                                mybatisService.changeStatus_DevPostion(positions_changed.get(i));
                            }
                        }
                    }
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
