package com.taxi.service.impl;

import com.taxi.bean.T_despire;
import com.taxi.dao.DespireDao;
import com.taxi.service.DespireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class DespireServiceImpl implements DespireService {

    @Autowired
    private DespireDao dao;

}
