package com.hniois.controller.system;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.Dept;
import com.hniois.entity.system.User;
import com.hniois.service.system.dept.DeptManage;
import com.hniois.service.system.user.UserManage;
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
@RequestMapping(value="/dept")
public class DeptAction extends BaseController{
    //用户
    @Resource(name="deptService")
    private DeptManage deptService;

    //用户
    @Resource(name="userService")
    private UserManage userService;

    private String dept_list = "system/dept/dept_list";
    private String dept_edit = "system/dept/dept_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(dept_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Dept e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = deptService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Dept e) throws Exception {
        List<Dept> list = deptService.findList(e);
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
    public String findCount(Dept e) throws Exception {
        Integer count = deptService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Dept e) throws Exception {
        Dept m = deptService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Dept e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Dept dept = new Dept();

        if(StringUtils.isNotEmpty(e.getId())){
            dept = deptService.find(e);
        }
        dept.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("dept",dept);
        mv.setViewName(dept_edit);
        List<User> ulist = userService.findList(new User());
        mv.addObject("ulist",ulist);
        return mv;
    }

    /**
     * 保存
     * @param e
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Dept e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Dept p = new Dept();
        p.setTheID(e.getTheID());
        if(deptService.findCount(p)>0){
            setMsg(obj,"error","部门编号已存在!");
        }else{
            deptService.save(e);
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
    public String update(Dept e) throws Exception {
        JSONObject obj = getMsg();//返回信息

        //验证编码重复
        if(StringUtils.isNotEmpty(e.getTheID())){
            Dept p = new Dept();
            p.setTheID(e.getTheID());
            List<Dept> list = deptService.findList(p);
            if(list != null && list.size() > 0 && !(list.get(0).getId().equals(e.getId()))){
                setMsg(obj,"error","部门编码已存在!");
            }
        }

        //验证名称重复
        if(StringUtils.isNotEmpty(e.getName())){
            Dept p2 = new Dept();
            p2.setName(e.getName());
            List<Dept> list2 = deptService.findList(p2);
            if(list2 != null && list2.size() > 0 && !(list2.get(0).getId().equals(e.getId()))){
                setMsg(obj,"error","部门名称已存在!");
            }
        }

        //执行修改
        if(obj.get("state").equals("ok")){
            deptService.update(e);
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
    public String delete(Dept e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        deptService.delete(e);
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Dept e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        deptService.deleteBatch(e);
        return obj.toString();
    }


    /**
     * 查询TreeList
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findTreeList")
    @ResponseBody
    public String findTreeList(Dept e) throws Exception {
        List<Dept> list = deptService.findTreeList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }
}
