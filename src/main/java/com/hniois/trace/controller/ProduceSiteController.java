package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.ProduceSite;
import com.hniois.trace.service.ProduceSiteService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Create By javaMan
 * 2018/6/29  17:56
 * 生产地址
 */
@Controller
@RequestMapping(value = "/produce_site")
public class ProduceSiteController extends BaseController {

    @Resource(name = "produceSiteService")
    private ProduceSiteService produceSiteService;

    private String list = "trace/produceSite/produceSite_list";
    private String edit = "trace/produceSite/produceSite_edit";

    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndView();
        mv.setViewName(list);
        return mv;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(ProduceSite produceSite) throws Exception {
        // 当前页
        int currPage = getThisPage(produceSite.getPage());
        // 每页显示条数
        int limit = getThisLimit(produceSite.getLimit());
        produceSite.setOffset((currPage-1)*limit);
        produceSite.setPageSize(limit);
        Page page = produceSiteService.findPage(produceSite);
        return JSON.toJSONString(page);
    }

    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(ProduceSite produceSite) throws Exception {
        ModelAndView mv = getModelAndView();
        ProduceSite ps = new ProduceSite();
        if(StringUtils.isNotEmpty(produceSite.getId())) {
            ps = produceSiteService.find(produceSite);
        }
        ps.setCode(produceSite.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("produceSite", ps);
        mv.setViewName(edit);
        return mv;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(ProduceSite produceSite) {
        JSONObject obj = getMsg();//返回信息
        try {
            produceSiteService.save(produceSite);
        } catch (Exception e) {
            setMsg(obj, "error", "新增信息异常。。。");
            e.printStackTrace();
        }
        return obj.toString();
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(ProduceSite produceSite) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(produceSite.getId())) {
            produceSiteService.update(produceSite);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(ProduceSite produceSite) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(produceSite.getId())) {
            produceSiteService.delete(produceSite);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(ProduceSite produceSite) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(produceSite.getData() != null && produceSite.getData().size() > 0) {
            produceSiteService.deleteBatch(produceSite);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

}
