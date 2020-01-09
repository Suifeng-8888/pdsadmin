package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Batch_Material;
import com.hniois.trace.service.BatchManage;
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

@Controller
@RequestMapping("/batch")
public class BatchAction extends BaseController {
    @Resource(name ="batchService")
    private BatchManage batchService;


    private String batch_edit="trace/batchMaterial/batch_edit";
    private String batch_list="trace/batchMaterial/batch_list";
    private String batch_table="trace/batchMaterial/batch_table";
    private String batch_fill_data="trace/batchMaterial/batch_fill_data";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(batch_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Batch_Material e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = batchService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Batch_Material e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Batch_Material batch=new Batch_Material();
        if(StringUtils.isNotEmpty(e.getBatch_id())){
            batch=batchService.find(e);
        }
        batch.setCode(e.getCode());
        mv.addObject("bat",batch);
        mv.setViewName(batch_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Batch_Material e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(batchService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            batchService.save(e);
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
    public String update(Batch_Material e){
        JSONObject obj=getMsg();
        try{
            batchService.update(e);
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
    public String delete(Batch_Material e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getBatch_id()!=null) {
            batchService.delete(e);
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
    public String deletes(Batch_Material e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            batchService.deleteBatch(e);
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
    public void doExport(Batch_Material e) throws Exception {
        //导出工具
        ExportExcelUtil<Batch_Material> export = new ExportExcelUtil<Batch_Material>();
        //文件名称
        String filename = "batchList" + DateUtil.getTimes();
        //导出数据信息
        List list = batchService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 选择产品生产记录
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(batch_table);
        return mv;
    }

    /**
     * 批次用量原材料数据追溯
     * @return
     */
    @RequestMapping("/retrospect")
    public ModelAndView fill(Batch_Material e)throws Exception{
        Batch_Material batch_material=new Batch_Material();
        if(e.getBatch_id()!=null){
            batch_material=batchService.find(e);
        }
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(batch_fill_data);
        mv.addObject("batch_material",batch_material);
        return mv;
    }

}
