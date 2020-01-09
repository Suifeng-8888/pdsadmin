package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.PurApprove;
import com.hniois.entity.purchase.Purchase;
import com.hniois.service.purchase.purapprove.PurApproveManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 采购审批
 */
@Controller
@RequestMapping("/approve")
public class PurApproveAction extends BaseController {

    @Resource(name = "purApproveService")
    private PurApproveManage purApproveService;

    private String Approve_list="purchase/purapprove/purApprove_list";
    private String Approve_edit="purchase/purapprove/purApprove_edit";
    private String Approve_price="purchase/purapprove/ask_price";
    private String supply="purchase/purapprove/approve_table";

    @RequestMapping("/toPage")
    public ModelAndView tolist(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(Approve_list);
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
    public String getlist(PurApprove e)throws Exception{

        //获取当前页
        int currPage=getThisPage(e.getPage());
        //获取分页数
        int limit=getThisLimit(e.getLimit());
        //设置新的对象
        e.setPageSize(limit);
        e.setOffset((currPage-1)*limit);
        Page page=purApproveService.findPage(e);
        return JSON.toJSONString(page);

    }

    /**
     *  查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String alllist(PurApprove e)throws Exception{
        List<PurApprove> list=purApproveService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 查看信息
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    public ModelAndView edit(PurApprove e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        PurApprove purApprove=new PurApprove();
        if(StringUtils.isNotEmpty(e.getId())){
            purApprove=purApproveService.find(e);
        }
        purApprove.setCode(e.getCode());
        mv.setViewName(Approve_edit);
        mv.addObject("purApprove",purApprove);
        return mv;
    }

    /**
     * 保存新增(暂时无用)
     * @return
     */
/*    @RequestMapping("/add")
    @ResponseBody
    public String add(PurApprove e)throws Exception{
        JSONObject obj=getMsg();
        //先判断是否已经存在要保存的对象
        //获取当前时间,并设置到对象中
        e.setApply_time(DateUtil.getTime());
        if(purApproveService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            purApproveService.save(e);
        }
        return obj.toString();
    }*/

    /**
     * 编辑保存(暂时无用)
     * @param e
     * @return
     */
/*    @RequestMapping("/update")
    @ResponseBody
    public String update(PurApprove e)throws Exception{
        JSONObject obj=getMsg();
        if(e.toString()!=null){
            purApproveService.update(e);
        }else{
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
    }*/

    /**
     * 删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(PurApprove e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            purApproveService.delete(e);
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
    public String deletes(PurApprove e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            purApproveService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 去询价
     * @param e
     * @return
     */
    @RequestMapping("/price")
    @ResponseBody
    public ModelAndView askPrice(PurApprove e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        //跟据当前id获取要采购的商品信息,
       PurApprove approve=purApproveService.find(e);
        //获取当前询价人的信息和时间
       Session session= SessionManager.getSession();
       String username=(String) session.getAttribute(Const.SESSION_USERNAME);
       String nowTime=DateUtil.getTime();
        Purchase purchase=new Purchase();
        purchase.setBuyer(username);
        purchase.setAsk_time(nowTime);
        purchase.setPro_name(approve.getPro_name());
        purchase.setPro_name(approve.getPro_name());
        purchase.setPur_batch(approve.getPur_batch());
        purchase.setPro_id(approve.getPro_id());
        purchase.setPur_num(approve.getPur_num());
        mv.setViewName(Approve_price);
        mv.addObject("purchase",purchase);
            return mv;
    }

    /**
     * 选择供应商页面
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView choose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(supply);
        return mv;
    }
}
