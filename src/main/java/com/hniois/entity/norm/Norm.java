package com.hniois.entity.norm;

import com.hniois.common.page.Page;


/**
 *  标准bean
 */
public class Norm extends Page {

    private String id;
    private String norm_name;
    private String norm_number;
    private String create_time;
    private String norm_creator;
    private String norm_explain;
    private String norm_type;
    private String award_dept;

    public String getNorm_type() {
        return norm_type;
    }

    public void setNorm_type(String norm_type) {
        this.norm_type = norm_type;
    }

    public String getAward_dept() {
        return award_dept;
    }

    public void setAward_dept(String award_dept) {
        this.award_dept = award_dept;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNorm_name() {
        return norm_name;
    }

    public void setNorm_name(String norm_name) {
        this.norm_name = norm_name;
    }

    public String getNorm_number() {
        return norm_number;
    }

    public void setNorm_number(String norm_number) {
        this.norm_number = norm_number;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getNorm_creator() {
        return norm_creator;
    }

    public void setNorm_creator(String norm_creator) {
        this.norm_creator = norm_creator;
    }

    public String getNorm_explain() {
        return norm_explain;
    }

    public void setNorm_explain(String norm_explain) {
        this.norm_explain = norm_explain;
    }
}
