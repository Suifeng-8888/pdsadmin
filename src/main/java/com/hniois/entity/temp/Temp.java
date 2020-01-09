package com.hniois.entity.temp;

import com.hniois.common.page.Page;

/**
*  模板 Bean
*/
public class Temp extends Page{
    /**基础字段
     ************************************************************/
    private String id; //
    private String temp_id; //模版KEY
    private String temp_name; //模版名称
    private String temp_comment; //模版注释
    /*************************************************************/

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTemp_id() {
        return temp_id;
    }

    public void setTemp_id(String temp_id) {
        this.temp_id = temp_id;
    }

    public String getTemp_name() {
        return temp_name;
    }

    public void setTemp_name(String temp_name) {
        this.temp_name = temp_name;
    }

    public String getTemp_comment() {
        return temp_comment;
    }

    public void setTemp_comment(String temp_comment) {
        this.temp_comment = temp_comment;
    }


}
