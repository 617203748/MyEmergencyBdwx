package com.taxi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.taxi.bean.T_institution;
import com.taxi.dao.InstitutionDao;

public class InstitutionDaoImpl extends SqlSessionDaoSupport implements InstitutionDao {

	private final String namespace = "com.taxi.dao.InstitutionDao.";

	@Override
	public List<T_institution> selectModel(HashMap<String, Object> param) throws Exception {
		return this.getSqlSession().selectList(namespace + "selectModel11", param);
	}

}
