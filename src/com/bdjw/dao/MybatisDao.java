package com.bdjw.dao;

import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;

import java.util.HashMap;
import java.util.List;

public interface MybatisDao {

    public List<Dev_position> getDevPostion_changed(HashMap<String, Object> param) throws Exception;

    public List<Dev_position> getDevPostion_unchange(HashMap<String, Object> param) throws Exception;

    public int changePostion(Dev_position position) throws Exception;

    public List<Dev_msg> getDevMsg(HashMap<String, Object> param) throws Exception;

    public int makeCommond(HashMap<String, Object> param) throws Exception;

    public int changeStatus_DevPostion(Dev_position position) throws Exception;

    public int changeStatus_DevMsg(Dev_msg msg) throws Exception;
}
