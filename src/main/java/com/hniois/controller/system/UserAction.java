package com.hniois.controller.system;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.system.Role;
import com.hniois.entity.system.User;
import com.hniois.service.system.role.RoleManage;
import com.hniois.service.system.user.UserManage;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/user")
public class UserAction extends BaseController{
    //用户
    @Resource(name="userService")
    private UserManage userService;

    //角色
    @Resource(name="roleService")
    private RoleManage roleService;

    private String user_list = "system/user/user_list";
    private String user_edit = "system/user/user_edit";
    private String user_change = "system/user/user_change";
    private String user_img = "system/user/user_img";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(user_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(User e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = userService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(User e) throws Exception {
        List<User> list = userService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 查询count
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/findCount")
    @ResponseBody
    public String findCount(User e) throws Exception {
        Integer count = userService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(User e) throws Exception {
        User m = userService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(User e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        User user = new User();
        if(StringUtils.isNotEmpty(e.getId())){
            user = userService.find(e);
        }
        user.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("user",user);
        mv.setViewName(user_edit);
        List<Role> rlist = roleService.findList(new Role());
        mv.addObject("rlist",rlist);
        return mv;
    }

    /**
     * 保存
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(User e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        User p = new User();
        p.setUser_id(e.getUser_id());
        if(userService.findCount(p)>0){
            setMsg(obj,"error","用户ID已存在!");
        }else{
            String pass = new SimpleHash("SHA-1",e.getUser_id(),User.PASSWORD).toString();
            e.setPassword(pass);
            userService.save(e);
        }
        return obj.toString();
    }

    /**
     * 修改
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(User e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        User p = new User();
        p.setUser_id(e.getUser_id());
        List<User> list = userService.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getUser_id().equals(e.getUser_id()))){
            setMsg(obj,"error","操作失败!");
        }else{
            if (StringUtils.isNotEmpty(e.getPassword())) {
                String pass = new SimpleHash("SHA-1",e.getUser_id(),e.getPassword()).toString();
                e.setPassword(pass);
            }
            userService.update(e);
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(User e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        userService.delete(e);
        return obj.toString();
    }

    /**
     * 删除
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(User e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        userService.deleteBatch(e);
        return obj.toString();
    }

    /**
     * 修改密码页面
     * @param e 用户信息
     */
    @RequestMapping(value="/toChange")
    public ModelAndView toChange(User e) throws Exception {
        ModelAndView mv = getModelAndView();
        User user = new User();
        if (StringUtils.isNotEmpty(e.getId())) {
            user = userService.find(e);
        }
        mv.addObject("user",user);
        mv.setViewName(user_change);
        return mv;
    }

    /**
     * 编辑头像
     * @param e 用户信息
     */
    @RequestMapping(value="/toEditImgs")
    public ModelAndView toEditImgs(User e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        User user = new User();
        if(StringUtils.isNotEmpty(e.getId())){
            user = userService.find(e);
        }
        mv.addObject("user",user);
        mv.setViewName(user_img);
        return mv;
    }

    /**
     * 导出
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(User e) throws Exception {
        //导出工具
        ExportExcelUtil<User> export = new ExportExcelUtil<User>();
        //文件名称
        String filename = "UserList" + DateUtil.getTimes();
        //导出数据信息
        List list = userService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

}
