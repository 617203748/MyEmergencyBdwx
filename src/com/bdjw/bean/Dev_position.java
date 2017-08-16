package com.bdjw.bean;

public class Dev_position {

    private int pos_id;
    private int postype;
    private double longitude;
    private int longitudedir;
    private double latitude;
    private int latitudedir;
    private double altitude;
    private int pos_prec;
    private int fast_flag;
    private String pos_time;
    private String sim_no;
    private int sim_id;
    private int is_changed;
    private int is_commit;

    public int getPos_id() {
        return pos_id;
    }

    public void setPos_id(int pos_id) {
        this.pos_id = pos_id;
    }

    public int getPostype() {
        return postype;
    }

    public void setPostype(int postype) {
        this.postype = postype;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public int getLongitudedir() {
        return longitudedir;
    }

    public void setLongitudedir(int longitudedir) {
        this.longitudedir = longitudedir;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public int getLatitudedir() {
        return latitudedir;
    }

    public void setLatitudedir(int latitudedir) {
        this.latitudedir = latitudedir;
    }

    public double getAltitude() {
        return altitude;
    }

    public void setAltitude(double altitude) {
        this.altitude = altitude;
    }

    public int getPos_prec() {
        return pos_prec;
    }

    public void setPos_prec(int pos_prec) {
        this.pos_prec = pos_prec;
    }

    public int getFast_flag() {
        return fast_flag;
    }

    public void setFast_flag(int fast_flag) {
        this.fast_flag = fast_flag;
    }

    public String getPos_time() {
        return pos_time;
    }

    public void setPos_time(String pos_time) {
        this.pos_time = pos_time;
    }

    public String getSim_no() {
        return sim_no;
    }

    public void setSim_no(String sim_no) {
        this.sim_no = sim_no;
    }

    public int getSim_id() {
        return sim_id;
    }

    public void setSim_id(int sim_id) {
        this.sim_id = sim_id;
    }

    public int getIs_changed() {
        return is_changed;
    }

    public void setIs_changed(int is_changed) {
        this.is_changed = is_changed;
    }

    public int getIs_commit() {
        return is_commit;
    }

    public void setIs_commit(int is_commit) {
        this.is_commit = is_commit;
    }
}
