package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Retailer;
import com.hniois.trace.service.RetailerService;
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
 * 2018/6/29  9:20
 *
 * 追溯  销售商 controller
 */
@Controller
@RequestMapping(value = "/retailer")
public class RetailerController extends BaseController {

    @Resource(name = "retailerService")
    private RetailerService retailerService;

    private String retailer_list = "trace/retailer/retailer_list";
    private String retailer_edit = "trace/retailer/retailer_edit";

    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(retailer_list);
        return mv;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Retailer retailer) throws Exception {
        // 当前页
        int currPage = getThisPage(retailer.getPage());
        // 每页显示条数
        int limit = getThisLimit(retailer.getLimit());
        retailer.setOffset((currPage-1)*limit);
        retailer.setPageSize(limit);
        Page page = retailerService.findPage(retailer);
        return JSON.toJSONString(page);
    }

    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(Retailer retailer) throws Exception {
        ModelAndView mv = getModelAndView();
        Retailer ret = new Retailer();
        if(StringUtils.isNotEmpty(retailer.getId())) {
            ret = retailerService.find(retailer);
        }
        ret.setCode(retailer.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("retailer", ret);
        mv.setViewName(retailer_edit);
        return mv;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Retailer retailer) {
        JSONObject obj = getMsg();//返回信息
        try {
            retailerService.save(retailer);
        } catch (Exception e) {
            setMsg(obj, "error", "新增销售商信息异常。。。");
            e.printStackTrace();
        }
        return obj.toString();
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Retailer retailer) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(retailer.getId())) {
            retailerService.update(retailer);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Retailer retailer) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(retailer.getId())) {
            retailerService.delete(retailer);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Retailer retailer) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(retailer.getData() != null && retailer.getData().size() > 0) {
            retailerService.deleteBatch(retailer);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Retailer retailer) throws Exception {
        //导出工具
        ExportExcelUtil<Retailer> export =  new ExportExcelUtil<Retailer>();
        //文件名称
        String filename = "Retailer_list" + DateUtil.getTimes();
        //导出数据信息
        List list = retailerService.findPage(retailer).getData();
        //执行导出
        doExport(filename,list,export);
    }
}
