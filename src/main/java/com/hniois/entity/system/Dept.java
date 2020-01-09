package com.hniois.entity.system;

import com.hniois.common.page.Page;

import java.util.List;

/**
 * 组织机构
 */
public class Dept extends Page{
    /**基础字段
     ************************************************************/
    private String pId;
    private String theID;  //部门编码
    private String name;  //部门名称
    private String bz;  //备注
    private String user;    //部门领导
    /*************************************************************/
    private String pname; //上级部门名称
    private String username;//部门领导名称
    private String ids; //tree点击查询条件
    private List<Dept> children; //tree子集
    private Boolean spread = true; //tree 默认展开

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getTheID() {
        return theID;
    }

    public void setTheID(String theID) {
        this.theID = theID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public List<Dept> getChildren() {
        return children;
    }

    public void setChildren(List<Dept> children) {
        this.children = children;
    }

    public Boolean getSpread() {
        return spread;
    }

    public void setSpread(Boolean spread) {
        this.spread = spread;
    }
}
