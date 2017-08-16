package com.taxi.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.system.redis.RedisPSListener;
import com.system.redis.RedisTools;
import com.system.rongyun.ZAsyncPush;
import com.taxi.base.BaseContrller;
import com.taxi.base.ZConstants;
import com.taxi.bean.T_order;
import com.taxi.bean.T_user;
import com.taxi.service.*;
import com.taxi.utils.Util_Date;
import io.rong.base.RongCloud;
import io.rong.models.TokenReslut;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/common")
public class CommonController extends BaseContrller {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/userLogin")
    @ResponseBody
    public String userLogin(@Param("data") String data) {
        System.out.println();
        System.out.println("请求 common/userLogin 参数：" + data);

        // 数据返回对象
        JSONObject jsonReturn = new JSONObject();
        // 数据参数对象
        JSONObject jsonData = JSONObject.parseObject(data);

        //获取参数---START
        String username = jsonData.getString("username");
        String password = jsonData.getString("password");
        String bind_device = jsonData.getString("bind_device");
        //获取参数---END

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("username", username);
        param.put("password", password);

        List<T_user> userList = userService.selectModel(param);
        if (userList != null && userList.size() > 0) {

            T_user user = userList.get(0);

//            // 获取token
//            final String token = Util_UUID.getToken(String.valueOf(user.getUser_id()));

//            //1-判断是否有违规
//            if (user.getDespire_id() != 0) {
//                HashMap<String, Object> paramDesprie = new HashMap<String, Object>();
//                paramDesprie.put("despire_id", user.getDespire_id());
//                List<T_despire> despires = this.despireService.selectModel(paramDesprie);
//
//                if (System.currentTimeMillis() > (despires.get(0).getTime_unlock() * 1000)) {
//                    int despire_id = user.getDespire_id();
//
//                    HashMap<String, Object> paramDespire = new HashMap<String, Object>();
//                    paramDespire.put("despire_id", despire_id);
//                    paramDespire.put("is_commit", 1);
//                    despireService.updateModel(paramDespire);
//
//                    HashMap<String, Object> paramUser = new HashMap<String, Object>();
//                    paramUser.put("user_id", user.getUser_id());
//                    paramUser.put("despire_id", 0);
//                    userService.updateModel(paramUser);
//                    user.setDespire_id(0);
//                }
//            }

            //2-判断融云是否正常
            if ("-1".equals(user.getBind_rongyun())) {
                try {
                    RongCloud rongCloud = RongCloud.getInstance(ZConstants.RONGYUN_APP_KEY, ZConstants.RONGYUN_APP_SECRET);
                    TokenReslut tokenReslut = rongCloud.user.getToken(user.getUsername(), user.getRealname(), "");
                    String bind_rongyun = tokenReslut.getToken().toString();

                    HashMap<String, Object> paramUser = new HashMap<String, Object>();
                    paramUser.put("bind_rongyun", bind_rongyun);
                    paramUser.put("user_id", user.getUser_id());
                    paramUser.put("time_update", Util_Date.getCurrentDateTime());
                    this.userService.updateModel(paramUser);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            //3-验证设备是否正常
            if ("-1".equals(user.getBind_device())) {// 更新用户设备ID
                HashMap<String, Object> paramUser = new HashMap<String, Object>();
                paramUser.put("user_id", user.getUser_id());
                paramUser.put("bind_device", bind_device);
                paramUser.put("time_update", Util_Date.getCurrentDateTime());

                if (userService.updateModel(paramUser) == 1) {
                    jsonReturn.put("code", 200);
                    jsonReturn.put("msg", "登录成功");
                    jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
                    jsonReturn.put("object", user);
                }
            } else {
                System.out.println("bind_device:" + bind_device);
                System.out.println("user:" + JSON.toJSONString(user));

                if (bind_device.equals(user.getBind_device())) { // 设备验证通过
                    jsonReturn.put("code", 200);
                    jsonReturn.put("msg", "登录成功");
                    jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
                    jsonReturn.put("object", user);
                } else {
                    // 非绑定设备
                    jsonReturn.put("code", 404);
                    jsonReturn.put("msg", "非绑定设备");
                    jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
                    jsonReturn.put("object", "");
                }
            }
        } else {
            jsonReturn.put("code", 404);
            jsonReturn.put("msg", "账号或密码错误");
            jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
            jsonReturn.put("object", "");
        }

        System.out.println("用户登录：" + JSON.toJSONString(jsonReturn));
        return JSON.toJSONString(jsonReturn).toString();
    }

    @RequestMapping("/createOrder")
    @ResponseBody
    public String createOrder(@Param("data") String data, HttpServletRequest request) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 common/createOrder：" + jsonData.toJSONString());

        // 获取参数 START
        String fileName = jsonData.getString("fileName");
        String tel = jsonData.getString("tel");
        // 获取参数 END

        T_order order = new T_order();
        order.setVoice("/" + Util_Date.getCurrentDate() + "/" + fileName + ".amr");
        order.setTime_create(Util_Date.getCurrentDateTime());
        order.setTel_passenger(tel);

        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("today", "%" + Util_Date.getCurrentDate() + "%");
        order.setSerialnumber(orderService.queryTodayCount(param) + 1);
        order.setIs_push(0);

        int flag = orderService.insertModel(order);
        if (flag == 1) {
            jsonReturn.put("code", 200);
            jsonReturn.put("msg", "订单创建成功");
            jsonReturn.put("data", JSON.toJSON(order));

            Logger logger = Logger.getLogger(ZAsyncPush.class);
            logger.info("");
            logger.info("生成订单  放入队列：" + JSON.toJSONString(order));

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("order", order);
            jsonObject.put("dirAmr", request.getSession().getServletContext().getRealPath("FILE/FILE_VOICE_AMR"));
            jsonObject.put("voicefile", order.getVoice());

            // 放到队列
            RedisTools redisTools = new RedisTools();
            redisTools.getJedis().publish(ZConstants.REDIS_SUB_PUB_KEY, jsonObject.toJSONString());

            return JSON.toJSONString(jsonReturn);
        }
        return JSON.toJSONString(order).toString();
    }

    @RequestMapping(value = "/saveAndroidLogcat")
    @ResponseBody
    public String saveAndroidLogcat(@Param("file") MultipartFile file, HttpServletRequest request) {
        JSONObject jsonReturn = new JSONObject();
        String path = request.getSession().getServletContext().getRealPath("FILE/FILE_LOG");

        // 如果文件夹不存在则创建文件夹
        // 如果文件夹不存在则创建文件夹
        File fileDir = new File(path);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }

        String fileName = file.getOriginalFilename();

        File targetFile = new File(fileDir.getAbsolutePath(), fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }

        try {
            // 保存
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // END

        logger.info("有人上传错误日志");

        jsonReturn.put("code", 200);
        jsonReturn.put("msg", "错误日志上传成功");
        jsonReturn.put("timestamp", String.valueOf(System.currentTimeMillis()));
        jsonReturn.put("object", "");

        return JSON.toJSONString(jsonReturn);
    }

    @RequestMapping("/getUserPosition")
    @ResponseBody
    public String getUserPosition(@Param("data") String data) {
        JSONObject jsonReturn = new JSONObject();
        JSONObject jsonData = JSONObject.parseObject(data);
        System.out.println();
        System.out.println("请求 common/getUserPosition：" + jsonData.toJSONString());


        return jsonReturn.toJSONString();
    }

    @RequestMapping("/receiveSms")
    @ResponseBody
    public String receiveSms(@Param("mobile") String mobile, @Param("message") String message) {
        Logger logger = Logger.getLogger(CommonController.class);
        logger.info("");
        logger.info("mobile：" + mobile);
        logger.info("message：" + message);

        return "";
    }

    @RequestMapping("/test")
    @ResponseBody
    public String test() throws Exception {

        return "test";
    }
}
