package com.bdjw.service;

import com.bdjw.bean.Dev_msg;
import com.bdjw.bean.Dev_position;

import java.util.HashMap;
import java.util.List;

public interface MybatisService {

    public List<Dev_position> getDevPostion_changed(HashMap<String, Object> param);

    public List<Dev_position> getDevPostion_unchange(HashMap<String, Object> param);

    public int changePostion(HashMap<String, Object> param);

    public List<Dev_msg> getDevMsg(HashMap<String, Object> param);

    public int makeCommond(HashMap<String, Object> param);

    public int changeStatus_DevPostion(HashMap<String, Object> param);

    public int changeStatus_DevMsg(HashMap<String, Object> param);
}
