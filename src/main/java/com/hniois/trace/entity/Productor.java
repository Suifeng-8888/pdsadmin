package com.hniois.trace.entity;

import com.hniois.common.page.Page;

/**
 * 商品管理对象
 */
public class Productor extends Page{
    private String pro_id;//产品序号
    private String pro_name;//产品名称
    private String pro_code;//产品条码
    private String isfinish;//是否半成品 0成品 1半成品
    private String pro_type;//产品分类
    private String pro_statu;//产品状态 0在产1停产
    private String stand_num;//标准号
    private String stand_name;//标准名称
    private String stand_type;//标准类型
    private String pro_mark;//产品商标
    private String pro_unit;//产品规格
    private String end_time;//保质期
    private String forge_id;//防伪标识
    private String pro_img;//产品图片信息
    private String net_weight;//产品扩展属性

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

    public String getPro_code() {
        return pro_code;
    }

    public void setPro_code(String pro_code) {
        this.pro_code = pro_code;
    }

    public String getIsfinish() {
        return isfinish;
    }

    public void setIsfinish(String isfinish) {
        this.isfinish = isfinish;
    }

    public String getPro_type() {
        return pro_type;
    }

    public void setPro_type(String pro_type) {
        this.pro_type = pro_type;
    }

    public String getPro_statu() {
        return pro_statu;
    }

    public void setPro_statu(String pro_statu) {
        this.pro_statu = pro_statu;
    }

    public String getStand_num() {
        return stand_num;
    }

    public void setStand_num(String stand_num) {
        this.stand_num = stand_num;
    }

    public String getStand_name() {
        return stand_name;
    }

    public void setStand_name(String stand_name) {
        this.stand_name = stand_name;
    }

    public String getStand_type() {
        return stand_type;
    }

    public void setStand_type(String stand_type) {
        this.stand_type = stand_type;
    }

    public String getPro_mark() {
        return pro_mark;
    }

    public void setPro_mark(String pro_mark) {
        this.pro_mark = pro_mark;
    }

    public String getPro_unit() {
        return pro_unit;
    }

    public void setPro_unit(String pro_unit) {
        this.pro_unit = pro_unit;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getForge_id() {
        return forge_id;
    }

    public void setForge_id(String forge_id) {
        this.forge_id = forge_id;
    }

    public String getPro_img() {
        return pro_img;
    }

    public void setPro_img(String pro_img) {
        this.pro_img = pro_img;
    }

    public String getNet_weight() {
        return net_weight;
    }

    public void setNet_weight(String net_weight) {
        this.net_weight = net_weight;
    }
}
