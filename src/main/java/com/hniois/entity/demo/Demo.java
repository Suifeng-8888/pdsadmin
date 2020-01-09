package com.hniois.entity.demo;

import com.hniois.common.page.Page;

import java.util.List;

/**
 * 代码生成工具类
 * */
public class Demo extends Page{
    private String tableName;//表名
    private String demo;//模版名称
    private String demoName;//模版描述

    private String name;//字段名称
    private String nameUp;//字段名称
    private String type;//字段类型
    private String comment;//字段备注
    private String check;//验证必填
    private String showlist;//查询显示
    private String showSearch;//查询条件
    private String order;//排序
    private String url;//ajax获取路径

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo;
    }

    public String getDemoName() {
        return demoName;
    }

    public void setDemoName(String demoName) {
        this.demoName = demoName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNameUp() {
        return nameUp;
    }

    public void setNameUp(String nameUp) {
        this.nameUp = nameUp;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    public String getShowlist() {
        return showlist;
    }

    public void setShowlist(String showlist) {
        this.showlist = showlist;
    }

    public String getShowSearch() {
        return showSearch;
    }

    public void setShowSearch(String showSearch) {
        this.showSearch = showSearch;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
}
