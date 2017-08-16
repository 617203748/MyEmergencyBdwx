package com.taxi.service;

import java.util.HashMap;
import java.util.List;

import com.taxi.bean.T_institution;

public interface InstitutionService {

	public List<T_institution> selectModel(HashMap<String, Object> param);
}
