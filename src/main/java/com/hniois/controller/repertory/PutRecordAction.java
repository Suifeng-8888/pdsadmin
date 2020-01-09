package com.hniois.controller.repertory;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.repertory.PutRecord;
import com.hniois.entity.system.User;
import com.hniois.service.repertory.PutRecordService;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 出入库记录 controller
 */
@Controller
@RequestMapping(value = "/putRecord")
public class PutRecordAction extends BaseController {

    @Resource(name = "putRecordService")
    private PutRecordService putRecordService;

    private String list = "repertory/putrecord_list";

    private String look = "repertory/putrecord_look";

    /**
     *  进入出入库信息列表页面
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
     *  分页list
     * @param putRecord
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String shwoPageList(PutRecord putRecord) throws Exception {
        //  当前页
        int currPage = getThisPage(putRecord.getPage());
        //  每页显示条数
        int limit = getThisLimit(putRecord.getLimit());
        putRecord.setOffset((currPage - 1) * limit);
        putRecord.setPageSize(limit);
        Page page = putRecordService.findPage(putRecord);
        return JSON.toJSONString(page);
    }

    /**
     *  查看出入库记录详情
     * @param e
     * @return
     */
    @RequestMapping(value = "/look")
    @ResponseBody
    public ModelAndView lookDetail(PutRecord e) throws Exception {
        ModelAndView mv = getModelAndView();
        PutRecord putRecord = null;
        if (StringUtils.isNotEmpty(e.getId())) {
            putRecord = putRecordService.find(e);
        }
        mv.setViewName(look);
        mv.addObject("putRecord",putRecord);
        return mv;
    }

    /**
     *
     * @param e
     * @throws Exception
     */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(PutRecord e) throws Exception {
        //导出工具
        ExportExcelUtil<PutRecord> export = new ExportExcelUtil<PutRecord>();
        //文件名称
        String filename = "出入库记录" + DateUtil.getTimes();
        String fileName = new String(filename.getBytes(),"ISO8859-1");
        //导出数据信息
        List list = putRecordService.findPage(e).getData();
        //执行导出
        doExport(fileName,list,export);
    }


}
