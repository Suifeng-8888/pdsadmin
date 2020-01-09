package com.hniois.entity.repertory;

import com.hniois.common.page.Page;

/**
 *  出入库计录
 */
public class PutRecord extends Page {

    private String id;
    private Integer record_type;
    private String odd_number;
    private String order_number;
    private String type;
    private String name;
    private String get_name;
    private String unit;
    private String number;
    private String time;
    private String operator;
    private String bz;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getRecord_type() {
        return record_type;
    }

    public void setRecord_type(Integer record_type) {
        this.record_type = record_type;
    }

    public String getOdd_number() {
        return odd_number;
    }

    public void setOdd_number(String odd_number) {
        this.odd_number = odd_number;
    }

    public String getOrder_number() {
        return order_number;
    }

    public void setOrder_number(String order_number) {
        this.order_number = order_number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGet_name() {
        return get_name;
    }

    public void setGet_name(String get_name) {
        this.get_name = get_name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}
