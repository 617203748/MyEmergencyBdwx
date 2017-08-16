package com.taxi.dao.impl;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_missuser;
import com.taxi.dao.MissuserDao;

public class MissuserDaoImpl extends SqlSessionDaoSupport implements MissuserDao {

	private final String namespace = "com.taxi.dao.MissuserDao.";


}
