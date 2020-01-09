package com.hniois.trace.controller;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Order;
import com.hniois.trace.service.OrderManage;
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
@RequestMapping("/order")
public class OrderAction extends BaseController {

    @Resource(name="orderService")
    private OrderManage orderService;

    private String order_list="trace/order/order_list";
    private String order_edit="trace/order/order_edit";
    private String supply_table="trace/order/supply_table";
    private String batch_table="trace/order/batch_table";

    @RequestMapping("/toPage")
    @ResponseBody
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(order_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/list")
    public String showPage(Order e)throws Exception{
        //获取当前页
        int current=getThisPage(e.getPage());
        //获取每页显示条数
        int limit=getThisLimit(e.getLimit());
        e.setOffset((current-1)*limit);
        e.setPagerSize(limit);//每页显示记录数
        Page page = orderService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Order e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Order order=new Order();
        if(StringUtils.isNotEmpty(e.getOrder_num())){
            order=orderService.find(e);
        }
        order.setCode(e.getCode());
        mv.addObject("order",order);
        mv.setViewName(order_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Order e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(orderService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            e.setCreate_time(DateUtil.getDay());
            orderService.save(e);
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
    public String update(Order e){
        JSONObject obj=getMsg();
        try{
            orderService.update(e);
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
    public String delete(Order e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getOrder_num()!=null) {
            orderService.delete(e);
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
    public String deletes(Order e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            orderService.deleteBatch(e);
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
    public void doExport(Order e) throws Exception {
        //导出工具
        ExportExcelUtil<Order> export = new ExportExcelUtil<Order>();
        //文件名称
        String filename = "orderList" + DateUtil.getTimes();
        //导出数据信息
        List list = orderService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 选择销售商
     * @return
     */
    @RequestMapping("/choose")
    public ModelAndView choose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(supply_table);
        return mv;
    }

    /**
     * 选择产品批次
     * @return
     */
    @RequestMapping("/chose")
    public ModelAndView chose(){
        ModelAndView mv=this.getModelAndView();
        mv.setViewName(batch_table);
        return mv;
    }

}
