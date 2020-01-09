package com.hniois.controller.report;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.report.Report;
import com.hniois.entity.report.ReportDetail;
import com.hniois.service.report.ReportDetailService;
import com.hniois.service.report.ReportService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/reportDetail")
public class ReportDetailAction extends BaseController {

    @Resource(name = "reportDetailService")
    private ReportDetailService reportDetailService;

    @Resource(name = "reportService")
    private ReportService reportService;

    private String list = "report/detail_list";
    private String edit = "report/detail_edit";


    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(ReportDetail rd) throws Exception {
        // 当前页
        int currPage = getThisPage(rd.getPage());
        // 每页显示条数
        int limit = getThisLimit(rd.getLimit());
        rd.setOffset((currPage-1) * limit);
        rd.setPageSize(limit);
        Page page = reportDetailService.findPage(rd);
        return JSON.toJSONString(page);
    }

    /**
     *  新增 or 保存页面
     * @param rd
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(ReportDetail rd) throws Exception {
        ModelAndView mv = getModelAndView();
        ReportDetail reportDetail = new ReportDetail();
        if(StringUtils.isNotEmpty(rd.getDetails_id())){
            reportDetail = reportDetailService.find(rd);
        }
        reportDetail.setCode(rd.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("reportDetail",reportDetail);
//        Report report = new Report();
//        report.setStatus(1);
        List<Report> reports = reportService.findList(new Report());
        mv.addObject("reports", reports);
        mv.setViewName(edit);
        return mv;
    }

    /**
     *  添加
     * @param rd
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(ReportDetail rd) throws Exception {
        JSONObject obj = getMsg();//返回信息
        reportDetailService.save(rd);
        return obj.toString();
    }

    /**
     *  修改
     * @param rd
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(ReportDetail rd) throws Exception {
        JSONObject obj = getMsg();//返回信息
        reportDetailService.update(rd);
        return obj.toString();
    }

    /**
     *  删除
     * @param rd
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(ReportDetail rd) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(rd.getDetails_id())) {
            reportDetailService.delete(rd);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

    /**
     *  批量删除
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(ReportDetail rd) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(!rd.getData().isEmpty()) {
            reportDetailService.deleteBatch(rd);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

}
