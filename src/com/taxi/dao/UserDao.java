package com.taxi.dao;

import java.util.HashMap;
import java.util.List;

import com.taxi.bean.T_user;

public interface UserDao {

    public List<T_user> selectModel(HashMap<String, Object> param) throws Exception;

    // 获取全部联通号
    public List<String> selectField_username(HashMap<String, Object> param) throws Exception;

    public int updateModel(HashMap<String, Object> param) throws Exception;

}
