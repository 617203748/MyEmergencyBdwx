package com.taxi.bean;

public class T_user {

    private int user_id;
    private String carlicense;
    private String realname;
    private String tel;
    private String username;
    private String password;
    private String company;

    private int type;
    private int num_today;
    private int num_totle;

    private String bind_device;
    private String bind_rongyun;

    private String time_create;
    private String time_update;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCarlicense() {
        return carlicense;
    }

    public void setCarlicense(String carlicense) {
        this.carlicense = carlicense;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getNum_today() {
        return num_today;
    }

    public void setNum_today(int num_today) {
        this.num_today = num_today;
    }

    public int getNum_totle() {
        return num_totle;
    }

    public void setNum_totle(int num_totle) {
        this.num_totle = num_totle;
    }

    public String getBind_device() {
        return bind_device;
    }

    public void setBind_device(String bind_device) {
        this.bind_device = bind_device;
    }

    public String getBind_rongyun() {
        return bind_rongyun;
    }

    public void setBind_rongyun(String bind_rongyun) {
        this.bind_rongyun = bind_rongyun;
    }

    public String getTime_create() {
        return time_create;
    }

    public void setTime_create(String time_create) {
        this.time_create = time_create;
    }

    public String getTime_update() {
        return time_update;
    }

    public void setTime_update(String time_update) {
        this.time_update = time_update;
    }
}
