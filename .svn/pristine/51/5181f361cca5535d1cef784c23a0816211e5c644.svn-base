package com.hniois.controller.msg;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.quartz.CheckQuartz;
import com.hniois.entity.system.Role;
import com.hniois.entity.system.User;
import com.hniois.service.quartz.CheckQuartzManage;
import com.hniois.service.system.role.RoleManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import com.hniois.util.UuidUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/msg")
public class MessageAction extends BaseController{

    @Resource(name = "checkQuartzService")
    private CheckQuartzManage ckQuartzService;

    //角色
    @Resource(name="roleService")
    private RoleManage roleService;

    private String msg_list="msg/msg_list";
    private String msg_edit="msg/msg_edit";

    private String msg_user="msg/msg_user";
    /**
     * 跳转到报告统计页面
     * @param e
     * @return
     */
    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(msg_list);
        return mv;
    }

    @RequestMapping("/list")
    @ResponseBody
    public String reList(CheckQuartz e)throws Exception {
        //获取当前页面
        int currPage=getThisPage(e.getPage());
        //获取每页显示信息
        int limit=getThisLimit(e.getLimit());
        //设置起始下标
        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        User user = SessionManager.getUser();
        if(!user.getUser_id().equals("admin")){
            e.setRolename(user.getRole_name());
        }
        Page page = ckQuartzService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查看消息页面
     * @return
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView edit(CheckQuartz e) throws Exception{
        ModelAndView mv=this.getModelAndView();
        CheckQuartz quartz=new CheckQuartz();

        if(StringUtils.isNotEmpty(e.getId())){
            quartz=ckQuartzService.find(e);
            quartz.setRdstate("0");
            ckQuartzService.update(quartz);
        }
        mv.addObject("quartz",quartz);
        mv.setViewName(msg_edit);
        return mv;
    }

    /**
     * 删除数据
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(CheckQuartz e)throws Exception{
        net.sf.json.JSONObject obj=getMsg();
        if(e.getId()!=null){
            ckQuartzService.delete(e);
        }else{
            setMsg(obj,"delete failed","删除失败!");
        }

        return obj.toString();
    }

    /**
     * 批量删除数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(CheckQuartz e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){

            ckQuartzService.deleteBatch(e);
        }else{
            setMsg(obj,"delete failed","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 当前用户查看消息
     * @param e
     * @return
     */
    @RequestMapping("/scanner")
    public ModelAndView ScannerMsg(CheckQuartz e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(msg_user);
        return mv;
    }
    /**
     * 获取当前用户的提示信息数
     * @return
     * @throws Exception
     */
    @RequestMapping("/count")
    @ResponseBody
    public JSONArray msgCount() throws Exception {
        //获取当前登录用户
        User user = SessionManager.getUser();
        CheckQuartz ckQuartz=new CheckQuartz();
        if(!user.getUser_id().equals("admin")){
            ckQuartz.setRolename(user.getRole_name());
        }
        ckQuartz.setRdstate("1");//所有未读的消息
        int count=0;
        count=ckQuartzService.findCount(ckQuartz);
        return JSONArray.fromObject(count);
    }
}
