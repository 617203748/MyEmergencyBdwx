package com.taxi.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_position;
import com.taxi.dao.PositionDao;

public class PositionDaoImpl extends SqlSessionDaoSupport implements PositionDao {

    private final String namespace = "com.taxi.dao.PositionDao.";


}
