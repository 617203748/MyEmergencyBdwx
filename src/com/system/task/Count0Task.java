package com.system.task;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bdjw.base.UrlPath;
import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;
import com.bdjw.service.MybatisService;
import com.system.http.HttpRequest;
import com.system.http.IRequestCallBack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

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
        System.out.println("使用SpringMVC框架配置定时任务");

        getCommonds();

        changePostion();

        sendPostions();

        sendMsgs();
    }

    public void changePostion() {
        HashMap<String, Object> param = new HashMap<String, Object>();
        final List<Dev_position> position_unchange = mybatisService.getDevPostion_unchange(param);
        String coords = "";
        if (position_unchange != null && position_unchange.size() > 0) {

            for (int i = 0; i < position_unchange.size(); i++) {
                String item = position_unchange.get(i).getLongitude() + "," + position_unchange.get(i).getLatitude() + ";";
                coords = coords + item;
            }

            String coString = coords.substring(0, coords.length() - 1);
            String params = "coords=" + coString + "&from=1&to=5&ak=4bI5lq7HzTVsQzNvGmSuWd3HBzffWHAl";
            HttpRequest.sendPost("http://api.map.baidu.com/geoconv/v1/", params, new IRequestCallBack() {
                @Override
                public void onSuccess(String result) {
                    JSONObject json = JSONObject.parseObject(result);
                    JSONArray jsonArray = json.getJSONArray("result");
                    for (int i = 0; i < jsonArray.size(); i++) {
                        position_unchange.get(i).setLatitude(jsonArray.getJSONObject(i).getString("y"));
                        position_unchange.get(i).setLongitude(jsonArray.getJSONObject(i).getString("x"));
                        position_unchange.get(i).setIs_change(1);

                        mybatisService.changePostion(position_unchange.get(i));
                    }
                }
            });
        }
    }

    private void getCommonds() {
        System.out.println("url:::" + UrlPath.getBds_bdcommand);
        HttpRequest.sendPost(UrlPath.getBds_bdcommand, "", new IRequestCallBack() {
            @Override
            public void onSuccess(String result) {
                JSONObject jsonObject = JSONObject.parseObject(result);
                JSONArray jsonArray = jsonObject.getJSONArray("data");
                // 在这里将需要执行的命令插入数据库

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
                    System.out.println("1.命令插入数据库成功");
                }
            }
        });
    }

    public void sendPostions() {
        HashMap<String, Object> param = new HashMap<String, Object>();
        final List<Dev_position> positions_changed = mybatisService.getDevPostion_changed(param);
        if (positions_changed != null) {
            // 上传终端位置信息
            HttpRequest.sendPost(UrlPath.handleSavePosition, "json=" + JSON.toJSONString(positions_changed), new IRequestCallBack() {
                @Override
                public void onSuccess(String result) {
                    JSONObject jsonObject = JSONObject.parseObject(result);
                    if ("success".equals(jsonObject.getString("code"))) {
                        for (int i = 0; i < positions_changed.size(); i++) {
                            mybatisService.changeStatus_DevPostion(positions_changed.get(i));
                            System.out.println("2.修改位置信息状态成功：" + positions_changed.get(i).getPos_id());
                        }
                    }
                }
            });
        }
    }

    public void sendMsgs() {
        HashMap<String, Object> param = new HashMap<String, Object>();
        final List<Dev_msg> msgs = mybatisService.getDevMsg(param);
        if (msgs != null) {
            // 上传终端位置信息
            HttpRequest.sendPost(UrlPath.handleSaveMsg, "json=" + JSON.toJSONString(msgs), new IRequestCallBack() {
                @Override
                public void onSuccess(String result) {
                    JSONObject jsonObject = JSONObject.parseObject(result);
                    if ("success".equals(jsonObject.getString("code"))) {
                        for (int i = 0; i < msgs.size(); i++) {

                            mybatisService.changeStatus_DevMsg(msgs.get(i));

                            System.out.println("3.修改聊天状态成功：" + msgs.get(i).getMsg_id());
                        }
                    }
                }
            });
        }
    }
}
