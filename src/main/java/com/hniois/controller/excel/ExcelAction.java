package com.hniois.controller.excel;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.demo.Demo;
import com.hniois.entity.system.User;
import com.hniois.service.demo.DemoManage;
import com.hniois.service.system.user.UserManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Excel导入导出
 * */
@Controller
@RequestMapping(value="/excel")
public class ExcelAction extends BaseController{

    //导出数据页面
    private String excel_export = "excel/excel_export";

    /**
     * 查询
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list() throws Exception{
        Page page = new Page();
        Demo demo = SessionManager.getExcelDemo();
        List list = demo.getData();
        page.setData(list);
        page.setCount(list.size());
        return JSON.toJSONString(page);
    }

    /**
     * 跳转导出向导页面
     * @param
     */
    @RequestMapping(value="/toExport")
    public ModelAndView toExport(Demo e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Demo demo = SessionManager.getExcelDemo();
        //查询条件
        e.setShowSearch(demo.getShowSearch());
        //调用导出方法
        e.setUrl(demo.getUrl());
        mv.addObject("demo",e);
        mv.setViewName(excel_export);
        return mv;
    }


    /**
     * 初始化导出list
     * @param
     */
    @RequestMapping(value="/initExport")
    @ResponseBody
    public String initExport(Demo e) throws Exception{
        JSONObject obj = getMsg();//返回信息

        Demo demo = new Demo();
        demo.setData(JSONArray.fromObject(e.getShowlist()));
        demo.setShowSearch(e.getShowSearch());
        demo.setUrl(e.getUrl());
        Session session = SessionManager.getSession();
        session.setAttribute(Const.SESSION_excelDemo, demo);

        return obj.toString();
    }

    /**
     * 初始化导出list
     * @param
     */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public String doExport(Demo e) throws Exception{
        JSONObject obj = getMsg();//返回信息

        Session session = SessionManager.getSession();
        Demo demo = SessionManager.getExcelDemo();
        demo.setData(JSONArray.fromObject(e.getShowlist()));
        demo.setCheck(e.getCheck());
        session.setAttribute(Const.SESSION_excelDemo, demo);

        return obj.toString();
    }
}
