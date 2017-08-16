package com.taxi.service;

import java.util.HashMap;
import java.util.List;

import com.taxi.bean.T_order;

public interface OrderService {
    //创建订单
    public int insertModel(T_order order);

    //修改订单
    public int updateModel(HashMap<String, Object> param);

    //获取单个订单
    public T_order selectModelOne(HashMap<String, Object> param);

    //获取多个订单
    public List<T_order> selectModelList(HashMap<String, Object> param);

    //抢单逻辑
    public int seckillOrder(HashMap<String, Object> param);

    //查询当日订单总数
    public int queryTodayCount(HashMap<String, Object> param);
}
