package com.taxi.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taxi.bean.T_missuser;
import com.taxi.dao.MissuserDao;
import com.taxi.service.MissuserService;

@Service
public class MissuserServiceImpl implements MissuserService {

    @Autowired
    private MissuserDao dao;

}
