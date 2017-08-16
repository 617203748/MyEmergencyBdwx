package com.taxi.base;

import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.system.redis.RedisPSListener;
import com.system.redis.RedisTools;

/**
 * 启动监听器
 */
@Service
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private RedisPSListener myListener;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent evt) {
		if (evt.getApplicationContext().getParent() == null) {
			System.out.println("程序加载完毕");

			new Thread(new Runnable() {

				@Override
				public void run() {
					Jedis jedis = new RedisTools().getJedis();

					jedis.subscribe(myListener, ZConstants.REDIS_SUB_PUB_KEY);
				}
			}).start();
		}
	}

	private void createSitemap() {
		Timer timer = new Timer("createSitemap", true);
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				System.out.println("--->Create sitemap...");
				System.out.println("--->Success create sitemap...");
			}
		}, 1000);
	}
}
