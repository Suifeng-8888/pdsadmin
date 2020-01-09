package com.hniois.trace.entity;

import com.hniois.common.page.Page;
/**
 * 订单信息对象
 */
public class Order extends Page {

    private String order_num;//订单编号
    private String sale_id;//销售商id
    private String sale_name;//销售商名称
    private String send_time;//发货时间
    private String create_time;//创建日期
    private String sender;//发货人
    private String recever;//收货人
    private String begin_address;//发货地址
    private String end_address;//收货地址
    private String batch_id;//产品批次id
    private String batch_num;//产品数量
    private String batch;//产品批次号
    private String batch_name;//产品名称
    private String tray_id;//托盘id
    private String tray_name;//托盘信息
    private String box_id;//箱品id

    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public String getSale_id() {
        return sale_id;
    }

    public void setSale_id(String sale_id) {
        this.sale_id = sale_id;
    }

    public String getSale_name() {
        return sale_name;
    }

    public void setSale_name(String sale_name) {
        this.sale_name = sale_name;
    }

    public String getSend_time() {
        return send_time;
    }

    public void setSend_time(String send_time) {
        this.send_time = send_time;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecever() {
        return recever;
    }

    public void setRecever(String recever) {
        this.recever = recever;
    }

    public String getBegin_address() {
        return begin_address;
    }

    public void setBegin_address(String begin_address) {
        this.begin_address = begin_address;
    }

    public String getEnd_address() {
        return end_address;
    }

    public void setEnd_address(String end_address) {
        this.end_address = end_address;
    }

    public String getTray_id() {
        return tray_id;
    }

    public void setTray_id(String tray_id) {
        this.tray_id = tray_id;
    }

    public String getTray_name() {
        return tray_name;
    }

    public void setTray_name(String tray_name) {
        this.tray_name = tray_name;
    }

    public String getBox_id() {
        return box_id;
    }

    public void setBox_id(String box_id) {
        this.box_id = box_id;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getBatch_id() {
        return batch_id;
    }

    public void setBatch_id(String batch_id) {
        this.batch_id = batch_id;
    }

    public String getBatch_num() {
        return batch_num;
    }

    public void setBatch_num(String batch_num) {
        this.batch_num = batch_num;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getBatch_name() {
        return batch_name;
    }

    public void setBatch_name(String batch_name) {
        this.batch_name = batch_name;
    }
}
