package com.system.redis;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.taxi.utils.Util_Date;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import redis.clients.jedis.JedisPubSub;

import com.alibaba.fastjson.JSONObject;
import com.system.rongyun.ZAsyncPush;
import com.taxi.base.ZConstants;
import com.taxi.service.OrderService;
import com.taxi.service.UserService;

@Component
public class RedisPSListener extends JedisPubSub {

    protected Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ZAsyncPush zAsyncPush;

    @Override
    public void onMessage(final String arg0, final String arg1) {
        logger.info("RedisPSListener 开始运行：" + arg0 + "  " + arg1);

        final JSONObject jsonObject = JSONObject.parseObject(arg1);
        JSONObject jsonType = new JSONObject();
        jsonType.put("title", ZConstants.PUSH_TITLE_ORDER);
        jsonType.put("content", jsonObject.getJSONObject("order"));
        String extras = jsonType.toJSONString();

        HashMap<String, Object> paramUpdate = new HashMap<String, Object>();
        paramUpdate.put("time_update", Util_Date.getCurrentDateTime());
        paramUpdate.put("is_push", 1);
        paramUpdate.put("order_id", jsonObject.getJSONObject("order").getIntValue("order_id"));

        this.orderService.updateModel(paramUpdate);

        try {

            // 0 发送订单给一组
            try {
                HashMap<String, Object> param = new HashMap<String, Object>();
                param.put("type", 1);
                List<String> list = userService.selectField_username(param);

                if (list != null && list.size() > 0) {
                    zAsyncPush.pushDeviceTextAll("推送给一组 1档：" + list.size(), extras, list);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            // 睡眠15秒
            Thread.sleep(20000);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }

    @Override
    public void onPMessage(String arg0, String arg1, String arg2) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onPSubscribe(String arg0, int arg1) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onPUnsubscribe(String arg0, int arg1) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onSubscribe(String arg0, int arg1) {
        // TODO Auto-generated method stub

    }

    @Override
    public void onUnsubscribe(String arg0, int arg1) {
        // TODO Auto-generated method stub

    }

}
