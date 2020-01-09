package com.hniois.entity.report;

import com.hniois.common.page.Page;

/**
 * @Version V1.0.0
 * @Since 1.0
 * @Date 2018/5/3
 * 报告模板
 */
public class Template extends Page {
    private String id;
    private String name;
    private String version;
    private String path;
    private String up_name;
    private String time;
    private String bz;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUp_name() {
        return up_name;
    }

    public void setUp_name(String up_name) {
        this.up_name = up_name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}

