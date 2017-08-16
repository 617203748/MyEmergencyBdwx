package com.bdjw.bean;

public class T_despire {

    private int despire_id;
    private int order_id;
    private int user_id;
    private int who_user_id;
    private String who_lon;
    private String who_lat;
    private int is_commit;
    private String time_frozen;
    private String time_unlock;

    private String time_create;
    private String time_update;

    public int getDespire_id() {
        return despire_id;
    }

    public void setDespire_id(int despire_id) {
        this.despire_id = despire_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getWho_user_id() {
        return who_user_id;
    }

    public void setWho_user_id(int who_user_id) {
        this.who_user_id = who_user_id;
    }

    public String getWho_lon() {
        return who_lon;
    }

    public void setWho_lon(String who_lon) {
        this.who_lon = who_lon;
    }

    public String getWho_lat() {
        return who_lat;
    }

    public void setWho_lat(String who_lat) {
        this.who_lat = who_lat;
    }

    public int getIs_commit() {
        return is_commit;
    }

    public void setIs_commit(int is_commit) {
        this.is_commit = is_commit;
    }

    public String getTime_frozen() {
        return time_frozen;
    }

    public void setTime_frozen(String time_frozen) {
        this.time_frozen = time_frozen;
    }

    public String getTime_unlock() {
        return time_unlock;
    }

    public void setTime_unlock(String time_unlock) {
        this.time_unlock = time_unlock;
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
