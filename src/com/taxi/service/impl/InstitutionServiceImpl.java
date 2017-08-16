package com.taxi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taxi.bean.T_institution;
import com.taxi.dao.InstitutionDao;
import com.taxi.service.InstitutionService;

@Service
public class InstitutionServiceImpl implements InstitutionService {

	@Autowired
	private InstitutionDao dao;

	@Override
	public List<T_institution> selectModel(HashMap<String, Object> param) {
		try {
			return dao.selectModel(param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
