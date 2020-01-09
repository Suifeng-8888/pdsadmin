package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Productor;
import com.hniois.trace.service.ProductorManage;
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
@RequestMapping("/zsProduct")
public class ProductorAction extends BaseController {

    @Resource(name = "productorService")
    private ProductorManage productorService;

    private String productor_edit="trace/productor/productor_edit";
    private String productor_list="trace/productor/productor_list";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(productor_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Productor e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = productorService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Productor e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Productor productor=new Productor();
        if(StringUtils.isNotEmpty(e.getPro_id())){
            productor=productorService.find(e);
        }
        productor.setCode(e.getCode());
        mv.addObject("productor",productor);
        mv.setViewName(productor_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Productor e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(productorService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            productorService.save(e);
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
    public String update(Productor e){
        JSONObject obj=getMsg();
        try{
            productorService.update(e);
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
    public String delete(Productor e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getPro_id()!=null) {
            productorService.delete(e);
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
    public String deletes(Productor e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            productorService.deleteBatch(e);
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
    public void doExport(Productor e) throws Exception {
        //导出工具
        ExportExcelUtil<Productor> export = new ExportExcelUtil<Productor>();
        //文件名称
        String filename = "productorList" + DateUtil.getTimes();
        //导出数据信息
        List list = productorService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

}
