package com.hniois.controller.system;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.Role;
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
@RequestMapping(value="/role")
public class RoleAction extends BaseController{
    //角色
    @Resource(name="roleService")
    private RoleManage roleService;

    private String role_list = "system/role/role_list";
    private String role_edit = "system/role/role_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(role_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Role e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = roleService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Role e) throws Exception {
        List<Role> list = roleService.findList(e);
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
    public String findCount(Role e) throws Exception {
        Integer count = roleService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Role e) throws Exception {
        Role m = roleService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     * @param e
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toEdit(Role e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Role role = new Role();
        if(StringUtils.isNotEmpty(e.getRole_id())){
            role = roleService.find(e);
        }
        role.setCode(e.getCode());
        mv.addObject("role",role);
        mv.setViewName(role_edit);
        return mv;
    }

    /**
     * 保存
     * @param e
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Role e) {
        JSONObject obj = getMsg();//返回信息
        Role p = new Role();
        p.setRole_name(e.getRole_name());
        try {
            if(roleService.findCount(p)>0){
                setMsg(obj,"error","角色已存在!");
            }else{
                roleService.save(e);
            }
        } catch (Exception e1) {
            setMsg(obj, "error", "角色创建失败");
            e1.printStackTrace();
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
    public String update(Role e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Role p = new Role();
        p.setRole_name(e.getRole_name());
        List<Role> list = roleService.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getRole_id().equals(e.getRole_id()))){
            setMsg(obj,"error","角色已存在!");
        }else{
            roleService.update(e);
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
    public String delete(Role e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e!=null){
            roleService.delete(e);
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
    public String deletes(Role e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e!=null){
            roleService.deleteBatch(e);
        }
        return obj.toString();
    }

}
