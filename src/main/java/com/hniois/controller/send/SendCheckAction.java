package com.hniois.controller.send;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.send.SendCheck;
import com.hniois.service.item.ItemManage;
import com.hniois.service.send.SendManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * 送检列表
 */
@Controller
@RequestMapping("/send")
public class SendCheckAction extends BaseController {

    @Resource(name = "sendService")
    private SendManage sendService;
    @Resource(name = "itemService")
    private ItemManage itemService;

    private String send_list="send/send_list";
    private String send_edit="send/send_edit";
    private String send_table="send/send_table";

    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(send_list);
        return mv;
    }

    @RequestMapping("/list")
    @ResponseBody
    public String show(SendCheck e)throws Exception{
        //获取当前页面
        int currPage=getThisPage(e.getPage());
        //获取每页显示信息
        int limit=getThisLimit(e.getLimit());
        //设置起始下标
        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page= sendService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 录入检测结果页面
     * @return
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView edit(SendCheck e) throws Exception{
        ModelAndView mv = getModelAndView();
        SendCheck send = new SendCheck();
        if(StringUtils.isNotEmpty(e.getId())) {
            send = sendService.find(e);
        }
        mv.addObject("send",send);
        mv.setViewName(send_edit);
        return mv;
    }

    /**
     *
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(SendCheck e) throws Exception {
        JSONObject obj = getMsg();
        if(StringUtils.isNotEmpty(e.getId())) {
            sendService.update(e);
        } else {
            setMsg(obj, "error", "参数不能为空!");
        }
        return obj.toString();
    }

    /**
     * 删除数据
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(SendCheck e) throws Exception{
        net.sf.json.JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getId())){
            sendService.delete(e);
        }else{
            setMsg(obj,"error","参数不能为空!");
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
    public String deletes(SendCheck e) throws Exception{
        JSONObject obj = getMsg();
        if(e.getData() != null && !e.getData().isEmpty()){
            sendService.deleteBatch(e);
        }else{
            setMsg(obj,"error","参数不能为空!");
        }
        return obj.toString();
    }

    /**
     * 检测报告选择
     * @return
     */
    @RequestMapping("/jcbg")
    public ModelAndView jcbg() {
        ModelAndView mv = getModelAndView();
        mv.setViewName(send_table);
        return mv;
    }
}
