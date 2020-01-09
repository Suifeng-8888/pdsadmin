package com.hniois.entity.purchase;

import com.hniois.common.page.Page;

/**
 * 财务审批对象
 */
public class Finance extends Page {
    //id,pur_batch,price,approve,approve_time,state
    //基础字段
    private String pur_batch;//购买批次
    private String price;//购买价格
    private String approve;//财务审批人
    private String approve_time;//财务审批时间
    private String state;//审批状态 0审批通过 1审批驳回 2待审批
    private String pro_name;//采购商品名称
    private String pur_num;//采购总数量
    /**扩展字段
     *****************************************/



    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getPur_num() {
        return pur_num;
    }

    public void setPur_num(String pur_num) {
        this.pur_num = pur_num;
    }

    public String getPur_batch() {
        return pur_batch;
    }

    public void setPur_batch(String pur_batch) {
        this.pur_batch = pur_batch;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getApprove() {
        return approve;
    }

    public void setApprove(String approve) {
        this.approve = approve;
    }

    public String getApprove_time() {
        return approve_time;
    }

    public void setApprove_time(String approve_time) {
        this.approve_time = approve_time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
