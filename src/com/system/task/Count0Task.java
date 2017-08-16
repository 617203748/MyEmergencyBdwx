package com.system.task;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.taxi.service.OrderService;
import com.taxi.service.UserService;

@Component
public class Count0Task {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    // 1 秒 是 0-59
    // 2 分 是 0-59
    // 3 时 是 0-23
    // 4 日 是 1-31
    // 5 月 是 1-12
    // 6 周 是 1-7
    @Scheduled(cron = "10 0 0 * * *")
    // 间隔5秒执行
    public void taskCycle() {
        System.out.println("使用SpringMVC框架配置定时任务");

        HashMap<String, Object> paramNumTotle = new HashMap<String, Object>();
        paramNumTotle.put("num_totle", "num_totle");
        int flag_numtotle = userService.updateModel(paramNumTotle);

        if (flag_numtotle != 0) {
            HashMap<String, Object> paramNumToday = new HashMap<String, Object>();
            paramNumToday.put("num_today_clear", "num_today_clear");
            userService.updateModel(paramNumToday);
        }

        System.out.println("订单统计完毕");
    }

}
