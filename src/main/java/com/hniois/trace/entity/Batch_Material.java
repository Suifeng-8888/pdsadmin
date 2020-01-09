package com.hniois.trace.entity;

import com.hniois.common.page.Page;

import java.util.List;

/**
 * 批次用料对象，某一产品下的生产记录添加产品批次，然后再为该批次追加用料信息
 */
public class Batch_Material extends Page{
    private String batch_id;//批次id
    private String record_id;//生产记录id
    private String record_num;//生产记录号
    private String pro_code;//产品条码
    private String pro_name;//产品名称
    private String batch;//产品批次号
    private String batch_num;//加工数量
    private String btime;//加工时间

    private List<TraceData> datas;

    //扩展字段
    private String fill_time;//记录时间
    private Integer attach_id;//附件材料序号(关联附件材料详细信息)

    public String getBatch_id() {
        return batch_id;
    }

    public void setBatch_id(String batch_id) {
        this.batch_id = batch_id;
    }

    public String getRecord_id() {
        return record_id;
    }

    public void setRecord_id(String record_id) {
        this.record_id = record_id;
    }

    public String getRecord_num() {
        return record_num;
    }

    public void setRecord_num(String record_num) {
        this.record_num = record_num;
    }

    public String getPro_code() {
        return pro_code;
    }

    public void setPro_code(String pro_code) {
        this.pro_code = pro_code;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getBatch_num() {
        return batch_num;
    }

    public void setBatch_num(String batch_num) {
        this.batch_num = batch_num;
    }

    public String getBtime() {
        return btime;
    }

    public void setBtime(String btime) {
        this.btime = btime;
    }

    public String getFill_time() {
        return fill_time;
    }

    public void setFill_time(String fill_time) {
        this.fill_time = fill_time;
    }

    public Integer getAttach_id() {
        return attach_id;
    }

    public void setAttach_id(Integer attach_id) {
        this.attach_id = attach_id;
    }

    public List<TraceData> getDatas() {
        return datas;
    }

    public void setDatas(List<TraceData> datas) {
        this.datas = datas;
    }
}
