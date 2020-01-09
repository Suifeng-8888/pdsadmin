package com.hniois.controller.report;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.item.Item;
import com.hniois.entity.norm.Norm;
import com.hniois.entity.norm.NormDetail;
import com.hniois.entity.report.Report;
import com.hniois.entity.report.ReportDetail;
import com.hniois.entity.report.Statistics;
import com.hniois.entity.report.Template;
import com.hniois.service.item.ItemManage;
import com.hniois.service.norm.NormDetailService;
import com.hniois.service.norm.NormService;
import com.hniois.service.report.ReportDetailService;
import com.hniois.service.report.ReportService;
import com.hniois.service.report.StatisticsService;
import com.hniois.service.report.TemplateService;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportWordUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *  检测报告    Action
 */
@Controller
@RequestMapping(value = "/report")
public class ReportAction extends BaseController {

//    检测报告service
    @Resource(name = "reportService")
    private ReportService reportService;

//  样品service
    @Resource(name = "itemService")
    private ItemManage itemService;

//    检测标准service
    @Resource(name = "normService")
    private NormService normService;

//    报告详情service
    @Resource(name = "reportDetailService")
    private ReportDetailService reportDetailService;

//    标准详情service
    @Resource(name = "normDetailService")
    private NormDetailService normDetailService;

//    报告模板service
    @Resource(name = "templateService")
    private TemplateService templateService;

//    报告统计service
    @Resource(name = "statisticsService")
    private StatisticsService statisticsService;

    private String list = "report/report_list";
    private String edit = "report/report_edit";
    private String down = "report/report_down";
    private String ypmc = "report/report_ypmc";

    //新增仪器弹框页面
    private String mach_table="report/mach_table";

    /**
     * 进入检测报告页面
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 检测报告分页列表
     * @param report
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Report report) throws Exception {
        // 当前页
        int currPage = getThisPage(report.getPage());
        // 每页显示条数
        int limit = getThisLimit(report.getLimit());
        report.setOffset((currPage-1) * limit);
        report.setPageSize(limit);
        Page page = reportService.findPage(report);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 修改    页面
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView addORUpd(Report e) throws Exception {
        ModelAndView mv = getModelAndView();
        Report report = new Report();
        if (StringUtils.isNotEmpty(e.getRecord_id()) || StringUtils.isNotEmpty(e.getSerial_number())) {
            report = reportService.find(e);
        }
        report.setCode(e.getCode());  // 判断：0查看 or 1 增加/修改
        mv.setViewName(edit);
        Item item = new Item();
     //   item.setState("0");
        item.setChecked("0");
        List<Item> items = itemService.findList(item);
        List<Norm> norms = normService.findList(new Norm());
        mv.addObject("items",items);
        mv.addObject("norms", norms);
        mv.addObject("report", report);
        return mv;
    }

    /**
     *  添加
     * @param report
     * @return
     */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Report report) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Report e = new Report();
        e.setSerial_number(report.getSerial_number());
        if(reportService.findCount(e) > 0) {
            setMsg(obj, "error", "报告编号已经存在!");
        } else {
            report.setLister(SessionManager.getUsername());
            reportService.save(report);
            NormDetail normDetail = new NormDetail();
            normDetail.setNorm_id(report.getNorm_id().toString());
            normDetail.setDetail_object(report.getSpecimen_name());
            List<NormDetail> normDetails = normDetailService.findList(normDetail);
            List<ReportDetail> reportDetails = new ArrayList<ReportDetail>();
            if (normDetails.size() > 0) {
                for (NormDetail nd: normDetails){
                    ReportDetail reportDetail = new ReportDetail();
                    reportDetail.setRecord_id(report.getRecord_id());
                    reportDetail.setDetection_item(nd.getDetail_options());
                    reportDetail.setNorm_claim(nd.getDetail_value());
                    reportDetail.setDetection_limit(nd.getValue_updown());
                    reportDetails.add(reportDetail);
                }
                reportDetailService.saveBatch(reportDetails);
            }
        }
        return obj.toString();
    }

    /**
     *  更新
     * @param report
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Report report) throws Exception {
        JSONObject obj = getMsg();//返回信息 默认成功
        if(StringUtils.isNotEmpty(report.getRecord_id())) {
            reportService.update(report);
        } else {
            setMsg(obj, "error", "参数不能为空!");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param report
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Report report) {
        JSONObject obj = getMsg();//返回信息 默认成功
        try {
            if (report.getRecord_id() != null) {
                reportService.delete(report);
            } else {
                setMsg(obj,"error","参数不能为空!");
            }
        } catch (Exception e) {
            setMsg(obj,"error","删除失败!");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param report
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Report report) {
        JSONObject obj = getMsg();//返回信息 默认成功
        try {
            if(report.getData() != null) {
                reportService.deleteBatch(report);
            } else {
                setMsg(obj,"error","参数不能为空!");
            }
        } catch (Exception e) {
            setMsg(obj,"error","删除失败!");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 查询List
     * @param report
     * @return
     */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Report report) {
        List<Report> list = null;
        try {
            list = reportService.findList(report);
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     *  报告审核
     * @param report
     * @return
     */
    @RequestMapping(value = "/upaudit")
    @ResponseBody
    public String upAudit(Report report) {
        JSONObject obj = getMsg();//返回信息 默认成功
        try {
            if (report.getData() != null) {
                String userName = SessionManager.getUsername();
                // 审核,审批暂设置为同一人
                report.setAuditor(userName);
                report.setRatify(userName);
                reportService.updateBatch(report);
            } else {
                setMsg(obj,"error","参数不能为空!");
            }
        } catch (Exception e) {
            setMsg(obj,"error","审核失败!");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 报告模板选择页面
     * @param record_id
     * @return
     */
    @RequestMapping(value = "/showdown")
    @ResponseBody
    public ModelAndView showDown(String record_id,String serial_number) throws Exception {
        ModelAndView mv = getModelAndView();
        mv.setViewName(down);
        List<Template> templates = templateService.findList(new Template());
        mv.addObject("record_id", record_id);
        mv.addObject("serial_number", serial_number);
        mv.addObject("templates", templates);
        return mv;
    }

    /**
     * world报告生成
     * @param re
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/downreport")
    @ResponseBody
    public Map downReport(HttpServletRequest request, HttpServletResponse response, Report re) throws Exception {
        Map map = new HashMap();
        JSONObject obj = getMsg();
        // 生成的world报告路径
        String worldPath = "";
        if (re != null && StringUtils.isNotEmpty(re.getRecord_id()) && StringUtils.isNotEmpty(re.getTempId())) {
            Report report = reportService.find(re);
            ReportDetail rd = new ReportDetail();
            rd.setRecord_id(report.getRecord_id());
            List<ReportDetail> reportDetails = reportDetailService.findList(rd);
            Template tp = new Template();
            tp.setId(re.getTempId());
            Template template = templateService.find(tp);
            String path = template.getPath();
            String tempName = template.getName();
            try {
                worldPath = keyToVal(report, reportDetails, path, request, response);
//            添加报告统计
                if(StringUtils.isNotEmpty(worldPath)) {
                    Statistics statistics = new Statistics();
                    statistics.setSerial_number(re.getSerial_number());
                    statistics.setTemplate_name(tempName);
                    statistics.setPath(worldPath);
                    statistics.setCreat_time(DateUtil.getDay());
                    statisticsService.save(statistics);
                }

            } catch (Exception e){
                setMsg(obj,"error","报告生成失败!");
                e.printStackTrace();
            }
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        map.put("obj",obj);
        map.put("worldPath", worldPath);
        return map;
    }

    /**
     * 报告模板对应数据信息
     * @param report
     * @param reportDetails
     * @param path
     */
    public String keyToVal(Report report, List<ReportDetail> reportDetails,String path,
                         HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
        Map<String, String> map = new HashMap<String, String>();
//        进行报告共有部分world替换
        map.put("${报告编号}", (report.getSerial_number() == null ? "" : report.getSerial_number()));
        map.put("${样品名称}", (report.getSpecimen_name() == null ? "" : report.getSpecimen_name()));
        map.put("${送检单位}", (report.getAccept_unit() == null ? "" : report.getAccept_unit()));
        map.put("${检验类别}", (report.getDetection_type() == null ? "" : report.getDetection_type()));
        map.put("${样品编号}", (report.getItem_number() == null ? "" : report.getItem_number()));
        map.put("${受检单位}", (report.getAccept_unit() == null ? "" : report.getAccept_unit()));
        map.put("${检验类别}", (report.getDetection_type() == null ? "" : report.getDetection_type()));
        map.put("${生产单位}", (report.getProduction_unit() == null ? "" : report.getProduction_unit()));
        map.put("${样品状态}", (report.getSample_status() == null ? "" : report.getSample_status()));
        map.put("${抽样地点}", (report.getSampling_site() == null ? "" : report.getSampling_site()));
        map.put("${抽样日期}", (report.getGive_time() == null ? "" : report.getGive_time()));
        map.put("${样品数量}", (report.getSpecimen_amount() == null ? "" : report.getSpecimen_amount()));
        map.put("${抽样基数}", (report.getSampling_number() == null ? "" : report.getSampling_number()));
        map.put("${实验室条件}", (report.getCondition() == null ? "" : report.getCondition()));
        map.put("${检验日期}", (report.getInspect_time() == null ? "" : report.getInspect_time()));
        map.put("${仪器名称}", (report.getEmploy_facility() == null ? "" : report.getEmploy_facility()));
        map.put("${仪器型号}", (report.getModel() == null ? "" : report.getModel()));
        map.put("${仪器编号}", (report.getMach_id() == null ? "" : report.getMach_id()));
        map.put("${检验依据}", (report.getInspect_gist() == null ? "" : report.getInspect_gist()));
        map.put("${判定依据}", (report.getJudge_gist() == null ? "" : report.getJudge_gist()));
        map.put("${检验结论}", (report.getConclusion() == null ? "" : report.getConclusion()));
        map.put("${签发日期}", (report.getSign_time() == null ? "" : report.getSign_time()));
        map.put("${备注}", (report.getComment() == null ? "" : report.getComment()));
        map.put("${批准人}", (report.getRatify() == null ? "" : report.getRatify()));
        map.put("${审核人}", (report.getAuditor() == null ? "" : report.getAuditor()));
        map.put("${制表人}", (report.getLister() == null ? "" : report.getLister()));

//进行报告详情world替换
        if(!reportDetails.isEmpty()) {
            int size = reportDetails.size();//  详情条数  详情页每页18条
            int page = size/18;// 需要详情的页码
            if(size%18 != 0) {
                page = size/18 + 1;
            }
            int contx = 1;
//            替换报告详情
            for(ReportDetail rd : reportDetails) {
                map.put("${项目" + contx + "}", (rd.getDetection_item() == null ? "" : rd.getDetection_item()));
                map.put("${要求" + contx + "}", (rd.getNorm_claim() == null ? "" : rd.getNorm_claim()));
                map.put("${结果" + contx + "}", (rd.getDetection_result() == null ? "" : rd.getDetection_result()));
                map.put("${限值" + contx + "}", (rd.getDetection_limit() == null ? "" : rd.getDetection_limit()));
                map.put("${结论" + contx + "}", (rd.getOnly_verdict() == null ? "" : rd.getOnly_verdict()));
                contx ++ ;
            }
            //  多余报告详情替换为空字符串
            for (;contx <= (page * 18); contx++) {
                map.put("${项目" + contx + "}", "");
                map.put("${要求" + contx + "}", "");
                map.put("${结果" + contx + "}", "");
                map.put("${限值" + contx + "}", "");
                map.put("${结论" + contx + "}", "");
            }}

        //  报告模板后缀类型
        String suffix = path.substring(path.lastIndexOf(".") + 1);
        // 报告模板后缀名之前部分
        String pathStr = path.substring(0,path.lastIndexOf("."));

        //  根路径
        String rootPath = request.getSession().getServletContext().getRealPath("/");

        String ymd = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        // 生成报告的全路径位置
        String newPath = rootPath + pathStr + ymd + "." + suffix;
        // 报告模板全路径位置
        String mbPath = rootPath + path;

        FileOutputStream outStream = new FileOutputStream(newPath);

        ExportWordUtil.exportWord(mbPath, outStream, map);

        return pathStr + ymd + "." + suffix;
    }

    /**
     *
     *   选择所用仪器
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv = getModelAndView();
        mv.setViewName(mach_table);
        return mv;
    }

    /**
     * 选择样品
     * @return
     */
    @RequestMapping("/ypmc")
    public ModelAndView ypmc() {
        ModelAndView mv = getModelAndView();
        mv.setViewName(ypmc);
        return mv;
    }
}
