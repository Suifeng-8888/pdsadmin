package com.hniois.controller.item;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.cate.Cate;
import com.hniois.entity.item.Item;
import com.hniois.entity.send.SendCheck;
import com.hniois.service.cate.CateManage;
import com.hniois.service.item.ItemManage;
import com.hniois.service.send.SendManage;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemAction extends BaseController {
    //样品
    @Resource(name = "itemService")
    private ItemManage itemService;
    //样品分类
    @Resource(name="cateService")
    private CateManage cateService;
//    送检Service
    @Resource(name="sendService")
    private SendManage sendService;


    private String item_list = "item/item_list";
    private String item_edit = "item/item_edit";
    private String send_check = "item/send_check";
    private String item_ypfl = "item/item_ypfl";
    private String item_sybz = "item/item_sybz";

    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(item_list);
        return mv;
    }

    /**
     * 分页查询
     */
    @RequestMapping(value="/list")
    @ResponseBody
    public String list(Item e) throws Exception {
        //获取当前页面
        int currPage = getThisPage(e.getPage());
        //获取每页显示条数
        int limit = getThisLimit(e.getLimit());
        //重新设置对象中分页信息的偏移量和每页显示条数
        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = itemService.findPage(e);
        return JSON.toJSONString(page);
    }


    /**
     * 新增or编辑页面
     * @return
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView edit(Item e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Item item = new Item();
        if(StringUtils.isNotEmpty(e.getId())){
            item = itemService.find(e);
        }
        item.setCode(e.getCode());
        mv.addObject("item",item);
        mv.setViewName(item_edit);
        List<Cate> cates = cateService.findList(new Cate());
        mv.addObject("cates",cates);
        return mv;
    }

    /**
     * 新增
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(Item e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Item item = new Item();
        item.setItem_number(e.getItem_number());// 样品编号校验
        if(itemService.findCount(item) > 0) {
            setMsg(obj,"error","样品编号已存在!");
        } else {
            itemService.save(e);
        }
        return obj.toString();
    }

    /**
     *  更新
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Item e) throws Exception {
       JSONObject obj = getMsg();
       if(StringUtils.isNotEmpty(e.getId())) {
           itemService.update(e);
       } else {
           setMsg(obj,"error", "更新失败参数不能为空!");
       }
        return obj.toString();
    }

    /**
     * 删除数据
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Item e)throws Exception{
        JSONObject obj = getMsg();
        if(StringUtils.isNotEmpty(e.getId())){
            itemService.delete(e);
        } else {
            setMsg(obj,"delete failed","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 批量删除数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(Item e)throws Exception{
        JSONObject obj = getMsg();
        if(e.getData() != null){
            itemService.deleteBatch(e);
        }else{
            setMsg(obj,"delete failed","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 获取送检样品信息
     * @param e
     * @return
     */
    @RequestMapping("/sendCheck")
    @ResponseBody
    public String send(Item e) throws Exception{
        JSONObject obj = getMsg();
        if(e.getData() != null && !e.getData().isEmpty()) {
            //添加到送检列表
            List<Item> items = itemService.sendCheck(e);
            List<SendCheck> sendChecks = new ArrayList<SendCheck>();
            for(Item item : items) {
                SendCheck sc = new SendCheck();
                sc.setItem_number(item.getItem_number());
                sc.setItem_name(item.getItem_name());
                sc.setSerial_number("");
                sc.setTest_results("2");
                sendChecks.add(sc);
            }
            sendService.saveBatch(sendChecks);
            //更新样品送检状态
            e.setChecked("1"); //   1代表已送检
            itemService.updateBatch(e);
        } else {
            setMsg(obj, "error", "参数不能为空!");
        }
        return obj.toString();
    }


    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Item e) throws Exception {
        List<Item> list = itemService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Item e) throws Exception {
        //导出工具
        ExportExcelUtil<Item> export = new ExportExcelUtil<Item>();
        //文件名称
        String filename = "ItemList" + DateUtil.getTimes();
        //导出数据信息
        List list = itemService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }

    /**
     * 样品分类选择
     * @return
     */
    @RequestMapping("/ypfl")
    public ModelAndView ypfl(){
        ModelAndView mv = getModelAndView();
        mv.setViewName(item_ypfl);
        return mv;
    }

    /**
     * 使用标准选择
     * @return
     */
    @RequestMapping("/sybz")
    public ModelAndView sybz(){
        ModelAndView mv = getModelAndView();
        mv.setViewName(item_sybz);
        return mv;
    }
}
