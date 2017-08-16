package com.taxi.controller;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.system.luosimao.ZAsyncSms;
import com.system.rongyun.ZAsyncPush;
import com.taxi.base.BaseContrller;
import com.taxi.base.ZConstants;
import com.taxi.bean.T_despire;
import com.taxi.bean.T_institution;
import com.taxi.bean.T_missuser;
import com.taxi.bean.T_order;
import com.taxi.bean.T_user;
import com.taxi.service.DespireService;
import com.taxi.service.InstitutionService;
import com.taxi.service.MissuserService;
import com.taxi.service.OrderService;
import com.taxi.service.UserService;
import com.taxi.utils.Util_Date;

@Controller
@RequestMapping(value = "/api")
public class ApiController extends BaseContrller {

    @Autowired
    private ZAsyncPush zAsyncPush;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private DespireService despireService;

    @Autowired
    private MissuserService missuserService;

    @Autowired
    private InstitutionService institutionService;

    @ResponseBody
    @RequestMapping(value = "/getCurrentOrderInfo")
    public String getCurrentOrderInfo() {
        JSONObject jsonReturn = new JSONObject();
        System.out.println();
        System.out.println("请求 api/getCurrentOrderInfo：无参数");

        HashMap<String, Object> param = new HashMap<String, Object>();

        param.put("today", "%" + Util_Date.getCurrentDate() + "%");
        param.put("start", 0);
        param.put("end", 6);
        List<T_order> list = orderService.selectModelList(param);

        System.out.println(JSON.toJSONString(list));

        if (list != null && list.size() > 0) {
            Collections.reverse(list);

            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "获取订单列表成功");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", list);
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "暂无订单");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return jsonReturn.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "/getLastestOrderInfo")
    public String getLastestOrderInfo() {
        JSONObject jsonReturn = new JSONObject();
        System.out.println();
        System.out.println("请求 api/getLastestOrderInfo：无参数");

        HashMap<String, Object> param = new HashMap<String, Object>();

        param.put("today", "%" + Util_Date.getCurrentDate() + "%");
        param.put("start", 0);
        param.put("end", 1);
        List<T_order> list = orderService.selectModelList(param);

        System.out.println(JSON.toJSONString(list));

        if (list != null) {
            // Collections.reverse(list);

            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "获取最新单成功");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", list);
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "暂无订单");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return jsonReturn.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = "/missUser")
    public String missUser(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/missUser：" + jsonData.toJSONString());


        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/seckillOrder")
    public String seckillOrder(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/seckillOrder：" + jsonData.toJSONString());

//        // 获取参数 START
//        int order_id = jsonData.getIntValue("order_id");
//
//        String driver_tel = jsonData.getString("driver_tel");
//        String driver_carlicense = jsonData.getString("driver_carlicense");
//        String driver_realname = jsonData.getString("driver_realname");
//
//        String driver_location = jsonData.getString("driver_location");
//        String driver_latitude = jsonData.getString("driver_latitude");
//        String driver_longitude = jsonData.getString("driver_longitude");
//
//        String time_location = jsonData.getString("time_location");
//        String time_cha = jsonData.getString("time_cha");
//        // 获取参数 END
//
//        if (driver_latitude == null || "".equals(driver_latitude)) {
//            driver_latitude = "0.0";
//        }
//
//        if (driver_longitude == null || "".equals(driver_longitude)) {
//            driver_longitude = "0.0";
//        }
//
//        HashMap<String, Object> param = new HashMap<String, Object>();
//        param.put("order_id", order_id);
//
//        param.put("driver_tel", driver_tel);
//        param.put("driver_carlicense", driver_carlicense);
//        param.put("driver_realname", driver_realname);
//
//        param.put("driver_location", driver_location);
//        param.put("driver_latitude", driver_latitude);
//        param.put("driver_longitude", driver_longitude);
//
//        param.put("time_cha", time_cha);
//        param.put("time_location", time_location);
//        param.put("time_received", Util_Date.getCurrentDateTime(new Date()));
//        param.put("status", 1);
//        param.put("remark", "");
//
//        int flag = orderService.seckillOrder(param);
//
//        if (flag == 1) {
//            // 抢单成功 今日订单数加1
//            HashMap<String, Object> paramNumTodayAdd = new HashMap<String, Object>();
//            paramNumTodayAdd.put("carlicense", driver_carlicense);
//            int flagNumTodayAdd = userService.changeUserNumTodayAdd(paramNumTodayAdd);
//            if (flagNumTodayAdd == 1) {
//
//                // 获取订单model
//                HashMap<String, Object> param_Order = new HashMap<String, Object>();
//                param_Order.put("order_id", order_id);
//                T_order order = orderService.getOrderModel(param);
//
//                // 融云推送
//                JSONObject jsonObject = new JSONObject();
//                jsonObject.put("title", ZConstants.PUSH_TITLE_WHO_SECKILL);
//                jsonObject.put("content", JSON.toJSONString(order));
//
//                HashMap<String, Object> paramTelUnicoms = new HashMap<String, Object>();
//                List<String> list = userService.selectField_username(paramTelUnicoms);
//                zAsyncPush.pushDeviceTextAll("全体人员抢单成功：" + list.size(), jsonObject.toJSONString(), list);
//
//                JSONObject jsonObjects = new JSONObject();
//                jsonObjects.put("order", order);
//
//                jsonReturn.put("code", 200);
//                jsonReturn.put("msg", "抢单成功");
//                jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
//                jsonReturn.put("object", jsonObjects);
//            }
//        } else {
//            jsonReturn.put("code", 404);
//            jsonReturn.put("msg", "你的手慢了 有比你更快的");
//            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
//            jsonReturn.put("object", "");
//        }
//
//        System.out.println(jsonReturn.toJSONString());
        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/changePassword")
    public String changePassword(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/changePassword：" + jsonData.toJSONString());

        // 获取参数 START
        String password = jsonData.getString("password");
        // 获取参数 END

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("user_id", user_id);
        param.put("update_time", System.currentTimeMillis() / 1000);
        param.put("password", password);

        int flag = userService.updateModel(param);
        if (flag == 1) {
            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "密码修改成功 请重新登录");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "密码修改失败 请联系管理员");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/getMyOrderInfo")
    public String getMyOrderInfo(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/getMyOrderInfo：" + jsonData.toJSONString());

        // 获取参数 START
        String driver_carlicense = jsonData.getString("driver_carlicense");
        String time_received = jsonData.getString("time_received");
        // 获取参数 END

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("user_id", driver_carlicense);
        param.put("today", "%" + Util_Date.getCurrentDate() + "%");

        List<T_order> list = orderService.selectModelList(param);
        if (list != null && list.size() > 0) {
            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "获取订单列表成功");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", list);
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "暂无订单");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/getMyDespireInfo")
    public String getMyDespireInfo(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/getMyDespire：" + jsonData.toJSONString());


        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/getDespireList")
    public String getDespireList(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/selectModel11：" + jsonData.toJSONString());


        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/despireDriver")
    public String despireDriver(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 api/despireDriver：" + jsonData.toJSONString());


        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/getInstitutions")
    public String getInstitutions() {
        JSONObject jsonReturn = new JSONObject();

        HashMap<String, Object> param = new HashMap<String, Object>();
        List<T_institution> list = institutionService.selectModel(param);
        if (list != null) {
            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "规章制度列表获取成功");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", list);
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "系统出错 请联系管理员");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return JSON.toJSONString(jsonReturn);
    }

    @ResponseBody
    @RequestMapping(value = "/getTelAddress")
    public String getTelAddress(@Param("user_id") int user_id, @Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);

        System.out.println("data：" + JSON.toJSONString(data));

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("key", "%" + jsonData.getString("key") + "%");
        List<T_user> list = userService.selectModel(param);

        if (list != null) {
            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "联系人列表列表获取成功");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", list);
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "系统出错 请联系管理员");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        return JSON.toJSONString(jsonReturn);
    }

}
