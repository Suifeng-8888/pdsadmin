package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.Finance;
import com.hniois.entity.purchase.Purchase;
import com.hniois.service.purchase.buy.PurchaseManage;
import com.hniois.service.purchase.finance.FinanceManage;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 采购备案
 */
@Controller
@RequestMapping("/inquiry")
public class PurchaseAction extends BaseController {

    @Resource(name="purchaseService")
    private PurchaseManage purchaseService;
    @Resource(name="financeService")
    private FinanceManage financeService;


    private String purchase_list="purchase/buy/purchase_list";
    private String purchase_edit="purchase/buy/purchase_edit";

    @RequestMapping("/toPage")
    public ModelAndView tolist(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(purchase_list);
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
    public String getlist(Purchase e)throws Exception{


        //获取当前页
        int currPage=getThisPage(e.getPage());
        //获取分页数
        int limit=getThisLimit(e.getLimit());
        //设置新的对象
        e.setPageSize(limit);
        e.setOffset((currPage-1)*limit);
        Page page=purchaseService.findPage(e);
        return JSON.toJSONString(page);

    }

    /**
     * 新增or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    public ModelAndView edit(Purchase e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Purchase purchase=new Purchase();
        if(StringUtils.isNotEmpty(e.getId())){
            purchase=purchaseService.find(e);
        }
        purchase.setCode(e.getCode());
        mv.setViewName(purchase_edit);
        mv.addObject("purchase",purchase);
        return mv;
    }

     /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Purchase e)throws Exception{
        JSONObject obj=getMsg();
        if(e.toString()!=null){
            purchaseService.update(e);
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
    public String delete(Purchase e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            purchaseService.delete(e);
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
    public String deletes(Purchase e) throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            purchaseService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 保存询价信息
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public  String saveAsk(Purchase e) throws Exception{
        JSONObject obj=getMsg();

        if (!purchaseService.saveAsk(e)){
            setMsg(obj,"error","询价失败");
        }

        return obj.toString();
    }

    /**
     * 去财务备案
     * @param e
     * @return
     */
    @RequestMapping("/record")
    @ResponseBody
    public String recd(Purchase e)throws Exception{
        JSONObject obj=getMsg();
        //获取当前备案的批次信息
        if(!purchaseService.goRecord(e)){
            setMsg(obj,"error","备案失败");
        }
        return obj.toString();
    }

}
