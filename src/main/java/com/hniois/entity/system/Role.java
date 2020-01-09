package com.hniois.entity.system;

import com.hniois.common.page.Page;

public class Role extends Page{
    /**基础字段
     ************************************************************/
    private String role_id;
    private String role_name;
    private String rights;
    /*************************************************************/

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRights() {
        return rights;
    }

    public void setRights(String rights) {
        this.rights = rights;
    }
}
