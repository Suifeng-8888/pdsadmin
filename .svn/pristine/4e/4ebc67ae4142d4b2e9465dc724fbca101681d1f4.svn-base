package com.hniois.controller.temp;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.temp.Temp;
import com.hniois.service.temp.TempManage;
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
@RequestMapping(value="/temp")
public class TempAction extends BaseController{
    //模板
    @Resource(name="tempService")
    private TempManage tempService;

    private String temp_page = "temp/temp_page";
    private String temp_list = "temp/temp_list";
    private String temp_edit = "temp/temp_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(temp_list);
        return mv;
    }

    /**
     * 分页查询
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Temp e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = tempService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Temp e) throws Exception {
        List<Temp> list = tempService.findList(e);
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
    public String findCount(Temp e) throws Exception {
        Integer count = tempService.findCount(e);
        return String.valueOf(count);
    }

    /**
    * 查询
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Temp e) throws Exception {
        Temp m = tempService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
    * 跳转
    * @param e          参数
    * @return           新增 or 保存页面
    */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Temp e) throws Exception{
    ModelAndView mv = this.getModelAndView();
        Temp temp = new Temp();
        if(StringUtils.isNotEmpty(e.getId())){
            temp = tempService.find(e);
        }
        temp.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("temp",temp);
        mv.setViewName(temp_edit);
        return mv;
    }

    /**
    * 保存
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Temp e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Temp p = new Temp();
        p.setTemp_id(e.getTemp_id());
        //条件判断
        if(tempService.findCount(p)>0){
            setMsg(obj,"error","模版KEY已存在!");
        }else{
            tempService.save(e);
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
    public String update(Temp e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Temp p = new Temp();
        //条件判断
        List<Temp> list = tempService.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getTemp_id().equals(e.getTemp_id()))){
            setMsg(obj,"error","操作失败!");
        }else{
            tempService.update(e);
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
    public String delete(Temp e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        tempService.delete(e);
        return obj.toString();
    }

    /**
    * 删除
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Temp e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        tempService.deleteBatch(e);
        return obj.toString();
    }

}