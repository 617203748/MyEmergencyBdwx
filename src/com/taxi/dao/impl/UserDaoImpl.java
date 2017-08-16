package com.taxi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_user;
import com.taxi.dao.UserDao;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

    private final String namespace = "com.taxi.dao.UserDao.";

    @Override
    public List<T_user> selectModel(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "selectModel", param);
    }

    @Override
    public List<String> selectField_username(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().selectList(namespace + "selectField_username", param);
    }

    @Override
    public int updateModel(HashMap<String, Object> param) throws Exception {
        return this.getSqlSession().update(namespace + "updateModel", param);
    }

}
