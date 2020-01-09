package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Provide;
import com.hniois.trace.service.ProvideService;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By javaMan
 * 2018/6/28  11:24
 * 追溯  供应商 controller...
 */
@Controller
@RequestMapping(value = "/provide")
public class ProvideController extends BaseController {

    @Resource(name = "provideService")
    private ProvideService provideService;

    private String provide_list = "trace/provide/provide_list";
    private String provide_edit = "trace/provide/provide_edit";

    /**
     * 进入list 分页页面
     * @param page
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
//        ModelAndView mv = getModelAndView();
        mv.setViewName(provide_list);
        return mv;
    }

    /**
     *  iframe 分页 请求
     * @param provide
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Provide provide) throws Exception {
        // 当前页
        int currPage = getThisPage(provide.getPage());
        // 每页显示条数
        int limit = getThisLimit(provide.getLimit());
        provide.setOffset((currPage-1)*limit);
        provide.setPageSize(limit);
        Page page = provideService.findPage(provide);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 Or 修改 页面
     * @param provide
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(Provide provide) throws Exception {
        ModelAndView mv = getModelAndView();
        Provide pr = new Provide();
        if(StringUtils.isNotEmpty(provide.getId())) {
            pr = provideService.find(provide);
        }
        pr.setCode(provide.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("provide", pr);
        mv.setViewName(provide_edit);
        return mv;
    }

    /**
     * 新增供应商信息
     * @param provide
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Provide provide) {
        JSONObject obj = getMsg();//返回信息
        try {
            provideService.save(provide);
        } catch (Exception e) {
            setMsg(obj, "error", "新增供应商信息异常。。。");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 供应商修改
     * @param provide
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Provide provide) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(provide.getId())) {
            provideService.update(provide);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 单个删除
     * @param provide
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Provide provide) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(provide.getId())) {
            provideService.delete(provide);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param provide
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Provide provide) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(provide.getData() != null && provide.getData().size() > 0) {
            provideService.deleteBatch(provide);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 导出Excel
     * @param provide
     */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Provide provide) throws Exception {
        //导出工具
        ExportExcelUtil<Provide> export =  new ExportExcelUtil<Provide>();
        //文件名称
        String filename = "Provide_list" + DateUtil.getTimes();
        //导出数据信息
        List list = provideService.findPage(provide).getData();
        //执行导出
        doExport(filename,list,export);
    }
}
