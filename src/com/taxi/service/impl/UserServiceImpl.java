package com.taxi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taxi.bean.T_user;
import com.taxi.dao.UserDao;
import com.taxi.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    @Override
    public List<String> selectField_username(HashMap<String, Object> param) {
        try {
            return dao.selectField_username(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<T_user> selectModel(HashMap<String, Object> param) {
        try {
            return dao.selectModel(param);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int updateModel(HashMap<String, Object> param) {
        try {
            return dao.updateModel(param);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
