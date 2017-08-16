package com.taxi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_despire;
import com.taxi.dao.DespireDao;

public class DespireDaoImpl extends SqlSessionDaoSupport implements DespireDao {

    private final String namespace = "com.taxi.dao.DespireDao.";

}
