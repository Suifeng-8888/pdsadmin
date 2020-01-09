package com.hniois.controller.${packageName};

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.${packageName}.${objectName};
import com.hniois.service.${packageName}.${objectName}Manage;
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
@RequestMapping(value="/${packageName}")
public class ${objectName}Action extends BaseController{
    //用户
    @Resource(name="${packageName}Service")
    private ${objectName}Manage ${packageName}Service;

    private String ${packageName}_list = "system/${packageName}/${packageName}_list";
    private String ${packageName}_edit = "system/${packageName}/${packageName}_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(${packageName}_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(${objectName} e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = ${packageName}Service.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(${objectName} e) throws Exception {
        List<${objectName}> list = ${packageName}Service.findList(e);
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
    public String findCount(${objectName} e) throws Exception {
        Integer count = ${packageName}Service.findCount(e);
        return String.valueOf(count);
    }

    /**
    * 查询
    * @param e
    * @return json
    * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(${objectName} e) throws Exception {
        ${objectName} m = ${packageName}Service.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
    * 新增 or 保存页面
    */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(${objectName} e) throws Exception{
    ModelAndView mv = this.getModelAndView();
        ${objectName} ${packageName} = new ${objectName}();
        if(StringUtils.isNotEmpty(e.getId())){
            ${packageName} = ${packageName}Service.find(e);
        }
        ${packageName}.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("${packageName}",${packageName});
        mv.setViewName(${packageName}_edit);
        return mv;
    }

    /**
    * 保存
    * @param e
    * @return json
    * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(${objectName} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${objectName} p = new ${objectName}();
        //条件判断
        if(${packageName}Service.findCount(p)>0){
            setMsg(obj,"error","数据已存在!");
        }else{
            ${packageName}Service.save(e);
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
    public String update(${objectName} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${objectName} p = new ${objectName}();
        //条件判断
        List<${objectName}> list = ${packageName}Service.findList(p);
        if(list != null && list.size() > 0 && !(list.get(0).get${objectName}_id().equals(e.get${objectName}_id()))){
            setMsg(obj,"error","操作失败!");
        }else{
            ${packageName}Service.update(e);
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
    public String delete(${objectName} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${packageName}Service.delete(e);
        return obj.toString();
    }

    /**
    * 删除
    * @param e
    * @return json
    * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(${objectName} e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        ${packageName}Service.deleteBatch(e);
        return obj.toString();
    }

}