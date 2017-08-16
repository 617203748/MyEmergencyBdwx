package com.bdjw.service.impl;

import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;
import com.bdjw.dao.MybatisDao;
import com.bdjw.service.MybatisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MybatisServiceImpl implements MybatisService {

    @Autowired
    private MybatisDao dao;

    @Override
    public List<Dev_position> getDevPostion_changed(HashMap<String, Object> param) {
        try {
            return dao.getDevPostion_changed(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Dev_position> getDevPostion_unchange(HashMap<String, Object> param) {
        try {
            return dao.getDevPostion_unchange(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int changePostion(HashMap<String, Object> param) {
        try {
            return dao.changePostion(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<Dev_msg> getDevMsg(HashMap<String, Object> param) {
        try {
            return dao.getDevMsg(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int makeCommond(HashMap<String, Object> param) {
        try {
            return dao.makeCommond(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int changeStatus_DevPostion(HashMap<String, Object> param) {
        try {
            return dao.changeStatus_DevPostion(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int changeStatus_DevMsg(HashMap<String, Object> param) {
        try {
            return dao.changeStatus_DevMsg(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
