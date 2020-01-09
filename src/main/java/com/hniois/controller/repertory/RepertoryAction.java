package com.hniois.controller.repertory;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.repertory.PutRecord;
import com.hniois.entity.repertory.Repertory;
import com.hniois.service.repertory.PutRecordService;
import com.hniois.service.repertory.RepertoryService;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 *  库存信息    action
 */
@RequestMapping(value = "/repertory")
@Controller
public class RepertoryAction extends BaseController {

    @Resource(name = "repertoryService")
    private RepertoryService repertoryService;

    @Resource(name = "putRecordService")
    private PutRecordService putRecordService;

    private String list = "repertory/repertory_list";

    private String look = "repertory/repertory_look";

    private String put = "repertory/repertory_put";
    /**
     *  进入库存信息分页列表页面
     * @param page
     * @return
     */
    @RequestMapping(value = "/toPage")
    @ResponseBody
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        List<Repertory> repertorys = null;
        try {
            repertorys = repertoryService.findList(new Repertory());
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("repertorys", repertorys);
        mv.setViewName(list);
        return mv;
    }

    /**
     *  分页list
     * @param repertory
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Repertory repertory) {
        //  当前页
        int currPage = getThisPage(repertory.getPage());
        //  每页显示条数
        int limit = getThisLimit(repertory.getLimit());
        repertory.setOffset((currPage - 1) * limit);
        repertory.setPageSize(limit);
        Page page = null;
        try {
            page = repertoryService.findPage(repertory);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.toJSONString(page);
    }

    /**
     *  库存详情查看
     * @param id
     * @return
     */
    @RequestMapping(value = "/look")
    public ModelAndView lookRepertory(String id) throws Exception {
        ModelAndView mv = getModelAndView();
        mv.setViewName(look);
        Repertory repertory = repertoryService.selectById(id);
        mv.addObject("repertory", repertory);
        return mv;
    }

    /**
     * 进入  出入库操作页面
     * @param e
     * @return
     */
    @RequestMapping(value = "/inOrOut")
    @ResponseBody
    public ModelAndView inOrOutRepertory(Repertory e) throws Exception {
        ModelAndView mv = getModelAndView();
        //  更新入库  or 出库
        Repertory repertory = new Repertory();
        if (e.getSort() == 2 || e.getSort() == 3) {
            String id = e.getId();
            repertory = repertoryService.selectById(id);
        }
        repertory.setSort(e.getSort());
        mv.addObject("repertory", repertory);
        mv.setViewName(put);
        return mv;
    }

    /**
     *  出入库操作保存
     * @param repertory
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public String save(Repertory repertory) {
        JSONObject obj = getMsg();//返回信息
        //出入库记录
        PutRecord putRecord = new PutRecord();
        putRecord.setTime(DateUtil.getDay());
        putRecord.setOperator(SessionManager.getUsername());
        putRecord.setBz(repertory.getBz());
        putRecord.setUnit(repertory.getUnit());
        putRecord.setType(repertory.getCategory());
        putRecord.setName(repertory.getName());
        try {
            //  新增入库
            if (repertory.getSort() == 1){
                repertoryService.save(repertory);
                putRecord.setRecord_type(1);
                putRecord.setOdd_number(repertory.getOdd_number());
                putRecord.setOrder_number(repertory.getOrder_number());
                putRecord.setNumber(repertory.getStock());
                // 更新入库
            } else if(repertory.getSort() == 2) {
                repertoryService.update(repertory);
                putRecord.setRecord_type(2);
                putRecord.setOdd_number(repertory.getOdd_number());
                putRecord.setOrder_number(repertory.getOrder_number());
                putRecord.setNumber(repertory.getInrep());
                //出库
            } else if (repertory.getSort() == 3){
                repertoryService.update(repertory);
                putRecord.setRecord_type(3);
                putRecord.setOdd_number(repertory.getOdd_number());
                putRecord.setGet_name(repertory.getGet_name());
                putRecord.setNumber(repertory.getOutrep());
            }
            // 添加出入库记录
            putRecordService.save(putRecord);
        } catch (Exception e) {
            setMsg(obj,"error","操作失败!");
            e.printStackTrace();
        }
        return obj.toString();
    }

    /**
     * 库存信息excel导出
     * @param e
     */
    @RequestMapping(value = "/doExport")
    @ResponseBody
    public void doExport(Repertory e) throws Exception {
        //导出工具
        ExportExcelUtil<Repertory> export = new ExportExcelUtil<Repertory>();
        //文件名称
        String filename = "库存信息" + DateUtil.getTimes();
        String fileName = new String(filename.getBytes(),"ISO8859-1");
        //导出数据信息
        List list = repertoryService.findPage(e).getData();
        //执行导出
        doExport(fileName,list,export);
    }


}
