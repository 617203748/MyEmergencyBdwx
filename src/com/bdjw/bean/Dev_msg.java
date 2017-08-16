package com.bdjw.bean;

public class Dev_msg {

    private int msg_id;
    private String sim_no;
    private String sim_recv;
    private String msg_time;
    private int msg_type;
    private int msg_coding;
    private String msg_content;
    private String recv_flag;
    private int is_commit;

    public int getMsg_id() {
        return msg_id;
    }

    public void setMsg_id(int msg_id) {
        this.msg_id = msg_id;
    }

    public String getSim_no() {
        return sim_no;
    }

    public void setSim_no(String sim_no) {
        this.sim_no = sim_no;
    }

    public String getSim_recv() {
        return sim_recv;
    }

    public void setSim_recv(String sim_recv) {
        this.sim_recv = sim_recv;
    }

    public String getMsg_time() {
        return msg_time;
    }

    public void setMsg_time(String msg_time) {
        this.msg_time = msg_time;
    }

    public int getMsg_type() {
        return msg_type;
    }

    public void setMsg_type(int msg_type) {
        this.msg_type = msg_type;
    }

    public int getMsg_coding() {
        return msg_coding;
    }

    public void setMsg_coding(int msg_coding) {
        this.msg_coding = msg_coding;
    }

    public String getMsg_content() {
        return msg_content;
    }

    public void setMsg_content(String msg_content) {
        this.msg_content = msg_content;
    }

    public String getRecv_flag() {
        return recv_flag;
    }

    public void setRecv_flag(String recv_flag) {
        this.recv_flag = recv_flag;
    }

    public int getIs_commit() {
        return is_commit;
    }

    public void setIs_commit(int is_commit) {
        this.is_commit = is_commit;
    }
}
