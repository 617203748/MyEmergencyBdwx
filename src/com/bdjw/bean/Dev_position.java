package com.bdjw.bean;

import java.util.Date;

public class Dev_position {

	private int pos_id;
	private int postype;
	private String longitude;
	private int longitudedir;
	private String latitude;
	private int latitudedir;
	private String altitude;
	private int pos_prec;
	private int fast_flag;
	private Date pos_time;
	private String sim_no;
	private int sim_id;
	private int is_change;
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

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getLongitudedir() {
		return longitudedir;
	}

	public void setLongitudedir(int longitudedir) {
		this.longitudedir = longitudedir;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public int getLatitudedir() {
		return latitudedir;
	}

	public void setLatitudedir(int latitudedir) {
		this.latitudedir = latitudedir;
	}

	public String getAltitude() {
		return altitude;
	}

	public void setAltitude(String altitude) {
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

	public Date getPos_time() {
		return pos_time;
	}

	public void setPos_time(Date pos_time) {
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

	public int getIs_commit() {
		return is_commit;
	}

	public void setIs_commit(int is_commit) {
		this.is_commit = is_commit;
	}

	public int getIs_change() {
		return is_change;
	}

	public void setIs_change(int is_change) {
		this.is_change = is_change;
	}

}
