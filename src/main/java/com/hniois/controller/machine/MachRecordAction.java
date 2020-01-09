package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.Record;
import com.hniois.service.machine.record.RecordManage;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 仪器使用记录
 */
@Controller
@RequestMapping("/record")
public class MachRecordAction extends BaseController {

    @Resource(name = "recordService")
    private RecordManage recordService;
    private String record_list="machine/record/record_list";
    private String record_edit="machine/record/record_edit";

    private String record_table="machine/record/record_table";


    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(record_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public String list(Record e) throws Exception{
       //获取当前页
       int currPage=getThisPage(e.getPage());
       int limit=getThisLimit(e.getLimit());
       e.setOffset((currPage-1)*limit);
       e.setPageSize(limit);
        Page  page=recordService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(Record e) throws Exception{
        List<Record> list= recordService.findList(e);
        net.sf.json.JSONArray js= net.sf.json.JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Record e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Record record=new Record();
        if(StringUtils.isNotEmpty(e.getId())){
            record=recordService.find(e);
        }
        record.setCode(e.getCode());
        mv.addObject("record",record);
        mv.setViewName(record_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Record e)throws  Exception{
        JSONObject obj=getMsg();
        //判断当前对象是否存在,id+当前时间进行判断
        if(e.getMach_ids()==null){
            setMsg(obj,"error","请选择使用的仪器");
        }else if(e.getMach_ids().contains(",")){
           String ids[]= e.getMach_ids().split(",");
           String names[]= e.getMach_names().split(",");
            for(int i=0;i<ids.length;i++){
               e.setMach_ids(ids[i]);
               e.setMach_names(names[i]);
                recordService.save(e);
            }
        }else{
            recordService.save(e);
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
    public String update(Record e)throws Exception{
        JSONObject obj=getMsg();
       if(e!=null){
            recordService.update(e);
        }else{
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
    public String delete(Record e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null) {
            recordService.delete(e);
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
    public String deletes(Record e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            recordService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 选择使用的仪器
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView choose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(record_table);
        return mv;
    }
}
