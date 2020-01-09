package com.hniois.controller.system;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.Menu;
import com.hniois.entity.system.Role;
import com.hniois.service.system.menu.MenuManage;
import com.hniois.service.system.role.RoleManage;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/menu")
public class MenuAction extends BaseController{
    //菜单
    @Resource(name="menuService")
    private MenuManage menuService;
    //角色
    @Resource(name="roleService")
    private RoleManage roleService;

    private String menu_list = "system/menu/menu_list";
    private String menu_edit = "system/menu/menu_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(menu_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Menu e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = menuService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Menu e) throws Exception {
        List<Menu> list = menuService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 查询count
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findCount")
    @ResponseBody
    public String findCount(Menu e) throws Exception {
        Integer count = menuService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Menu e) throws Exception {
        Menu m = menuService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     * @param e
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toEdit(Menu e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Menu menu = new Menu();
        if(StringUtils.isNotEmpty(e.getMenu_id())){
            menu = menuService.find(e);
        }
        menu.setCode(e.getCode());
        mv.addObject("menu",menu);
        mv.setViewName(menu_edit);
        return mv;
    }

    /**
     * 保存
     * @param e
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Menu e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Menu p = new Menu();
        p.setMenu_id(e.getMenu_id());
        if(menuService.findCount(p)>0){
            setMsg(obj,"error","菜单ID已存在!");
        }else{
            menuService.save(e);
        }
        return obj.toString();
    }

    /**
     * 修改
     * @param e
     * @return json
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Menu e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Menu p = new Menu();
        p.setMenu_id(e.getMenu_id());
        List<Menu> list = menuService.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getMenu_id().equals(e.getMenu_id()))){
            setMsg(obj,"error","菜单ID已存在!");
        }else{
            menuService.update(e);
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(Menu e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e!=null){
            menuService.delete(e);
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Menu e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e!=null){
            menuService.deleteBatch(e);
        }
        return obj.toString();
    }

    /**
     * 查询 Z-tree List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findTreeList")
    @ResponseBody
    public String findTreeList(Menu e,Role r) throws Exception {
        List<Menu> list = menuService.findTreeList(e);
        //判断角色 默认勾选
        if(StringUtils.isNotEmpty(r.getRole_id())){
            Role role = roleService.find(r);
            String checked = ","+role.getRights();
            for(Menu m : list){
                if(checked.indexOf(","+m.getId()+",")>=0){
                    m.setChecked("true");
                }
            }
        }
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }
}
