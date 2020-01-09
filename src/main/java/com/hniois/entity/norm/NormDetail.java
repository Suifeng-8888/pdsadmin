package com.hniois.entity.norm;

import com.hniois.common.page.Page;

/**
 * 检测详情
 */
public class NormDetail extends Page {

    private String id;  //  详情id
    private String norm_id;// 标准id
    private String detail_object; // 检测对象
    private String detail_options; // 检测项目
    private String detail_value;//  标准检测值
    private String value_updown;//  检测范围

    public String getValue_updown() {
        return value_updown;
    }

    public void setValue_updown(String value_updown) {
        this.value_updown = value_updown;
    }

    private String norm_name;// 标准名称

    public String getNorm_name() {
        return norm_name;
    }

    public void setNorm_name(String norm_name) {
        this.norm_name = norm_name;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getNorm_id() {
        return norm_id;
    }

    public void setNorm_id(String norm_id) {
        this.norm_id = norm_id;
    }

    public String getDetail_object() {
        return detail_object;
    }

    public void setDetail_object(String detail_object) {
        this.detail_object = detail_object;
    }

    public String getDetail_options() {
        return detail_options;
    }

    public void setDetail_options(String detail_options) {
        this.detail_options = detail_options;
    }

    public String getDetail_value() {
        return detail_value;
    }

    public void setDetail_value(String detail_value) {
        this.detail_value = detail_value;
    }
}
