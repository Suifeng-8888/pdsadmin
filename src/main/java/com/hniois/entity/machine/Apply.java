package com.hniois.entity.machine;

import com.hniois.common.page.Page;

import java.util.Date;

/**
 * 仪器购买申请
 */
public class Apply extends Page {
    /** 基本字段
     *******************************/
    private String apply_id;//申请购买仪器ID
    private String mach_name;//仪器名称
    private String mach_model;//仪器型号
    private Double fate;//准确度或精度
    private String factory;//制造商
    private Double price;//购买单价
    private Integer apply_num;//购买数量
    private String status;//申请状态(0 审批通过,1 审批驳回,2 待审批)
    private String applyer;//申请人
    private String reason;//申请原因
    private Double cment;//杂费
    private String apply_time;// 申请时间
    //***********新增基础字段
    private String approver;//审批人
    private String approve_time;//审批时间


    /***************额外添加的字段***************/
    private Double apply_sum;//总价

    public String getApply_id() {
        return apply_id;
    }

    public void setApply_id(String apply_id) {
        this.apply_id = apply_id;
    }
    public String getMach_name() {
        return mach_name;
    }

    public void setMach_name(String mach_name) {
        this.mach_name = mach_name;
    }

    public String getMach_model() {
        return mach_model;
    }

    public void setMach_model(String mach_model) {
        this.mach_model = mach_model;
    }

    public Double getFate() {
        return fate;
    }

    public void setFate(Double fate) {
        this.fate = fate;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getApply_num() {
        return apply_num;
    }

    public void setApply_num(Integer apply_num) {
        this.apply_num = apply_num;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApplyer() {
        return applyer;
    }

    public void setApplyer(String applyer) {
        this.applyer = applyer;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Double getCment() {
        return cment;
    }

    public void setCment(Double cment) {
        this.cment = cment;
    }

    public Double getApply_sum() {
        return cment+price*apply_num;
    }

    public String getApply_time() {
        return apply_time;
    }

    public void setApply_time(String apply_time) {
        this.apply_time = apply_time;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getApprove_time() {
        return approve_time;
    }

    public void setApprove_time(String approve_time) {
        this.approve_time = approve_time;
    }
}
