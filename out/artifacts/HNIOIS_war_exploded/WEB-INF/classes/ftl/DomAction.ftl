package com.hniois.controller.${demo};

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.${demo}.${demoUp};
import com.hniois.service.${demo}.${demoUp}Manage;
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
@RequestMapping(value="/${demo}")
public class ${demoUp}Action extends BaseController{
    //${demoName}
    @Resource(name="${demo}Service")
    private ${demoUp}Manage ${demo}Service;

    private String ${demo}_list = "${demo}/${demo}_list";
    private String ${demo}_edit = "${demo}/${demo}_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(${demo}_list);
        return mv;
    }

    /**
     * 分页查询
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(${demoUp} e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = ${demo}Service.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
    * @param e          参数
    * @return           json字符串
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(${demoUp} e) throws Exception {
        List<${demoUp}> list = ${demo}Service.findList(e);
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
    public String findCount(${demoUp} e) throws Exception {
        Integer count = ${demo}Service.findCount(e);
        return String.valueOf(count);
    }

    /**
    * 查询
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(${demoUp} e) throws Exception {
        ${demoUp} m = ${demo}Service.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
    * 跳转
    * @param e          参数
    * @return           新增 or 保存页面
    */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(${demoUp} e) throws Exception{
    ModelAndView mv = this.getModelAndView();
        ${demoUp} ${demo} = new ${demoUp}();
        if(StringUtils.isNotEmpty(e.getId())){
            ${demo} = ${demo}Service.find(e);
        }
        ${demo}.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("${demo}",${demo});
        mv.setViewName(${demo}_edit);
        return mv;
    }

    /**
    * 保存
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(${demoUp} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${demoUp} p = new ${demoUp}();
        //条件判断
        if(${demo}Service.findCount(p)>0){
            setMsg(obj,"error","数据已存在!");
        }else{
            ${demo}Service.save(e);
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
    public String update(${demoUp} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${demoUp} p = new ${demoUp}();
        //条件判断
        List<${demoUp}> list = ${demo}Service.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).getId().equals(e.getId()))){
            setMsg(obj,"error","操作失败!");
        }else{
            ${demo}Service.update(e);
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
    public String delete(${demoUp} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        ${demo}Service.delete(e);
        return obj.toString();
    }

    /**
    * 删除
    * @param e          参数
    * @return           json字符串
    * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(${demoUp} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e==null){
            setMsg(obj,"error","操作失败!");
            return obj.toString();
        }
        ${demo}Service.deleteBatch(e);
        return obj.toString();
    }

}