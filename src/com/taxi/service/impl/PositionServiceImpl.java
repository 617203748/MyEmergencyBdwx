package com.taxi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taxi.bean.T_position;
import com.taxi.dao.PositionDao;
import com.taxi.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionDao dao;


}
