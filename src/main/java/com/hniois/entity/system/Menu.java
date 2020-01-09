package com.hniois.entity.system;

import com.hniois.common.page.Page;

import java.util.List;
/**
 *
 * 类名称：菜单
 */
public class Menu extends Page{
    /**基础字段
     ************************************************************/
    private String menu_id;
    private String menu_name;
    private String menu_url;
    private String menu_order;
    private String menu_icon;
    private String menu_type;
    private String menu_state;
    /*************************************************************/
    public final static String Menu_list = "1";
    public final static String Menu_button = "2";
    private String menu_ids;//tree查询 ids集合
    private List<Menu> children;//子菜单

    //z-tree字段相关
    private String pId;
    private String name;
    private String checked;

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public static String getMenu_list() {
        return Menu_list;
    }

    public static String getMenu_button() {
        return Menu_button;
    }

    public String getMenu_ids() {
        return menu_ids;
    }

    public void setMenu_ids(String menu_ids) {
        this.menu_ids = menu_ids;
    }

    public String getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(String menu_id) {
        this.menu_id = menu_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getMenu_url() {
        return menu_url;
    }

    public void setMenu_url(String menu_url) {
        this.menu_url = menu_url;
    }

    public String getMenu_order() {
        return menu_order;
    }

    public void setMenu_order(String menu_order) {
        this.menu_order = menu_order;
    }

    public String getMenu_icon() {
        return menu_icon;
    }

    public void setMenu_icon(String menu_icon) {
        this.menu_icon = menu_icon;
    }

    public String getMenu_type() {
        return menu_type;
    }

    public void setMenu_type(String menu_type) {
        this.menu_type = menu_type;
    }

    public String getMenu_state() {
        return menu_state;
    }

    public void setMenu_state(String menu_state) {
        this.menu_state = menu_state;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
