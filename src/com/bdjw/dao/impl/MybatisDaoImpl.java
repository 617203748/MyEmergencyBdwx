package com.bdjw.dao.impl;

import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;
import com.bdjw.dao.MybatisDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.HashMap;
import java.util.List;

public class MybatisDaoImpl extends SqlSessionDaoSupport implements MybatisDao {

    private final String namespace = "com.bdjw.dao.MybatisDao.";

    @Override
    public List<Dev_position> getDevPostion_changed(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "getDevPostion_changed", param);
    }

    @Override
    public List<Dev_position> getDevPostion_unchange(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "getDevPostion_unchange", param);
    }

    @Override
    public int changePostion(Dev_position position) throws Exception {
        return this.getSqlSession().update(namespace + "changePostion", position);
    }

    @Override
    public List<Dev_msg> getDevMsg(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "getDevMsg", param);
    }

    @Override
    public int makeCommond(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().insert(namespace + "makeCommond", param);
    }

    @Override
    public int changeStatus_DevPostion(Dev_position position) throws Exception {
        return this.getSqlSession().update(namespace + "changeStatus_DevPostion", position);
    }

    @Override
    public int changeStatus_DevMsg(Dev_msg msg) throws Exception {
        return this.getSqlSession().update(namespace + "changeStatus_DevMsg", msg);
    }
}
