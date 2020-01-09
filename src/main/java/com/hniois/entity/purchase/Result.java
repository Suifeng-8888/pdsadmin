package com.hniois.entity.purchase;

import com.hniois.common.page.Page;

/**
 * 采购结果对象
 */
public class Result extends Page {
    //id,pro_id,pro_name,pur_num,pur_batch,price,buyer,status,buy_time
    private String id;//序号
    private String pro_id;//产品编号
    private String pro_name;//产品名称
    private String pur_num;//采购数量
    private String pur_batch;//采购批次
    private String price;//采购价格
    private String buyer;//采购人
    private String status;//采购状态 0 待采购 1 已采购 2 作废'
    private String buy_time;//采购完成时间

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getPro_id() {
        return pro_id;
    }

    public void setPro_id(String pro_id) {
        this.pro_id = pro_id;
    }

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

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBuy_time() {
        return buy_time;
    }

    public void setBuy_time(String buy_time) {
        this.buy_time = buy_time;
    }
}
