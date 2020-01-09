package com.hniois.entity.machine;
/**
 * 仪器维修申请
 */

import com.hniois.common.page.Page;

public class Fix extends Page {
    //id,mach_id,fate,analysis,applyer,app_time,method,cost,status
    //type,appver,approve_time,check_fix_time,fix_state
    /** 基础字段
        ******************************/
    private String mach_id;//仪器编号
    private String analysis;//原因分析
    private String applyer;//申请人
    private String app_time;//申请时间
    private String method;//维修方法
    private  Double cost;//维修费用
    private  String status;//申请状态
    private String type;//类型 0维修1检测
    private String appver;//审批人
    private String approve_time;//审批时间
    private String mach_name;

    public String getMach_id() {
        return mach_id;
    }

    public void setMach_id(String mach_id) {
        this.mach_id = mach_id;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getApplyer() {
        return applyer;
    }

    public void setApplyer(String applyer) {
        this.applyer = applyer;
    }

    public String getApp_time() {
        return app_time;
    }

    public void setApp_time(String app_time) {
        this.app_time = app_time;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMach_name() {
        return mach_name;
    }

    public void setMach_name(String mach_name) {
        this.mach_name = mach_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAppver() {
        return appver;
    }

    public void setAppver(String appver) {
        this.appver = appver;
    }

    public String getApprove_time() {
        return approve_time;
    }

    public void setApprove_time(String approve_time) {
        this.approve_time = approve_time;
    }


}
