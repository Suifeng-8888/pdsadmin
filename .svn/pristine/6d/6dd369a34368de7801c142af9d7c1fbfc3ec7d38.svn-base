package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Aptitude;
import com.hniois.trace.service.AptitudeService;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.FileUtil;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create By javaMan
 * 2018/6/26  10:01
 *
 * 企业资质  controller
 */
@Controller
@RequestMapping(value = "/aptitude")
public class AptitudeController extends BaseController{

    @Resource(name = "aptitudeService")
    private AptitudeService aptitudeService;

    private String list = "trace/aptitude/aptitude_list";
    private String edit = "trace/aptitude/aptitude_edit";

    /**
     * 进入企业资质list 分页页面
     * @param page
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndView();
        mv.setViewName(list);
        return mv;
    }

    /**
     * 企业资质分页列表。。。
     * @param aptitude
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Aptitude aptitude) throws Exception {
        // 当前页
        int currPage = getThisPage(aptitude.getPage());
        // 每页显示条数
        int limit = getThisLimit(aptitude.getLimit());
        aptitude.setOffset((currPage-1)*limit);
        aptitude.setPageSize(limit);
        Page page = aptitudeService.findPage(aptitude);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 Or 修改 页面
     * @param aptitude
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(Aptitude aptitude) throws Exception {
        ModelAndView mv = getModelAndView();
        Aptitude ap = new Aptitude();
        if(StringUtils.isNotEmpty(aptitude.getId())) {
            ap = aptitudeService.find(aptitude);
        }
        ap.setCode(aptitude.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("aptitude", ap);
        mv.setViewName(edit);
        return mv;
    }

    /**
     * 添加企业资质
     * @param aptitude
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Aptitude aptitude) {
        JSONObject obj = getMsg();//返回信息
        try {
            aptitudeService.save(aptitude);
        } catch (Exception e) {
            setMsg(obj, "error", "新增企业资质信息异常。。。");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 企业资质修改
     * @param aptitude
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(Aptitude aptitude) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(aptitude.getId())) {
            aptitudeService.update(aptitude);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 单个删除
     * @param aptitude
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Aptitude aptitude, HttpServletRequest request) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(aptitude.getId())) {
            aptitudeService.delete(aptitude);
            // 删除资质图片文件
            String path = request.getSession().getServletContext().getRealPath("/");// 根路径
            String filePath = path + aptitude.getCertificate();
            FileUtil.deleteFile(filePath);
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param aptitude
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Aptitude aptitude) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(aptitude.getData() != null && aptitude.getData().size() > 0) {
            aptitudeService.deleteBatch(aptitude);
//            @TODO  删除 企业资质证书图片
        } else {
            setMsg(obj, "error", "参数不能为空...");
        }
        return obj.toString();
    }

    /**
     * 导出Excel
     * @param aptitude
     */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Aptitude aptitude) throws Exception {
        //导出工具
        ExportExcelUtil<Aptitude> export =  new ExportExcelUtil<Aptitude>();
        //文件名称
        String filename = "Aptitude_list" + DateUtil.getTimes();
        //导出数据信息
        List list = aptitudeService.findPage(aptitude).getData();
        //执行导出
        doExport(filename,list,export);
    }
}
