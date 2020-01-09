package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Key_Control;
import com.hniois.trace.service.KeyContrlManage;
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
@RequestMapping("/keypoint")
public class KeyContrlAction extends BaseController {

    @Resource(name = "keyContrlService")
    private KeyContrlManage keyContrlService;

    private String keyCrl_list="trace/keyContrl/keyContrl_list";
    private String keyContrl_edit="trace/keyContrl/keyContrl_edit";
    private String keyContrl_table="trace/keyContrl/keyContrl_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(keyCrl_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Key_Control e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = keyContrlService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Key_Control e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Key_Control keyContrl=new Key_Control();
        if(StringUtils.isNotEmpty(e.getCtr_id())){
            keyContrl=keyContrlService.find(e);
        }
        keyContrl.setCode(e.getCode());
        mv.addObject("keyContrl",keyContrl);
        mv.setViewName(keyContrl_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Key_Control e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(keyContrlService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            keyContrlService.save(e);
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
    public String update(Key_Control e){
        JSONObject obj=getMsg();
        try{
            keyContrlService.update(e);
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
    public String delete(Key_Control e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getCtr_id()!=null) {
            keyContrlService.delete(e);
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
    public String deletes(Key_Control e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            keyContrlService.deleteBatch(e);
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
    public void doExport(Key_Control e) throws Exception {
        //导出工具
        ExportExcelUtil<Key_Control> export = new ExportExcelUtil<Key_Control>();
        //文件名称
        String filename = "keyContrlList" + DateUtil.getTimes();
        //导出数据信息
        List list = keyContrlService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 选择进货产品
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(keyContrl_table);
        return mv;
    }
}
