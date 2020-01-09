package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.Finance;
import com.hniois.entity.purchase.Purchase;
import com.hniois.entity.purchase.Result;
import com.hniois.service.purchase.buy.PurchaseManage;
import com.hniois.service.purchase.finance.FinanceManage;
import com.hniois.service.purchase.result.ResultManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/finance")
public class FinanceAction extends BaseController {

    @Resource(name="financeService")
    private FinanceManage financeService;
    @Resource(name="purchaseService")
    private PurchaseManage purchaseService;
    @Resource(name = "resultService")
    private ResultManage resultService;

    private String fin_list="purchase/finance/fin_list";
    private String fin_edit="purchase/finance/fin_edit";

    @RequestMapping("/toPage")
    public ModelAndView tolist(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(fin_list);
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
    public String getlist(Finance e)throws Exception{


        //获取当前页
        int currPage=getThisPage(e.getPage());
        //获取分页数
        int limit=getThisLimit(e.getLimit());
        //设置新的对象
        e.setPageSize(limit);
        e.setOffset((currPage-1)*limit);
        Page page=financeService.findPage(e);
        return JSON.toJSONString(page);

    }

    /**
     * 新增or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    public ModelAndView edit(Finance e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Finance finance=new Finance();
        if(StringUtils.isNotEmpty(e.getId())){
            finance=financeService.find(e);
        }
        finance.setCode(e.getCode());
        mv.setViewName(fin_edit);
        mv.addObject("finance",finance);
        return mv;
    }

    /**
     * 保存新增(暂时无用)
     * @return
     */
   /* @RequestMapping("/add")
    @ResponseBody
    public String add(Finance e)throws Exception{
        JSONObject obj=getMsg();
        //先判断是否已经存在要保存的对象
        Finance finance=new Finance();
        finance.setId(e.getId());
        if(financeService.findCount(finance)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            financeService.save(e);
        }
        return obj.toString();
    }
*/
    /**
     * 编辑保存(暂时无用)
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Finance e)throws Exception{
        JSONObject obj=getMsg();

        Session session= SessionManager.getSession();
        String username=(String) session.getAttribute(Const.SESSION_USERNAME);

        if(e.getPur_batch()!=null){
            if(!e.getState().equals("2")){
                e.setApprove(username);
                e.setApprove_time(DateUtil.getTime());
                Purchase purchase=new Purchase();
                purchase.setPur_batch(e.getPur_batch());
                purchase=purchaseService.find(purchase);
                Result result=new Result();
                result.setPur_batch(purchase.getPur_batch());
                if (resultService.findCount(result)==0){
                    result.setBuyer(purchase.getBuyer());
                    result.setPro_name(purchase.getPro_name());
                    result.setPur_num(purchase.getPur_num());
                    result.setPrice(purchase.getPrice());
                    result.setPro_id(purchase.getPro_id());
                    if(e.getState().equals("1")){//财务驳回审批,则更改采购状态为作废
                        result.setStatus("2");
                    }
                    resultService.save(result);
                }else{
                    setMsg(obj,"error","已经审批过了");
                }

                financeService.update(e);
            }

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
    public String delete(Finance e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            financeService.delete(e);
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
    public String deletes(Finance e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            financeService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }
}
