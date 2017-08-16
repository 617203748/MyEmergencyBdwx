package com.taxi.bean;

public class T_order {

    private int order_id;
    private int serialnumber;
    private String tel_passenger;
    private String voice;
    private int is_push;
    private int user_id;
    private String lon;
    private String lat;
    private String timecha;

    private String time_create;
    private String time_update;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSerialnumber() {
        return serialnumber;
    }

    public void setSerialnumber(int serialnumber) {
        this.serialnumber = serialnumber;
    }

    public String getTel_passenger() {
        return tel_passenger;
    }

    public void setTel_passenger(String tel_passenger) {
        this.tel_passenger = tel_passenger;
    }

    public String getTimecha() {
        return timecha;
    }

    public void setTimecha(String timecha) {
        this.timecha = timecha;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getVoice() {
        return voice;
    }

    public void setVoice(String voice) {
        this.voice = voice;
    }

    public int getIs_push() {
        return is_push;
    }

    public void setIs_push(int is_push) {
        this.is_push = is_push;
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
