package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.PurApply;
import com.hniois.service.purchase.purapply.PurApplyManage;
import com.hniois.util.DateUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Random;

/**
 * 采购申请
 */
@Controller
@RequestMapping("/plan")
public class PurApplyAction extends BaseController {

    @Resource(name = "purApplyService")
    private PurApplyManage purAppService;

    private String purApp_list="purchase/purapply/purApply_list";
    private String purApp_edit="purchase/purapply/purApply_edit";

    //新增选择多个商品的测试
    private String pro_table="purchase/purapply/product_table";

    @RequestMapping("/toPage")
    public ModelAndView tolist(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(purApp_list);
        return mv;
    }

    /**
     * 分页查找
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @ResponseBody
    public String getlist(PurApply e)throws Exception{

        //获取当前页
        int currPage=getThisPage(e.getPage());
        //获取分页数
        int limit=getThisLimit(e.getLimit());
        //设置新的对象
        e.setPageSize(limit);
        e.setOffset((currPage-1)*limit);
        Page page=purAppService.findPage(e);
        return JSON.toJSONString(page);

    }

    /**
     *  查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String alllist(PurApply e)throws Exception{
        List<PurApply> list=purAppService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 新增or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    public ModelAndView edit(PurApply e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        PurApply purApp=new PurApply();
        if(StringUtils.isNotEmpty(e.getId())){
            purApp=purAppService.find(e);
        }
        purApp.setCode(e.getCode());
        mv.setViewName(purApp_edit);
        mv.addObject("purApp",purApp);
        return mv;
    }

    /**
     * 保存新增
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(PurApply e)throws Exception{
        JSONObject obj=getMsg();
        //获取申请批次号,日期加随机数产生
        e.setBz(DateUtil.getTimes()+new Random().nextInt(999));
        if(purAppService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            //获取当前时间,并设置到对象中
            e.setApply_time(DateUtil.getTime());
            purAppService.save(e);
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
    public String update(PurApply e)throws Exception{
        JSONObject obj=getMsg();
        if(e!=null){
            purAppService.update(e);
        }else{
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(PurApply e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            purAppService.delete(e);
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
    public String deletes(PurApply e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            purAppService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 领导进行审批
     * @param e
     * @return
     */
    @RequestMapping("/approve")
    @ResponseBody
    public String approve(PurApply e){
        JSONObject obj=getMsg();

       if(!purAppService.goApprove(e)){
           setMsg(obj,"error","审批失败");
       }
        return obj.toString();
    }


    /**
     * 新增页面选择多个商品的操作
     */

    @RequestMapping("/choose")
    public ModelAndView choose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(pro_table);
        return mv;
    }
}
