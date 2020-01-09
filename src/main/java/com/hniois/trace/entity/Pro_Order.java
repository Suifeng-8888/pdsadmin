package com.hniois.trace.entity;

import com.hniois.common.page.Page;
/**
 * 订单信息对象
 */
public class Pro_Order extends Page {

    private String order_num;//订单编号
    private Integer sale_id;//销售商id
    private String sale_name;//销售商名称
    private String send_time;//发货时间
    private String sender;//发货人
    private String recever;//收货人
    private String begin_address;//发货地址
    private String end_address;//收货地址
    private String im_id;//进货产品id
    private String im_batch;//进货产品批次信息
    private String tray_id;//托盘id
    private String tray_name;//托盘信息
    private String box_id;//箱品id

    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public Integer getSale_id() {
        return sale_id;
    }

    public void setSale_id(Integer sale_id) {
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

    public String getIm_id() {
        return im_id;
    }

    public void setIm_id(String im_id) {
        this.im_id = im_id;
    }

    public String getIm_batch() {
        return im_batch;
    }

    public void setIm_batch(String im_batch) {
        this.im_batch = im_batch;
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
}
