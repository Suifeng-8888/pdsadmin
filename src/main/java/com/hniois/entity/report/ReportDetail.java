package com.hniois.entity.report;

import com.hniois.common.page.Page;

/**
 *  检测报告详细 Bean
 */
public class ReportDetail extends Page {

    private String details_id;//    检测详情id
    private String record_id;// 检测报告id
    private String detection_item;//    检测项目
    private String norm_claim;//    标准要求
    private String detection_result;//  检验结果
    private String detection_limit;//   检出限
    private String only_verdict;//  单项结论

    private String serial_number;   //报告编号

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serial_number) {
        this.serial_number = serial_number;
    }

    public String getDetails_id() {
        return details_id;
    }

    public void setDetails_id(String details_id) {
        this.details_id = details_id;
    }

    public String getRecord_id() {
        return record_id;
    }

    public void setRecord_id(String record_id) {
        this.record_id = record_id;
    }

    public String getDetection_item() {
        return detection_item;
    }

    public void setDetection_item(String detection_item) {
        this.detection_item = detection_item;
    }

    public String getNorm_claim() {
        return norm_claim;
    }

    public void setNorm_claim(String norm_claim) {
        this.norm_claim = norm_claim;
    }

    public String getDetection_result() {
        return detection_result;
    }

    public void setDetection_result(String detection_result) {
        this.detection_result = detection_result;
    }

    public String getDetection_limit() {
        return detection_limit;
    }

    public void setDetection_limit(String detection_limit) {
        this.detection_limit = detection_limit;
    }

    public String getOnly_verdict() {
        return only_verdict;
    }

    public void setOnly_verdict(String only_verdict) {
        this.only_verdict = only_verdict;
    }
}
