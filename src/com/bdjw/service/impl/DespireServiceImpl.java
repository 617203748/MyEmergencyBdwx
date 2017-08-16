package com.bdjw.service.impl;

import com.bdjw.dao.DespireDao;
import com.bdjw.service.DespireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DespireServiceImpl implements DespireService {

    @Autowired
    private DespireDao dao;

}
