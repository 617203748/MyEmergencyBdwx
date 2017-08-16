package com.taxi.service;

import java.util.HashMap;
import java.util.List;

import com.taxi.bean.T_user;

public interface UserService {

    public List<String> selectField_username(HashMap<String, Object> param);

    public List<T_user> selectModel(HashMap<String, Object> param);

    public int updateModel(HashMap<String, Object> param);
}
