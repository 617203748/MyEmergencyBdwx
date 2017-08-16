package com.taxi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_order;
import com.taxi.dao.OrderDao;

public class OrderDaoImpl extends SqlSessionDaoSupport implements OrderDao {

    private final String namespace = "com.taxi.dao.OrderDao.";

    @Override
    public int insertModel(T_order order) throws Exception {
        return this.getSqlSession().insert(namespace + "insertModel", order);
    }

    @Override
    public int updateModel(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().update(namespace + "updateModel", param);
    }

    @Override
    public T_order selectModelOne(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectOne(namespace + "selectModelOne", param);
    }

    @Override
    public List<T_order> selectModelList(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "selectModelList", param);
    }

    @Override
    public int queryTodayCount(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectOne(namespace + "queryTodayCount", param);
    }

    @Override
    public int seckillOrder(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().update(namespace + "seckillOrder", param);
    }

}
