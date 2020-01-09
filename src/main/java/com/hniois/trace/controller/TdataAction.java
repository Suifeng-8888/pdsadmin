package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.TraceData;
import com.hniois.trace.service.TdataManage;
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
@RequestMapping("/tdata")
public class TdataAction extends BaseController {

    @Resource(name = "tdataService")
    private TdataManage tdataService;

    private String data_list="trace/trace_data/data_list";
    private String data_edit="trace/trace_data/data_edit";
    private String data_table="trace/trace_data/data_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(data_list);
        return mv;
    }


    /**
     * 分页查询
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public String showlist(TraceData e)throws Exception{
        //或取当前页
        int currpage =getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((currpage-1)*limit);
        e.setPageSize(limit);
        Page page=tdataService.findPage(e);
        return JSON.toJSONString(page);
    }
    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(TraceData e) throws Exception{
        List<TraceData> list= tdataService.findList(e);
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
    public ModelAndView edit(TraceData e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        TraceData tdata=new TraceData();
        tdata.setBatch_id(e.getBatch_id());
        if(StringUtils.isNotEmpty(e.getDat_id())){
            tdata=tdataService.find(e);
            String[] arr= tdata.getBz().split("_");
            tdata.setMat_type(arr[0]);
            tdata.setBz(arr[1]);
            tdata.setMat_batch(arr[2]);
            tdata.setMat_sup(arr[3]);
            tdata.setUse_num(arr[4]);
        }
        tdata.setCode(e.getCode());
        mv.addObject("tData",tdata);
        mv.setViewName(data_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(TraceData e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(tdataService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            e.setBz(e.getMat_type()+"_"+e.getBz()+"_"+e.getMat_batch()+"_"+e.getMat_sup()+"_"+e.getUse_num());
            tdataService.save(e);
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
    public String update(TraceData e){
        JSONObject obj=getMsg();
        try{
            e.setBz(e.getMat_type()+"_"+e.getBz()+"_"+e.getMat_batch()+"_"+e.getMat_sup()+"_"+e.getUse_num());
            tdataService.update(e);
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
    public String delete(TraceData e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getDat_id()!=null) {
            tdataService.delete(e);
        }else {
            setMsg(obj, "error", "删除失败");
        }
        return obj.toString();
    }

    /**
     * 选择进货原材料
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(data_table);
        return mv;
    }
}
