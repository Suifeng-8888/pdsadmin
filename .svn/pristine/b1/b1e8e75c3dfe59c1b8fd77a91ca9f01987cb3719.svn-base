package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Im_Porduct;
import com.hniois.trace.service.ImportManage;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/zsImport")
public class ImportAction extends BaseController {

    @Resource(name = "importService")
    private ImportManage importService;

    private String import_list="trace/zsimport/import_list";
    private String import_edit="trace/zsimport/import_edit";
    private String import_table="trace/zsimport/import_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(import_list);
        return mv;
    }


    /**
     * 分页查询
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public String showlist(Im_Porduct e)throws Exception{
        //或取当前页
        int currpage =getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((currpage-1)*limit);
        e.setPageSize(limit);
        Page page=importService.findPage(e);
        return JSON.toJSONString(page);
    }
    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(Im_Porduct e) throws Exception{
        List<Im_Porduct> list= importService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Im_Porduct e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Im_Porduct im_pro=new Im_Porduct();
        if(StringUtils.isNotEmpty(e.getIm_id())){
            im_pro=importService.find(e);
        }
        im_pro.setCode(e.getCode());
        mv.addObject("import_pro",im_pro);
        mv.setViewName(import_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Im_Porduct e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(importService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            importService.save(e);
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
    public String update(Im_Porduct e){
        JSONObject obj=getMsg();
        try{
            importService.update(e);
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
    public String delete(Im_Porduct e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getIm_id()!=null) {
            importService.delete(e);
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
    public String deletes(Im_Porduct e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            importService.deleteBatch(e);
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
    public void doExport(Im_Porduct e) throws Exception {
        //导出工具
        ExportExcelUtil<Im_Porduct> export = new ExportExcelUtil<Im_Porduct>();
        //文件名称
        String filename = "ImportList" + DateUtil.getTimes();
        //导出数据信息
        List list = importService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 选择供应商
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(import_table);
        return mv;
    }
}
