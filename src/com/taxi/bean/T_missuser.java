package com.taxi.bean;

public class T_missuser {

    private int missuser_id;
    private int user_id;
    private int order_id;

    private String time_frozen;
    private String time_unlock;

    private String time_create;
    private String time_update;

    public int getMissuser_id() {
        return missuser_id;
    }

    public void setMissuser_id(int missuser_id) {
        this.missuser_id = missuser_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
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
