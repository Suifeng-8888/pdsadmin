package com.hniois.entity.machine;

import com.hniois.common.page.Page;

/**
 * 仪器检定记录
 */
public class CheckRecord extends Page {
    //id,mach_id,mach_name,model,factory,check_time,period,send_time,checked_time,check_num,bz
    private String id;
    private String mach_id;//仪器编号
    private String mach_name;//仪器名字
    private String model;//仪器型号
    private String factory;//生产厂家
    private String check_time;//到期检定时间
    private String period;//检定周期
    private String sender;//送检人
    private String send_time;//送检时间
    private String check_unit;//检测机构
    private String checked_time;//检定时间
    private String checker;//检定人
    private String check_num;//检定证书号
    private String check_state;//是否已检定
    private String bz;//备注

    public String getMach_id() {
        return mach_id;
    }

    public void setMach_id(String mach_id) {
        this.mach_id = mach_id;
    }

    public String getMach_name() {
        return mach_name;
    }

    public void setMach_name(String mach_name) {
        this.mach_name = mach_name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getCheck_time() {
        return check_time;
    }

    public void setCheck_time(String check_time) {
        this.check_time = check_time;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getSend_time() {
        return send_time;
    }

    public void setSend_time(String send_time) {
        this.send_time = send_time;
    }

    public String getChecked_time() {
        return checked_time;
    }

    public void setChecked_time(String checked_time) {
        this.checked_time = checked_time;
    }

    public String getCheck_num() {
        return check_num;
    }

    public void setCheck_num(String check_num) {
        this.check_num = check_num;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }

    public String getCheck_state() {
        return check_state;
    }

    public void setCheck_state(String check_state) {
        this.check_state = check_state;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getCheck_unit() {
        return check_unit;
    }

    public void setCheck_unit(String check_unit) {
        this.check_unit = check_unit;
    }
}
