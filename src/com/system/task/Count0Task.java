package com.system.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Count0Task {

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
    }

}
