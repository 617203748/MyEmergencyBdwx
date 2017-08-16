package com.taxi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.redis.RedisTools;
import com.taxi.bean.T_order;
import com.taxi.dao.OrderDao;
import com.taxi.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao dao;

    @Override
    public int insertModel(T_order order) {
        try {
            return dao.insertModel(order);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int updateModel(HashMap<String, Object> param) {
        try {
            return dao.updateModel(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public T_order selectModelOne(HashMap<String, Object> param) {
        try {
            return dao.selectModelOne(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<T_order> selectModelList(HashMap<String, Object> param) {
        try {
            return dao.selectModelList(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int seckillOrder(HashMap<String, Object> param) {
        try {
            return dao.seckillOrder(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int queryTodayCount(HashMap<String, Object> param) {
        try {
            return dao.queryTodayCount(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
