package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;

import com.hniois.entity.purchase.Supplier;
import com.hniois.service.purchase.supplier.SupplierManage;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/supply")
public class SupplierAction extends BaseController{
    //用户
    @Resource(name="supplierService")
    private SupplierManage supplierService;

    private String supplier_list = "purchase/supplier/supplier_list";
    private String supplier_edit = "purchase/supplier/supplier_edit";


    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(supplier_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Supplier e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = supplierService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Supplier e) throws Exception {
        List<Supplier> list = supplierService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 查询count
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findCount")
    @ResponseBody
    public String findCount(Supplier e) throws Exception {
        Integer count = supplierService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Supplier e) throws Exception {
        Supplier m = supplierService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Supplier e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Supplier supplier = new Supplier();
        if(StringUtils.isNotEmpty(e.getId())){
            supplier = supplierService.find(e);
        }
        supplier.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("supplier",supplier);
        mv.setViewName(supplier_edit);
        return mv;
    }

    /**
     * 保存
     * @param e
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Supplier e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Supplier p = new Supplier();
        p.setSup_id(e.getSup_id());
        //条件判断
        if(supplierService.findCount(p)>0){
            setMsg(obj,"error","数据已存在!");
        }else{
            supplierService.save(e);
        }
        return obj.toString();
    }

    /**
     * 修改
     * @param e
     * @return json
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Supplier e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        //条件判断
        if(e.getId()!=null){
            supplierService.update(e);
        }else{
            setMsg(obj,"error","操作失败!");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(Supplier e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e.getId()!=null){
            supplierService.delete(e);
        }else {
            setMsg(obj,"error","删除失败!");
        }

        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Supplier e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e.getData()!=null){
            supplierService.deleteBatch(e);
        }else {
            setMsg(obj,"error","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 导出
     * @param e 用户信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Supplier e) throws Exception {
        //导出工具
        ExportExcelUtil<Supplier> export = new ExportExcelUtil<Supplier>();
        //文件名称
        String filename = "SupplierList" + DateUtil.getTimes();
        //导出数据信息
        List list = supplierService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

}