package com.hniois.service.system.menu;

import com.hniois.common.service.Service;
import com.hniois.entity.system.Menu;
import net.sf.json.JSONArray;

import java.util.List;

/**
 * 菜单接口
 */
public interface MenuManage extends Service<Menu>{

    /**
     * 树形查询
     * @param e
     * @return List<Menu>
     * */
    List<Menu> findTreeMenu(Menu e) throws Exception;

    /**
     * 树形查询
     * @param e
     * @return List<Menu>
     * */
    List<Menu> findTreeList(Menu e) throws Exception;

    /**
     * 获取权限集
     * @param e
     * @return string 权限id集合 {10,20,30...}
     * */
    List<Menu>  getMenuButton(Menu e) throws Exception;
}
