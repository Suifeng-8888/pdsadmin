package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.CheckRecord;
import com.hniois.service.machine.checkrecord.CheckRecordManage;
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
 * 仪器检定记录
 */
@Controller
@RequestMapping("/ckrecord")
public class CkRecordAction extends BaseController {
    @Resource(name="checkRecordService")
    private CheckRecordManage ckRecordServic;

    private String ckrecord_list="machine/ckrecord/ckrecord_list";
    private String ckrecord_edit="machine/ckrecord/ckrecord_edit";

    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(ckrecord_list);
        return mv;
    }

    /**
     * 分页查询
     */

    @RequestMapping(value="/list")
    @ResponseBody
    public String list(CheckRecord e) throws Exception{
        //获取当前页面
        int currPage=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        //重新设置对象中分页信息的偏移量和每页显示条数
        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page=ckRecordServic.findPage(e);
        return JSON.toJSONString(page);
    }


    /**
     * 新增or编辑页面
     * @return
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView edit(CheckRecord e) throws Exception{
        ModelAndView mv=this.getModelAndView();
        CheckRecord ckrecord=new CheckRecord();
        if(StringUtils.isNotEmpty(e.getId())){
            ckrecord=ckRecordServic.find(e);
        }
        ckrecord.setCode(e.getCode());
        mv.addObject("ckrecord",ckrecord);
        mv.setViewName(ckrecord_edit);
        return mv;
    }


    /**
     * 保存新增
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(CheckRecord e) throws Exception{
        JSONObject obj= getMsg();//返回信息
        CheckRecord ckrecord=new CheckRecord();
        ckrecord.setMach_id(e.getMach_id());
        //判断当前对象是否已经存在
        if(ckRecordServic.findCount(ckrecord)>0){
            setMsg(obj,"error","当前对象存在!");
        }else{
            ckRecordServic.save(e);
        }

        return obj.toString();
    }

    /**
     * 保存编辑
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(CheckRecord e){
        net.sf.json.JSONObject obj=getMsg();
        try {
            ckRecordServic.update(e);

        }catch (Exception ex){
            setMsg(obj,"failed","编辑失败");
        }

        return obj.toString();
    }

    /**
     * 删除数据
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(CheckRecord e)throws Exception{
        net.sf.json.JSONObject obj=getMsg();
        if(e.getId()!=null){
            ckRecordServic.delete(e);
        }else{
            setMsg(obj,"delete failed","删除失败!");
        }

        return obj.toString();
    }

    /**
     * 批量删除数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(CheckRecord e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            ckRecordServic.deleteBatch(e);
        }else{
            setMsg(obj,"delete failed","删除失败!");
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
    public void doExport(CheckRecord e) throws Exception {
        //导出工具
        ExportExcelUtil<CheckRecord> export = new ExportExcelUtil<CheckRecord>();
        //文件名称
        String filename = "ckRecord" + DateUtil.getTimes();
        //导出数据信息
        List list = ckRecordServic.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }
}
