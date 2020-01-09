package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Pro_Record;
import com.hniois.trace.service.ProRecordManage;
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

//生产记录管理
@Controller
@RequestMapping("/pro_record")
public class ProRecordAction extends BaseController {

    @Resource(name = "proRecordService")
    private ProRecordManage proRecordService;

    private String proRecord_list="trace/pro_record/proRecord_list";
    private String proRecord_edit="trace/pro_record/proRecord_edit";
    private String proRecord_table="trace/pro_record/proRecord_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(proRecord_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Pro_Record e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = proRecordService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Pro_Record e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Pro_Record proRecord=new Pro_Record();
        if(StringUtils.isNotEmpty(e.getRec_id())){
            proRecord=proRecordService.find(e);
        }
        proRecord.setCode(e.getCode());
        mv.addObject("proRecord",proRecord);
        mv.setViewName(proRecord_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Pro_Record e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断生产记录号是否为null,如果不为空,则可以保存
        if(e.getRec_num()!=null){
            if(e.getPro_name().indexOf(",")>0){
                String[] names=e.getPro_name().split(",");
                String[] ids=e.getPro_id().split(",");
                String[] codes=e.getPro_code().split(",");
                for(int i=0;i<codes.length;i++){
                    Pro_Record pr=new Pro_Record();
                    pr.setPro_id(ids[i]);
                    pr.setPro_name(names[i]);
                    pr.setPro_code(codes[i]);
                    pr.setAddress(e.getAddress());
                    pr.setPatch_num(e.getPatch_num());
                    pr.setRec_num(e.getRec_num());
                    pr.setEnd_time(e.getEnd_time());
                    pr.setSt_time(e.getSt_time());
                    proRecordService.save(pr);
                }
            }else{
                proRecordService.save(e);
            }

        }else{
            setMsg(obj,"error","没有生产记录号");
        }
        return obj.toString();
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Pro_Record e){
        JSONObject obj=getMsg();
        try{
            proRecordService.update(e);
        }catch(Exception ex){
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
    }


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Pro_Record e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getRec_id()!=null) {
            proRecordService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param e
     * @return
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(Pro_Record e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            proRecordService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Pro_Record e) throws Exception {
        //导出工具
        ExportExcelUtil<Pro_Record> export = new ExportExcelUtil<Pro_Record>();
        //文件名称
        String filename = "proRecordList" + DateUtil.getTimes();
        //导出数据信息
        List list = proRecordService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 选择产品
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(proRecord_table);
        return mv;
    }
}
