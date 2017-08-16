package com.taxi.dao;

import java.util.HashMap;
import java.util.List;

import com.taxi.bean.T_institution;

public interface InstitutionDao {

	public List<T_institution> selectModel(HashMap<String, Object> param) throws Exception;
}
