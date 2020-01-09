package com.hniois.trace.entity;

import com.hniois.common.page.Page;

/**
 * Create By javaMan
 * 2018/7/3  15:39
 *
 * 生产地址 entity...
 */
public class ProduceSite extends Page {

    private String id;
    private String uid;
    private String type;
    private String site;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }
}
