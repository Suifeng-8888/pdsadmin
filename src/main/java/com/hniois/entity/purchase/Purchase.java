package com.hniois.entity.purchase;

import com.hniois.common.page.Page;

/**
 * 采购备案对象
 */
public class Purchase extends Page{
    //id,pro_id,pur_batch,supply_id,buyer,price,status,record
    /**基础字段
     ************************************/
    private String pro_id;//采购商品编号
    private String pur_batch;//采购批次号
    private String supply_id;//供应商ID
    private String price;//价格
    private String record;//财务备案状态 0已备案 1未备案
    private String buyer;//询价人
    private String pur_num;//采购数量
    private String pro_name;//商品名称
    private String supply_name;//供应商名称
    /**扩展字段
     *************************************/

    private String pro_unit;//商品规格
    private String address;//供应商地址
    private String ask_time;//询价时间

    public String getPro_id() {
        return pro_id;
    }

    public void setPro_id(String pro_id) {
        this.pro_id = pro_id;
    }

    public String getPur_batch() {
        return pur_batch;
    }

    public void setPur_batch(String pur_batch) {
        this.pur_batch = pur_batch;
    }

    public String getSupply_id() {
        return supply_id;
    }

    public void setSupply_id(String supply_id) {
        this.supply_id = supply_id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getSupply_name() { return supply_name; }

    public void setSupply_name(String supply_name) { this.supply_name = supply_name; }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAsk_time() {
        return ask_time;
    }

    public void setAsk_time(String ask_time) {
        this.ask_time = ask_time;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public String getPro_unit() {
        return pro_unit;
    }

    public void setPro_unit(String pro_unit) {
        this.pro_unit = pro_unit;
    }

    public String getPur_num() {
        return pur_num;
    }

    public void setPur_num(String pur_num) {
        this.pur_num = pur_num;
    }
}
