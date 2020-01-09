package com.hniois.controller.tempFiled;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.tempFiled.TempFiled;
import com.hniois.service.tempFiled.TempFiledManage;
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
@RequestMapping(value="/tempFiled")
public class TempFiledAction extends BaseController{
    //模板明细
    @Resource(name="tempFiledService")
    private TempFiledManage tempFiledService;

    private String tempFiled_list = "tempFiled/tempFiled_list";
    private String tempFiled_edit = "tempFiled/tempFiled_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(tempFiled_list);
        return mv;
    }

    /**
     * 分页查询
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(TempFiled e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = tempFiledService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(TempFiled e) throws Exception {
        List<TempFiled> list = tempFiledService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
    * 查询count
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/findCount")
    @ResponseBody
    public String findCount(TempFiled e) throws Exception {
        Integer count = tempFiledService.findCount(e);
        return String.valueOf(count);
    }

    /**
    * 查询
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(TempFiled e) throws Exception {
        TempFiled m = tempFiledService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
    * 跳转
    * @param e          参数
    * @return           新增 or 保存页面
    */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(TempFiled e) throws Exception{
    ModelAndView mv = this.getModelAndView();
        TempFiled tempFiled = new TempFiled();
        if(StringUtils.isNotEmpty(e.getId())){
            tempFiled = tempFiledService.find(e);
        }
        tempFiled.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("tempFiled",tempFiled);
        mv.setViewName(tempFiled_edit);
        return mv;
    }

    /**
    * 保存
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(TempFiled e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        TempFiled p = new TempFiled();
        p.setTemp_id(e.getTemp_id());
        p.setFiled_id(e.getFiled_id());
        //条件判断
        if(tempFiledService.findCount(p)>0){
            setMsg(obj,"error","Key已存在!");
        }else{
            tempFiledService.save(e);
        }
        return obj.toString();
    }

    /**
    * 修改
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(TempFiled e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        TempFiled p = new TempFiled();
        //条件判断
        List<TempFiled> list = tempFiledService.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getId().equals(e.getId()))){
            setMsg(obj,"error","操作失败!");
        }else{
            tempFiledService.update(e);
        }
        return obj.toString();
    }

    /**
    * 删除
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(TempFiled e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        tempFiledService.delete(e);
        return obj.toString();
    }

    /**
    * 删除
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(TempFiled e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        tempFiledService.deleteBatch(e);
        return obj.toString();
    }

}