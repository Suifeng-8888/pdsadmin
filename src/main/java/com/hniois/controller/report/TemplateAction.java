package com.hniois.controller.report;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.report.Template;
import com.hniois.service.report.TemplateService;
import com.hniois.util.DateUtil;
import com.hniois.util.FileUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @Version V1.0.0
 * @Since 1.0
 * @Date 2018/5/3
 * 报告模板 controller
 */
@Controller
@RequestMapping(value = "/template")
public class TemplateAction extends BaseController{

    @Resource(name = "templateService")
    private TemplateService templateService;

    private String list = "report/template_list";

    private String edit = "report/template_edit";

    /**
     *
     * @param page
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     *
     * @param e
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Template e) throws Exception {
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());
        e.setOffset((currPage-1) * limit);
        e.setPageSize(limit);
        Page page = templateService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toEdit() {
        ModelAndView mv = getModelAndView();
        mv.setViewName(edit);
        return mv;
    }

    /**
     *
     * @param template
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Template template) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(template != null) {
            template.setUp_name(SessionManager.getUsername());
            template.setTime(DateUtil.getDay());
            templateService.save(template);
        } else {
            setMsg(obj, "error", "参数不能为空。");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param template
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Template template, HttpServletRequest request) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(template.getId())) {
            // 删除模板信息
            templateService.delete(template);
            // 删除模板文件
            String path = request.getSession().getServletContext().getRealPath("/");// 根路径
            String filePath = path + template.getPath();
            FileUtil.deleteFile(filePath);
        } else {
            setMsg(obj,"error","参数不能为空。");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param template
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Template template) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(!template.getData().isEmpty()) {
            templateService.deleteBatch(template);
        } else {
            setMsg(obj, "error", "参数不能为空");
        }
        return obj.toString();
    }
}
