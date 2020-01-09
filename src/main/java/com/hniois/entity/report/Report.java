package com.hniois.entity.report;

import com.hniois.common.page.Page;

import java.util.List;

/**
 *  检测报告 Bean
 */
public class Report extends Page {

    private String record_id;
    private String serial_number;
    private String item_number;
    private String specimen_name;
    private String norm_id;
    private String accept_unit;
    private String detection_type;
    private String specimen_number;
    private String production_unit;
    private String sample_status;
    private String sampling_site;
    private String give_time;
    private String specimen_amount;
    private String sampling_number;
    private String condition;
    private String inspect_time;
    private String employ_facility;
    private String model;
    private String mach_id;
    private String inspect_gist;
    private String judge_gist;
    private String sign_time;
    private String conclusion;
    private String comment;
    private String lister;
    private String auditor;
    private String ratify;
    private Integer status;

    private String test_standard;

    private String tempId;

    public String getItem_number() {
        return item_number;
    }

    public void setItem_number(String item_number) {
        this.item_number = item_number;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getNorm_id() {
        return norm_id;
    }

    public void setNorm_id(String norm_id) {
        this.norm_id = norm_id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getMach_id() {
        return mach_id;
    }

    public void setMach_id(String mach_id) {
        this.mach_id = mach_id;
    }

    public String getTempId() {
        return tempId;
    }

    public void setTempId(String tempId) {
        this.tempId = tempId;
    }

    public String getTest_standard() {
        return test_standard;
    }

    public void setTest_standard(String test_standard) {
        this.test_standard = test_standard;
    }

    public String getRecord_id() {
        return record_id;
    }

    public void setRecord_id(String record_id) {
        this.record_id = record_id;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serial_number) {
        this.serial_number = serial_number;
    }

    public String getSpecimen_name() {
        return specimen_name;
    }

    public void setSpecimen_name(String specimen_name) {
        this.specimen_name = specimen_name;
    }

    public String getAccept_unit() {
        return accept_unit;
    }

    public void setAccept_unit(String accept_unit) {
        this.accept_unit = accept_unit;
    }

    public String getDetection_type() {
        return detection_type;
    }

    public void setDetection_type(String detection_type) {
        this.detection_type = detection_type;
    }

    public String getSpecimen_number() {
        return specimen_number;
    }

    public void setSpecimen_number(String specimen_number) {
        this.specimen_number = specimen_number;
    }

    public String getProduction_unit() {
        return production_unit;
    }

    public void setProduction_unit(String production_unit) {
        this.production_unit = production_unit;
    }

    public String getSample_status() {
        return sample_status;
    }

    public void setSample_status(String sample_status) {
        this.sample_status = sample_status;
    }

    public String getSampling_site() {
        return sampling_site;
    }

    public void setSampling_site(String sampling_site) {
        this.sampling_site = sampling_site;
    }

    public String getGive_time() {
        return give_time;
    }

    public void setGive_time(String give_time) {
        this.give_time = give_time;
    }

    public String getSpecimen_amount() {
        return specimen_amount;
    }

    public void setSpecimen_amount(String specimen_amount) {
        this.specimen_amount = specimen_amount;
    }

    public String getSampling_number() {
        return sampling_number;
    }

    public void setSampling_number(String sampling_number) {
        this.sampling_number = sampling_number;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getInspect_time() {
        return inspect_time;
    }

    public void setInspect_time(String inspect_time) {
        this.inspect_time = inspect_time;
    }

    public String getEmploy_facility() {
        return employ_facility;
    }

    public void setEmploy_facility(String employ_facility) {
        this.employ_facility = employ_facility;
    }

    public String getInspect_gist() {
        return inspect_gist;
    }

    public void setInspect_gist(String inspect_gist) {
        this.inspect_gist = inspect_gist;
    }

    public String getJudge_gist() {
        return judge_gist;
    }

    public void setJudge_gist(String judge_gist) {
        this.judge_gist = judge_gist;
    }

    public String getSign_time() {
        return sign_time;
    }

    public void setSign_time(String sign_time) {
        this.sign_time = sign_time;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getLister() {
        return lister;
    }

    public void setLister(String lister) {
        this.lister = lister;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public String getRatify() {
        return ratify;
    }

    public void setRatify(String ratify) {
        this.ratify = ratify;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
