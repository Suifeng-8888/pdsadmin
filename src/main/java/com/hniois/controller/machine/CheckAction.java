package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.Check;
import com.hniois.entity.machine.CheckRecord;
import com.hniois.entity.quartz.CheckQuartz;
import com.hniois.service.machine.check.CheckManage;
import com.hniois.service.machine.checkrecord.CheckRecordManage;
import com.hniois.service.quartz.CheckQuartzManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 仪器检定计划表
 */
@Controller
@RequestMapping("/check")
public class CheckAction extends BaseController {
    @Resource(name="checkService")
    private CheckManage checkService;

    @Resource(name="checkRecordService")
    private CheckRecordManage recordService;

    @Resource(name = "checkQuartzService")
    private CheckQuartzManage ckQuartzService;

    private String check_list="machine/check/check_list";
    private String check_edit="machine/check/check_edit";
    private String check_table="machine/check/check_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(check_list);
        return mv;
    }


    /**
     * 分页查询
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public String showlist(Check e)throws Exception{
        //或取当前页
        int currpage =getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((currpage-1)*limit);
        e.setPageSize(limit);
        Page page=checkService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询全部列表
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/findList")
    @ResponseBody
    public String getlist(Check e)throws Exception{
        List<Check> list=checkService.findList(e);
        JSONArray js= JSONArray.fromObject(list);
        return js.toString();
    }
    /**
     * 新增或编辑页面
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView toEdit(Check e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Check check=new Check();
        //判断id是否为空
        if(StringUtils.isNotEmpty(e.getId())){
            check= checkService.find(e);
        }

        check.setCode(e.getCode());
        mv.setViewName(check_edit);
        mv.addObject("check",check);
        return mv;
    }

    /**
     * 选择要检定的仪器名和编号
     *
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(check_table);
        return mv;
    }
    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Check e)throws Exception{
        net.sf.json.JSONObject obj=getMsg();
        Check check =new Check();
        check.setMach_id(e.getMach_id());
        //判断数据库是否已经存在要保存的对象
        if(checkService.findCount(check)>0){
            setMsg(obj,"error","当前对象存在");
        }else{
            checkService.save(e);
        }
        return obj.toString();
    }

    /**
     * 保存编辑更改
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Check e){
        JSONObject obj=getMsg();
        try{
            checkService.update(e);
            String ck_time=e.getCheck_time();//预期检定日期
           String temp= DateUtil.getAfterMonthDate("3");
           if(DateUtil.compareDate(ck_time,temp)){
               CheckQuartz ck=new CheckQuartz();
               ck.setEntity_id(e.getMach_id());
               ckQuartzService.delete(ck);
           }
        }catch(Exception ex){
            setMsg(obj,"error","更改失败");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(Check e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            checkService.delete(e);
        }else{
            setMsg(obj,"error","删除失败");
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
    public String deletes(Check e)throws Exception{
        JSONObject obj = getMsg();//返回信息
        if(e.getData()!=null){
            checkService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }

        return obj.toString();
    }

    /**
     * 获取送去检定的仪器信息
     * @param e
     * @return
     */
    @RequestMapping("/sendcheck")
    @ResponseBody
    public String goCheck(Check e) {
        JSONObject obj=getMsg();
        try{
            //根据选择的仪器ids获取所有的仪器信息
            List<Check> checks=checkService.sendCheck(e);
            //根据定检对象集合信息获取定检记录集合信息
            List<CheckRecord> list=checkService.getRecord(checks);
            //批量保存定检记录对象同时批量更新检计划表中的送检状态
            recordService.saveBatch(list);
           //将所有要送检的对象更改送检状态
                e.setStatus("0");
            checkService.updateBatch(e);

        }catch(Exception ex){
            setMsg(obj,"error","送检失败");
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
    public void doExport(Check e) throws Exception {
        //导出工具
        ExportExcelUtil<Check> export = new ExportExcelUtil<Check>();
        //文件名称
        String filename = "CheckList" + DateUtil.getTimes();
        //导出数据信息
        List list = checkService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }


}
